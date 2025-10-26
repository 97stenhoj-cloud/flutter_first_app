#!/usr/bin/env python3
"""
Auto-Translate L10N Files Using ChatGPT
This script translates app_en.arb to all other languages using OpenAI's ChatGPT API.
Requires: pip install openai

Available models (use gpt-4o-mini for best value):
- gpt-4o-mini (default) - Cheapest, good quality (~$0.02 for all languages)
- gpt-4o - Better quality (~$0.50 for all languages)
- gpt-4-turbo - Highest quality (~$2.00 for all languages)

Usage:
1. Get API key from: https://platform.openai.com/api-keys
2. pip3 install openai
3. python3 translate_with_chatgpt.py
"""

import json
import os
import re

try:
    from openai import OpenAI
    print("✅ openai library found")
except ImportError:
    print("❌ openai library not found!")
    print("\nPlease install it:")
    print("  pip install openai")
    print("\nOr:")
    print("  pip3 install openai")
    exit(1)

# Language mappings
LANGUAGES = {
    'da': {'name': 'Danish', 'native_name': 'Dansk', 'flag': '🇩🇰'},
    'de': {'name': 'German', 'native_name': 'Deutsch', 'flag': '🇩🇪'},
    'es': {'name': 'Spanish', 'native_name': 'Español', 'flag': '🇪🇸'},
    'pt': {'name': 'Portuguese', 'native_name': 'Português', 'flag': '🇵🇹'},
    'ro': {'name': 'Romanian', 'native_name': 'Română', 'flag': '🇷🇴'},
}

# Context about the app
APP_CONTEXT = """
This is a conversation card game app called "Connect" for couples, friends, and families.
It helps people have meaningful conversations through question prompts.
The app has different game modes (Couple, Friends, Family) and categories of questions.
Keep translations natural, conversational, and appropriate for the context.
"""

# Parameter pattern
PARAMETER_PATTERN = r'\{[^}]+\}'


def get_api_key():
    """Get OpenAI API key from user."""
    print("🔑 OpenAI API Key Setup")
    print("-" * 50)
    print()
    print("You need an OpenAI API key to use this script.")
    print("Get one at: https://platform.openai.com/api-keys")
    print()
    
    # Check environment variable first
    api_key = os.environ.get('OPENAI_API_KEY')
    if api_key:
        print("✅ Found API key in environment variable")
        return api_key
    
    # Ask user
    api_key = input("Enter your OpenAI API key: ").strip()
    
    if not api_key:
        print("❌ No API key provided")
        exit(1)
    
    return api_key


def translate_batch_with_chatgpt(texts, target_lang, lang_name, client, model="gpt-4o-mini"):
    """Translate multiple texts at once using ChatGPT."""
    
    # Prepare batch for translation
    batch_text = ""
    for i, text in enumerate(texts):
        batch_text += f"{i}||{text}\n"
    
    prompt = f"""You are a professional translator for a mobile app called "Connect" - a conversation card game for couples, friends, and families.

CONTEXT:
{APP_CONTEXT}

TASK:
Translate the following English texts to {lang_name} ({LANGUAGES[target_lang]['native_name']}).

IMPORTANT RULES:
1. Preserve ALL parameters in curly braces exactly as they are: {{count}}, {{name}}, {{bundle}}, etc.
2. Keep the format: "number||translated_text" (same number, translated text)
3. Be natural and conversational, not formal or robotic
4. Use appropriate tone for a social/relationship app
5. If text contains technical terms (like "Bundle", "Premium"), keep them or adapt appropriately
6. For game-related terms, use natural gaming language in target language

TEXTS TO TRANSLATE:
{batch_text}

RESPOND WITH ONLY THE TRANSLATED LINES IN SAME FORMAT:
number||translated_text"""

    try:
        # Use correct OpenAI chat completions API
        response = client.chat.completions.create(
            model=model,
            messages=[
                {"role": "system", "content": "You are a professional app translator. Respond ONLY with translated text in the exact format requested."},
                {"role": "user", "content": prompt}
            ],
            temperature=0.3,  # Lower temperature for more consistent translations
            max_tokens=2000,  # Adjust based on batch size
        )
        
        # Parse response
        translated_text = response.choices[0].message.content.strip()
        translations = {}
        
        for line in translated_text.split('\n'):
            if '||' in line:
                idx, translation = line.split('||', 1)
                try:
                    translations[int(idx)] = translation.strip()
                except ValueError:
                    continue
        
        return translations
    
    except Exception as e:
        print(f"\n  ⚠️  ChatGPT API error: {e}")
        return {}


def translate_arb(source_arb, target_lang_code, lang_info, client, batch_size=10):
    """Translate entire ARB file using ChatGPT in batches."""
    print(f"\n🔄 Translating to {lang_info['name']} using ChatGPT...")
    
    translated = {
        "@@locale": target_lang_code
    }
    
    # Collect texts to translate
    texts_to_translate = []
    text_keys = []
    
    for key, value in source_arb.items():
        if key.startswith('@@') or not isinstance(value, str):
            translated[key] = value
            continue
        
        texts_to_translate.append(value)
        text_keys.append(key)
    
    total = len(texts_to_translate)
    print(f"  📝 Total strings to translate: {total}")
    print(f"  🤖 Using model: gpt-4o-mini")
    print()
    
    # Translate in batches
    for i in range(0, total, batch_size):
        batch_end = min(i + batch_size, total)
        batch = texts_to_translate[i:batch_end]
        batch_keys = text_keys[i:batch_end]
        
        print(f"  [{i+1}-{batch_end}/{total}] Translating batch...", end='', flush=True)
        
        translations = translate_batch_with_chatgpt(
            batch, 
            target_lang_code, 
            lang_info['name'], 
            client
        )
        
        # Apply translations
        for j, key in enumerate(batch_keys):
            if j in translations:
                translated[key] = translations[j]
            else:
                # Fallback to original if translation failed
                translated[key] = texts_to_translate[i + j]
        
        print(" ✓")
    
    return translated


def load_arb_file(file_path):
    """Load ARB file."""
    try:
        with open(file_path, 'r', encoding='utf-8') as f:
            return json.load(f)
    except Exception as e:
        print(f"❌ Error loading {file_path}: {e}")
        return None


def save_arb_file(file_path, data):
    """Save ARB file with proper formatting."""
    try:
        with open(file_path, 'w', encoding='utf-8') as f:
            json.dump(data, f, ensure_ascii=False, indent=2)
        return True
    except Exception as e:
        print(f"❌ Error saving {file_path}: {e}")
        return False


def generate_dart_class(lang_code, lang_name, arb_data):
    """Generate app_localizations_XX.dart file."""
    
    class_name = f"AppLocalizations{lang_code.capitalize()}"
    
    class_content = f"""import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for {lang_name} (`{lang_code}`).
class {class_name} extends AppLocalizations {{
  {class_name}([String locale = '{lang_code}']) : super(locale);
"""
    
    # Add getters
    for key, value in arb_data.items():
        if key.startswith('@@'):
            continue
        
        # Check if it has parameters
        params = re.findall(PARAMETER_PATTERN, value)
        
        if params:
            # Method with parameters
            param_names = [p.strip('{}') for p in params]
            param_list = ', '.join([f'Object {p}' for p in param_names])
            
            # Escape single quotes in value
            escaped_value = value.replace("'", "\\'")
            
            # Replace {param} with $param
            method_value = escaped_value
            for param in param_names:
                method_value = method_value.replace(f'{{{param}}}', f'${param}')
            
            class_content += f"""
  @override
  String {key}({param_list}) {{
    return '{method_value}';
  }}
"""
        else:
            # Simple getter
            escaped_value = value.replace("'", "\\'")
            class_content += f"""
  @override
  String get {key} => '{escaped_value}';
"""
    
    class_content += "}\n"
    
    return class_content


def estimate_cost(num_strings, batch_size=10):
    """Estimate API cost."""
    # GPT-4o-mini pricing (as of 2024)
    # Input: $0.150 per 1M tokens
    # Output: $0.600 per 1M tokens
    # Rough estimate: ~100 tokens per batch of 10 strings
    
    num_batches = (num_strings + batch_size - 1) // batch_size
    estimated_tokens = num_batches * 200  # 100 input + 100 output per batch
    estimated_cost = (estimated_tokens / 1_000_000) * 0.375  # Average of input/output
    
    return estimated_cost


def main():
    print("=" * 70)
    print("🌍 Auto-Translate L10N Files Using ChatGPT")
    print("=" * 70)
    print()
    print("This will translate app_en.arb to:")
    for code, info in LANGUAGES.items():
        print(f"  {info['flag']} {info['name']} ({info['native_name']})")
    print()
    
    # Get API key
    api_key = get_api_key()
    client = OpenAI(api_key=api_key)
    
    print()
    
    # Get project root
    project_root = input("Enter Flutter project root (or press Enter for current dir): ").strip()
    if not project_root:
        project_root = os.getcwd()
    
    l10n_dir = os.path.join(project_root, 'lib', 'l10n')
    
    if not os.path.exists(l10n_dir):
        print(f"❌ Error: l10n directory not found: {l10n_dir}")
        return
    
    # Load source file
    source_file = os.path.join(l10n_dir, 'app_en.arb')
    print(f"📖 Loading source: {source_file}")
    
    source_arb = load_arb_file(source_file)
    if not source_arb:
        return
    
    num_strings = len([k for k in source_arb.keys() if not k.startswith('@@')])
    print(f"✅ Loaded {num_strings} strings to translate")
    
    # Estimate cost
    estimated_cost = estimate_cost(num_strings * len(LANGUAGES))
    print(f"💰 Estimated API cost: ${estimated_cost:.4f} (for all 5 languages)")
    print()
    
    # Confirm
    response = input("⚠️  This will use OpenAI API credits. Continue? (yes/no): ").strip().lower()
    if response not in ['yes', 'y']:
        print("❌ Cancelled")
        return
    
    # Translate to each language
    for lang_code, lang_info in LANGUAGES.items():
        try:
            # Translate ARB
            translated_arb = translate_arb(source_arb, lang_code, lang_info, client)
            
            # Save ARB file
            arb_path = os.path.join(l10n_dir, f'app_{lang_code}.arb')
            if save_arb_file(arb_path, translated_arb):
                print(f"  ✅ Saved: app_{lang_code}.arb")
            
            # Generate Dart class
            dart_content = generate_dart_class(lang_code, lang_info['name'], translated_arb)
            dart_path = os.path.join(l10n_dir, f'app_localizations_{lang_code}.dart')
            
            with open(dart_path, 'w', encoding='utf-8') as f:
                f.write(dart_content)
            print(f"  ✅ Saved: app_localizations_{lang_code}.dart")
            
            print(f"  {lang_info['flag']} {lang_info['name']} complete!\n")
            
        except Exception as e:
            print(f"  ❌ Error translating {lang_info['name']}: {e}\n")
            continue
    
    # Summary
    print()
    print("=" * 70)
    print("🎉 TRANSLATION COMPLETE!")
    print("=" * 70)
    print()
    print("📋 Next steps:")
    print("  1. Run: flutter pub get")
    print("  2. Run: flutter gen-l10n")
    print("  3. Run: flutter run")
    print("  4. Test all languages in Settings → Language")
    print()
    print("✨ ChatGPT translations are context-aware and natural!")
    print("   But still review important strings for accuracy.")
    print()


if __name__ == "__main__":
    main()
