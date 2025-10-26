#!/usr/bin/env python3
"""
Auto-Translate L10N Files
This script translates app_en.arb to all other languages using Google Translate.
Requires: pip install deep-translator
"""

import json
import os
import time
import re

try:
    from deep_translator import GoogleTranslator
    print("✅ deep-translator library found")
except ImportError:
    print("❌ deep-translator not found!")
    print("\nPlease install it:")
    print("  pip install deep-translator")
    print("\nOr:")
    print("  pip3 install deep-translator")
    exit(1)

# Language mappings
LANGUAGES = {
    'da': {'name': 'Danish', 'flag': '🇩🇰', 'code': 'da'},
    'de': {'name': 'German', 'flag': '🇩🇪', 'code': 'de'},
    'es': {'name': 'Spanish', 'flag': '🇪🇸', 'code': 'es'},
    'pt': {'name': 'Portuguese', 'flag': '🇵🇹', 'code': 'pt'},
    'ro': {'name': 'Romanian', 'flag': '🇷🇴', 'code': 'ro'},
}

# Keys to skip (metadata)
SKIP_KEYS = ['@@locale']

# Keys with parameters that need special handling
PARAMETER_PATTERN = r'\{[^}]+\}'


def preserve_parameters(text):
    """Extract parameters from text."""
    return re.findall(PARAMETER_PATTERN, text)


def restore_parameters(translated_text, original_params):
    """Restore parameters in translated text."""
    if not original_params:
        return translated_text
    
    # Find any {xxx} patterns in translated text
    translated_params = re.findall(PARAMETER_PATTERN, translated_text)
    
    # Replace translated parameters with original ones
    result = translated_text
    for i, orig_param in enumerate(original_params):
        if i < len(translated_params):
            result = result.replace(translated_params[i], orig_param, 1)
    
    return result


def translate_text(text, target_lang, source_lang='en'):
    """Translate text while preserving parameters."""
    if not text or text.startswith('@@'):
        return text
    
    # Extract parameters
    params = preserve_parameters(text)
    
    # Replace parameters with placeholders for translation
    temp_text = text
    for i, param in enumerate(params):
        temp_text = temp_text.replace(param, f'__PARAM{i}__', 1)
    
    try:
        # Translate
        translator = GoogleTranslator(source=source_lang, target=target_lang)
        translated = translator.translate(temp_text)
        
        # Restore parameters
        for i, param in enumerate(params):
            translated = translated.replace(f'__PARAM{i}__', param)
        
        return translated
    except Exception as e:
        print(f"  ⚠️  Translation error: {e}")
        return text  # Return original on error


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


def translate_arb(source_arb, target_lang_code, target_lang_name):
    """Translate entire ARB file."""
    print(f"\n🔄 Translating to {target_lang_name}...")
    
    translated = {
        "@@locale": target_lang_code
    }
    
    total_keys = len([k for k in source_arb.keys() if not k.startswith('@@')])
    current = 0
    
    for key, value in source_arb.items():
        if key.startswith('@@'):
            continue
        
        current += 1
        
        # Skip if not a string
        if not isinstance(value, str):
            translated[key] = value
            continue
        
        # Translate
        print(f"  [{current}/{total_keys}] {key[:30]}...", end='', flush=True)
        
        translated_value = translate_text(value, target_lang_code)
        translated[key] = translated_value
        
        print(" ✓")
        
        # Small delay to avoid rate limiting
        time.sleep(0.1)
    
    return translated


def generate_dart_class(lang_code, lang_name, arb_data):
    """Generate app_localizations_XX.dart file."""
    
    class_content = f"""import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for {lang_name} (`{lang_code}`).
class AppLocalizations{lang_code.capitalize()} extends AppLocalizations {{
  AppLocalizations{lang_code.capitalize()}([String locale = '{lang_code}']) : super(locale);
"""
    
    # Add getters
    for key, value in arb_data.items():
        if key.startswith('@@'):
            continue
        
        # Check if it has parameters
        params = preserve_parameters(value)
        
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


def main():
    print("=" * 70)
    print("🌍 Auto-Translate L10N Files")
    print("=" * 70)
    print()
    print("This will translate app_en.arb to:")
    for code, info in LANGUAGES.items():
        print(f"  {info['flag']} {info['name']} (app_{code}.arb)")
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
    
    print(f"✅ Loaded {len(source_arb)} keys")
    
    # Confirm
    print()
    response = input("⚠️  This will overwrite existing files. Continue? (yes/no): ").strip().lower()
    if response not in ['yes', 'y']:
        print("❌ Cancelled")
        return
    
    # Translate to each language
    for lang_code, lang_info in LANGUAGES.items():
        # Translate ARB
        translated_arb = translate_arb(source_arb, lang_code, lang_info['name'])
        
        # Save ARB file
        arb_path = os.path.join(l10n_dir, f'app_{lang_code}.arb')
        if save_arb_file(arb_path, translated_arb):
            print(f"  ✅ Saved: app_{lang_code}.arb")
        
        # Generate Dart class
        dart_content = generate_dart_class(lang_code, lang_info['name'], translated_arb)
        dart_path = os.path.join(l10n_dir, f'app_localizations_{lang_code}.dart')
        
        try:
            with open(dart_path, 'w', encoding='utf-8') as f:
                f.write(dart_content)
            print(f"  ✅ Saved: app_localizations_{lang_code}.dart")
        except Exception as e:
            print(f"  ❌ Error saving Dart file: {e}")
        
        print(f"  {lang_info['flag']} {lang_info['name']} complete!")
    
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
    print("⚠️  Note: Auto-translations may need manual review")
    print("   Check translations for accuracy and natural phrasing")
    print()


if __name__ == "__main__":
    main()
