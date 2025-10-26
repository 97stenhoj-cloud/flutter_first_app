#!/usr/bin/env python3
"""
Fix All L10N Issues
This script fixes:
1. Removes 'const' keywords from widgets using l10n
2. Adds mounted checks after async operations
3. Removes unused imports
"""

import re
import os

FILES_TO_FIX = [
    "lib/features/custom/presentation/pages/custom_deck_list_page.dart",
    "lib/features/custom/presentation/pages/question_editor_page.dart",
    "lib/features/pandora/presentation/pages/pandora_host_page.dart",
    "lib/features/pandora/presentation/pages/pandora_join_page.dart",
    "lib/features/pandora/presentation/pages/pandora_lobby_page.dart",
    "lib/features/pandora/presentation/pages/pandora_question_submission_page.dart",
    "lib/features/pandora/presentation/pages/pandora_timer_selection_page.dart",
    "lib/features/game/presentation/pages/game_mode_selection_page.dart",
]


def remove_const_before_l10n(content):
    """Remove 'const' keyword before widgets that use l10n."""
    changes = 0
    
    # Pattern 1: const SnackBar(content: Text(l10n.
    pattern1 = r'\bconst\s+(SnackBar\(content:\s*Text\(l10n\.)'
    content, count1 = re.subn(pattern1, r'\1', content)
    changes += count1
    
    # Pattern 2: const Text(l10n.
    pattern2 = r'\bconst\s+(Text\(l10n\.)'
    content, count2 = re.subn(pattern2, r'\1', content)
    changes += count2
    
    # Pattern 3: const SnackBar with l10n anywhere inside
    pattern3 = r'\bconst\s+(SnackBar\([^)]*l10n\.)'
    content, count3 = re.subn(pattern3, r'\1', content)
    changes += count3
    
    return content, changes


def add_mounted_checks(content):
    """Add mounted checks after async operations that use context."""
    changes = 0
    
    # Find catch blocks that use ScaffoldMessenger or Navigator without mounted check
    # Pattern: } catch (e) { \n ScaffoldMessenger.of(context) or Navigator.pop(context)
    
    # Pattern 1: catch block with ScaffoldMessenger
    pattern1 = r'(\} catch \([^)]+\) \{)\s*\n(\s*)(ScaffoldMessenger\.of\(context\))'
    replacement1 = r'\1\n\2if (!mounted) return;\n\2\3'
    
    # Check if mounted check doesn't already exist
    matches = re.finditer(pattern1, content)
    for match in matches:
        # Check if there's already a mounted check nearby
        start = max(0, match.start() - 100)
        end = min(len(content), match.end() + 100)
        context_snippet = content[start:end]
        if 'if (!mounted) return;' not in context_snippet and 'if (mounted)' not in context_snippet:
            content = content[:match.start()] + re.sub(pattern1, replacement1, content[match.start():match.end()]) + content[match.end():]
            changes += 1
    
    # Pattern 2: catch block with Navigator.pop
    pattern2 = r'(\} catch \([^)]+\) \{)\s*\n(\s*)(Navigator\.pop\(context)'
    replacement2 = r'\1\n\2if (!mounted) return;\n\2\3'
    
    matches = re.finditer(pattern2, content)
    for match in matches:
        start = max(0, match.start() - 100)
        end = min(len(content), match.end() + 100)
        context_snippet = content[start:end]
        if 'if (!mounted) return;' not in context_snippet and 'if (mounted)' not in context_snippet:
            content = content[:match.start()] + re.sub(pattern2, replacement2, content[match.start():match.end()]) + content[match.end():]
            changes += 1
    
    return content, changes


def remove_unused_imports(content, filename):
    """Remove specific unused imports."""
    changes = 0
    
    # Remove unused app_constants import from game_mode_selection_page
    if 'game_mode_selection_page.dart' in filename:
        pattern = r"import\s+['\"].*?app_constants\.dart['\"];\s*\n"
        if "AppConstants" not in content:  # Only remove if actually unused
            content, count = re.subn(pattern, '', content)
            changes += count
    
    # Remove unused app_localizations import from pandora_timer_selection_page
    if 'pandora_timer_selection_page.dart' in filename:
        pattern = r"import\s+['\"].*?app_localizations\.dart['\"];\s*\n"
        # Check if l10n is actually used
        if 'l10n.' not in content and 'AppLocalizations' not in content:
            content, count = re.subn(pattern, '', content)
            changes += count
    
    return content, changes


def fix_file(file_path):
    """Fix all issues in a single file."""
    if not os.path.exists(file_path):
        return {'success': False, 'error': 'File not found', 'changes': {}}
    
    try:
        # Read file
        with open(file_path, 'r', encoding='utf-8') as f:
            content = f.read()
        
        original_content = content
        changes = {
            'const_removed': 0,
            'mounted_checks': 0,
            'imports_removed': 0
        }
        
        # Apply fixes
        content, const_changes = remove_const_before_l10n(content)
        changes['const_removed'] = const_changes
        
        content, mounted_changes = add_mounted_checks(content)
        changes['mounted_checks'] = mounted_changes
        
        content, import_changes = remove_unused_imports(content, file_path)
        changes['imports_removed'] = import_changes
        
        # Only write if changes were made
        if content != original_content:
            # Create backup
            backup_path = file_path + '.backup2'
            with open(backup_path, 'w', encoding='utf-8') as f:
                f.write(original_content)
            
            # Write fixed content
            with open(file_path, 'w', encoding='utf-8') as f:
                f.write(content)
            
            return {'success': True, 'changes': changes, 'modified': True}
        else:
            return {'success': True, 'changes': changes, 'modified': False}
    
    except Exception as e:
        return {'success': False, 'error': str(e), 'changes': {}}


def main():
    print("=" * 70)
    print("🔧 Fix All L10N Issues")
    print("=" * 70)
    print()
    print("This script will:")
    print("  1. Remove 'const' keywords from widgets using l10n")
    print("  2. Add mounted checks after async operations")
    print("  3. Remove unused imports")
    print()
    
    # Get project root
    project_root = input("Enter Flutter project root (or press Enter for current dir): ").strip()
    if not project_root:
        project_root = os.getcwd()
    
    print(f"📁 Project: {project_root}")
    print()
    
    # Process files
    results = []
    total_changes = {
        'const_removed': 0,
        'mounted_checks': 0,
        'imports_removed': 0
    }
    
    for file_path in FILES_TO_FIX:
        full_path = os.path.join(project_root, file_path)
        filename = os.path.basename(file_path)
        
        print(f"🔄 Processing: {filename}")
        result = fix_file(full_path)
        results.append({'file': filename, **result})
        
        if result['success']:
            if result.get('modified'):
                changes = result['changes']
                print(f"   ✅ Fixed!")
                if changes['const_removed'] > 0:
                    print(f"      - Removed {changes['const_removed']} 'const' keywords")
                    total_changes['const_removed'] += changes['const_removed']
                if changes['mounted_checks'] > 0:
                    print(f"      - Added {changes['mounted_checks']} mounted checks")
                    total_changes['mounted_checks'] += changes['mounted_checks']
                if changes['imports_removed'] > 0:
                    print(f"      - Removed {changes['imports_removed']} unused imports")
                    total_changes['imports_removed'] += changes['imports_removed']
            else:
                print(f"   ✓ No changes needed")
        else:
            print(f"   ❌ Error: {result.get('error', 'Unknown error')}")
        print()
    
    # Summary
    print("=" * 70)
    print("📊 SUMMARY")
    print("=" * 70)
    
    successful = sum(1 for r in results if r['success'])
    modified = sum(1 for r in results if r.get('modified', False))
    
    print(f"✅ Processed: {successful}/{len(results)} files")
    print(f"📝 Modified: {modified} files")
    print()
    print(f"Total changes:")
    print(f"  - 'const' keywords removed: {total_changes['const_removed']}")
    print(f"  - Mounted checks added: {total_changes['mounted_checks']}")
    print(f"  - Unused imports removed: {total_changes['imports_removed']}")
    print()
    
    if modified > 0:
        print("🎉 All issues fixed!")
        print()
        print("📋 Next steps:")
        print("  1. Run: flutter pub get")
        print("  2. Run: flutter analyze")
        print("  3. Run: flutter run")
        print()
        print("⚠️  Backup files created with .backup2 extension")
    else:
        print("✨ No issues found - files are already correct!")
    
    print()


if __name__ == "__main__":
    main()
