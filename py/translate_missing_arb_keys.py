"""
Translate missing ARB keys to all languages
Only translates keys that exist in app_en.arb but are missing from other language files
"""

import json
import os
from openai import OpenAI
from dotenv import load_dotenv
import time

# Load API key
load_dotenv()
client = OpenAI(api_key=os.getenv("OPENAI_API_KEY"))

# Language mapping
LANGUAGES = {
    'da': 'Danish',
    'de': 'German',
    'es': 'Spanish',
    'fi': 'Finnish',
    'fr': 'French',
    'it': 'Italian',
    'nl': 'Dutch',
    'no': 'Norwegian',
    'pl': 'Polish',
    'pt': 'Portuguese',
    'ro': 'Romanian',
    'sv': 'Swedish'
}

ARB_DIR = '/Users/stenhoej/Desktop/flutter_first_app/lib/l10n'

def translate_text(text, target_lang_name, key_name):
    """Translate text using OpenAI API"""
    try:
        response = client.chat.completions.create(
            model="gpt-4o-mini",
            messages=[
                {
                    "role": "system",
                    "content": f"""You are a professional translator for a mobile app.
Translate from English to {target_lang_name}.

IMPORTANT RULES:
1. Preserve ALL placeholders like {{deckName}}, {{number}}, {{count}}, etc. exactly as they appear
2. Keep the same tone and style as the original
3. For UI elements, keep translations concise
4. Return ONLY the translated text, nothing else
5. If the text contains technical terms like "Premium", "AI", "RLS", keep them in English"""
                },
                {
                    "role": "user",
                    "content": f"Translate this app text:\n\n{text}"
                }
            ],
            temperature=0.3,
            max_tokens=500
        )

        translation = response.choices[0].message.content.strip()

        # Remove quotes if present
        if translation.startswith('"') and translation.endswith('"'):
            translation = translation[1:-1]

        return translation

    except Exception as e:
        print(f"  ❌ Error translating: {e}")
        return None

def main():
    print("=" * 80)
    print("Translate Missing ARB Keys")
    print("=" * 80)
    print()

    # Load English ARB
    en_path = os.path.join(ARB_DIR, 'app_en.arb')
    with open(en_path, 'r', encoding='utf-8') as f:
        en_data = json.load(f)

    # Get English translation keys only
    en_keys = {k: v for k, v in en_data.items() if not k.startswith('@')}

    total_translations = 0

    # Process each language
    for lang_code, lang_name in LANGUAGES.items():
        print(f"\n📝 Processing {lang_name} ({lang_code})...")

        # Load existing translations
        lang_path = os.path.join(ARB_DIR, f'app_{lang_code}.arb')
        with open(lang_path, 'r', encoding='utf-8') as f:
            lang_data = json.load(f)

        # Find missing keys
        lang_keys = {k for k in lang_data.keys() if not k.startswith('@')}
        missing_keys = set(en_keys.keys()) - lang_keys

        if not missing_keys:
            print(f"  ✅ No missing keys!")
            continue

        print(f"  Found {len(missing_keys)} missing keys")

        # Translate missing keys
        for i, key in enumerate(sorted(missing_keys), 1):
            en_text = en_keys[key]

            print(f"  [{i}/{len(missing_keys)}] {key}...", end=" ")

            # Translate
            translation = translate_text(en_text, lang_name, key)

            if translation:
                # Add translation to lang_data
                lang_data[key] = translation
                total_translations += 1
                print(f"✅")
            else:
                print(f"❌ FAILED")

            # Rate limiting
            time.sleep(0.5)

        # Save updated file
        # Sort keys alphabetically (keeping @ metadata at the end)
        translation_keys = {k: v for k, v in sorted(lang_data.items()) if not k.startswith('@')}
        metadata_keys = {k: v for k, v in sorted(lang_data.items()) if k.startswith('@')}
        sorted_data = {**translation_keys, **metadata_keys}

        with open(lang_path, 'w', encoding='utf-8') as f:
            json.dump(sorted_data, f, ensure_ascii=False, indent=2)

        print(f"  💾 Saved {lang_path}")

    print()
    print("=" * 80)
    print(f"✨ Complete! Translated {total_translations} missing keys across all languages")
    print("=" * 80)

if __name__ == "__main__":
    main()
