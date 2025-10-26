#!/usr/bin/env python3
"""
Automatic L10N String Replacer
This script replaces hardcoded strings in Dart files with l10n translations.
"""

import re
import os
from pathlib import Path
from typing import Dict, List, Tuple

# Mapping of hardcoded strings to l10n keys
STRING_MAPPINGS = {
    # Category Selection Page
    "Show Less": "l10n.showLess",
    "Read More": "l10n.readMore",
    "Tap to Play": "l10n.tapToPlay",
    "Couple Bundle": "l10n.coupleBundle",
    "Friends Bundle": "l10n.friendsBundle",
    "Family Bundle": "l10n.familyBundle",
    
    # Game Page
    "Favorites": "l10n.favorites",
    
    # Pandora Entry Page
    "Host creates session and shares PIN": "l10n.pandoraHostCreatePin",
    "Players join (max 15 min)": "l10n.pandoraPlayersJoinMax",
    "Host sets question timer (1-15 min)": "l10n.pandoraHostSetsTimer",
    "Everyone submits questions": "l10n.pandoraEveryoneSubmits",
    "Host controls game progression": "l10n.pandoraHostControls",
    "Questions deleted after game": "l10n.pandoraQuestionsDeleted",
    "Host": "l10n.pandoraHost",
    "Join Game": "l10n.pandoraJoinGame",
    "Pandora Box": "l10n.pandoraPandoraBox",
    
    # Pandora Host Page
    "Please enter your name": "l10n.pleaseEnterName",
    "(Host)": "l10n.hostSuffix",
    "Players join with their names": "l10n.playersJoinWithNames",
    "Everyone submits questions (min 5)": "l10n.everyoneSubmitsMin5",
    "Create Session": "l10n.createSession",
    "Creating...": "l10n.creating",
    "Your Name": "l10n.yourName",
    "Enter your display name": "l10n.enterDisplayName",
    "How It Works": "l10n.howItWorks",
    
    # Pandora Lobby Page
    "PIN copied to clipboard!": "l10n.pinCopied",
    "End Session?": "l10n.endSession",
    "Are you sure you want to end this Pandora session?": "l10n.endSessionConfirm",
    "End": "l10n.end",
    "Session PIN": "l10n.sessionPin",
    "Share this PIN with players": "l10n.sharePin",
    "Waiting for players...": "l10n.waitingForPlayers",
    "Start Game": "l10n.startGame",
    "Lobby": "l10n.lobby",
    " (Host)": "l10n.hostLabel",
    
    # Pandora Timer Selection
    "Select Timer": "l10n.selectTimer",
    "How long should players have to submit questions?": "l10n.timerQuestion",
    "minutes": "l10n.minutes",
    "Start Collecting Questions": "l10n.startCollectingQuestions",
    
    # Pandora Question Submission
    "Session cancelled": "l10n.sessionCancelled",
    "Question cannot be empty": "l10n.questionCannotBeEmpty",
    "Question submitted!": "l10n.questionSubmitted",
    "Failed to submit question": "l10n.failedToSubmit",
    "Submit Questions": "l10n.submitQuestions",
    "Submit at least 5 questions to start the game": "l10n.submitMinimum5",
    "Your Question": "l10n.yourQuestion",
    "Enter your question here...": "l10n.enterQuestionHere",
    "For Everyone": "l10n.forEveryone",
    "For Specific Person": "l10n.forSpecificPerson",
    "Submit": "l10n.submit",
    "Start Game!": "l10n.startGameExclamation",
    "Cancel Session": "l10n.cancelSession",
    "Time Remaining": "l10n.timeRemaining",
    
    # Pandora Join Page
    "Please enter a PIN": "l10n.pleaseEnterPin",
    "Session not found": "l10n.sessionNotFound",
    "Session has ended": "l10n.sessionEnded",
    "Session has already started": "l10n.sessionStarted",
    "Failed to join session": "l10n.failedToJoin",
    "Join Session": "l10n.joinSession",
    "Joining...": "l10n.joining",
    "Enter 6-digit PIN": "l10n.enterPin",
    "Join": "l10n.join",
    
    # Session Stats Page
    "Reaction Breakdown": "l10n.reactionBreakdown",
    "Laugh": "l10n.laugh",
    "Shock": "l10n.shock",
    "Heart": "l10n.heart",
    "Fire": "l10n.fire",
    "Most Laughs": "l10n.mostLaughs",
    "Most Shocked": "l10n.mostShocked",
    "Most Hearts": "l10n.mostHearts",
    "Session Complete!": "l10n.sessionComplete",
    "Thanks for playing Pandora Box!": "l10n.thanksForPlayingPandora",
    "Return to Menu": "l10n.returnToMenu",
    
    # Custom Deck List Page
    "Failed to create deck": "l10n.failedToCreateDeck",
    "Create New Deck": "l10n.createNewDeck",
    "Deck Name": "l10n.deckName",
    "Enter deck name": "l10n.enterDeckName",
    "Create": "l10n.create",
    "Delete Deck": "l10n.deleteDeck",
    "Delete": "l10n.delete",
    "Deck deleted": "l10n.deckDeleted",
    "Failed to delete deck": "l10n.failedToDeleteDeck",
    "My Decks": "l10n.myDecks",
    "No decks yet": "l10n.noDecksYet",
    "Create your first custom deck!": "l10n.createFirstDeck",
    
    # Question Editor Page
    "Question added!": "l10n.questionAdded",
    "Failed to add question": "l10n.failedToAddQuestion",
    "Edit Question": "l10n.editQuestion",
    "Enter your question": "l10n.enterYourQuestion",
    "Save": "l10n.save",
    "Question updated!": "l10n.questionUpdated",
    "Failed to update question": "l10n.failedToUpdateQuestion",
    "Delete Question": "l10n.deleteQuestion",
    "Are you sure you want to delete this question?": "l10n.deleteQuestionConfirm",
    "Question deleted": "l10n.questionDeleted",
    "Failed to delete question": "l10n.failedToDeleteQuestion",
    "Add Question": "l10n.addQuestion",
    "Type your question here...": "l10n.typeQuestionHere",
    "Add": "l10n.add",
    "No questions yet": "l10n.noQuestionsYet",
    "Add your first question!": "l10n.addFirstQuestion",
}

# Files to process with their paths
FILES_TO_PROCESS = [
    "lib/features/game/presentation/pages/category_selection_page.dart",
    "lib/features/game/presentation/pages/game_page.dart",
    "lib/features/pandora/presentation/pages/pandora_entry_page.dart",
    "lib/features/pandora/presentation/pages/pandora_host_page.dart",
    "lib/features/pandora/presentation/pages/pandora_lobby_page.dart",
    "lib/features/pandora/presentation/pages/pandora_timer_selection_page.dart",
    "lib/features/pandora/presentation/pages/pandora_question_submission_page.dart",
    "lib/features/pandora/presentation/pages/pandora_join_page.dart",
    "lib/features/pandora/presentation/pages/session_stats_page.dart",
    "lib/features/custom/presentation/pages/custom_deck_list_page.dart",
    "lib/features/custom/presentation/pages/question_editor_page.dart",
]

L10N_IMPORT = "import '../../../../l10n/app_localizations.dart';"


def escape_for_regex(text: str) -> str:
    """Escape special regex characters in string."""
    return re.escape(text)


def add_l10n_import(content: str, file_path: str) -> Tuple[str, bool]:
    """Add l10n import if not present."""
    # Check if already imported
    if "app_localizations.dart" in content:
        return content, False
    
    # Find the last import statement
    import_pattern = r'^import .*?;$'
    imports = list(re.finditer(import_pattern, content, re.MULTILINE))
    
    if imports:
        # Add after last import
        last_import = imports[-1]
        insert_pos = last_import.end()
        
        # Determine correct import path based on file location
        depth = file_path.count('/') - 1  # Subtract 1 for 'lib'
        relative_path = '../' * (depth - 2)  # Adjust based on depth
        import_statement = f"\nimport '{relative_path}l10n/app_localizations.dart';"
        
        content = content[:insert_pos] + import_statement + content[insert_pos:]
        return content, True
    
    return content, False


def add_l10n_variable(content: str) -> Tuple[str, List[str]]:
    """Add 'final l10n = AppLocalizations.of(context)!;' where needed."""
    modified_content = content
    methods_modified = []
    
    # Pattern to find methods that need l10n
    # Look for methods with l10n. usage but no l10n variable
    method_pattern = r'((?:Future<[^>]+>|void|Widget)\s+\w+\([^)]*\)\s*(?:async)?\s*\{)'
    
    methods = list(re.finditer(method_pattern, content))
    
    for method_match in reversed(methods):  # Reverse to maintain positions
        method_start = method_match.end()
        # Find the closing brace for this method
        brace_count = 1
        method_end = method_start
        for i in range(method_start, len(content)):
            if content[i] == '{':
                brace_count += 1
            elif content[i] == '}':
                brace_count -= 1
                if brace_count == 0:
                    method_end = i
                    break
        
        method_content = content[method_start:method_end]
        
        # Check if this method uses l10n but doesn't define it
        if 'l10n.' in method_content and 'final l10n = AppLocalizations.of(context)!' not in method_content:
            # Add l10n variable at the start of method
            l10n_declaration = '\n    final l10n = AppLocalizations.of(context)!;'
            modified_content = modified_content[:method_start] + l10n_declaration + modified_content[method_start:]
            
            # Extract method name
            method_signature = method_match.group(0)
            method_name_match = re.search(r'\s+(\w+)\s*\(', method_signature)
            if method_name_match:
                methods_modified.append(method_name_match.group(1))
    
    return modified_content, methods_modified


def replace_strings(content: str, mappings: Dict[str, str]) -> Tuple[str, int]:
    """Replace hardcoded strings with l10n calls."""
    replacements = 0
    
    # Sort by length (longest first) to avoid partial replacements
    sorted_mappings = sorted(mappings.items(), key=lambda x: len(x[0]), reverse=True)
    
    for old_string, new_l10n in sorted_mappings:
        escaped_old = escape_for_regex(old_string)
        
        # Pattern 1: Text('string') -> Text(l10n.key)
        pattern1 = rf"Text\(\s*['\"]({escaped_old})['\"]\s*\)"
        replacement1 = f"Text({new_l10n})"
        content, count1 = re.subn(pattern1, replacement1, content)
        replacements += count1
        
        # Pattern 2: const Text('string') -> Text(l10n.key)
        pattern2 = rf"const\s+Text\(\s*['\"]({escaped_old})['\"]\s*\)"
        replacement2 = f"Text({new_l10n})"
        content, count2 = re.subn(pattern2, replacement2, content)
        replacements += count2
        
        # Pattern 3: 'string' in content: Text() -> l10n.key
        pattern3 = rf"content:\s*Text\(\s*['\"]({escaped_old})['\"]\s*\)"
        replacement3 = f"content: Text({new_l10n})"
        content, count3 = re.subn(pattern3, replacement3, content)
        replacements += count3
        
        # Pattern 4: labelText: 'string' -> labelText: l10n.key
        pattern4 = rf"(labelText|hintText|title|content):\s*['\"]({escaped_old})['\"]\s*[,)]"
        replacement4 = rf"\1: {new_l10n},"
        content, count4 = re.subn(pattern4, replacement4, content)
        replacements += count4
        
        # Pattern 5: SnackBar(content: Text('string')) -> SnackBar(content: Text(l10n.key))
        pattern5 = rf"SnackBar\(content:\s*Text\(\s*['\"]({escaped_old})['\"]\s*\)\)"
        replacement5 = f"SnackBar(content: Text({new_l10n}))"
        content, count5 = re.subn(pattern5, replacement5, content)
        replacements += count5
        
        # Pattern 6: String concatenation with suffix "(Host)"
        if old_string == "(Host)":
            pattern6 = rf"\$displayName\s*\(?['\"] \(Host\)['\"]"
            replacement6 = r"$displayName ${l10n.hostSuffix}"
            content, count6 = re.subn(pattern6, replacement6, content)
            replacements += count6
        
        # Pattern 7: Simple 'string' in various contexts
        pattern7 = rf"['\"]({escaped_old})['\"]\s*(?=[,;\)])"
        replacement7 = new_l10n
        content, count7 = re.subn(pattern7, replacement7, content)
        replacements += count7
    
    return content, replacements


def process_file(file_path: str, project_root: str) -> Dict[str, any]:
    """Process a single Dart file."""
    full_path = os.path.join(project_root, file_path)
    
    result = {
        'file': file_path,
        'success': False,
        'import_added': False,
        'l10n_vars_added': [],
        'replacements': 0,
        'error': None
    }
    
    if not os.path.exists(full_path):
        result['error'] = f"File not found: {full_path}"
        return result
    
    try:
        # Read original content
        with open(full_path, 'r', encoding='utf-8') as f:
            original_content = f.read()
        
        # Create backup
        backup_path = full_path + '.backup'
        with open(backup_path, 'w', encoding='utf-8') as f:
            f.write(original_content)
        
        # Process content
        content = original_content
        
        # Step 1: Add import
        content, import_added = add_l10n_import(content, file_path)
        result['import_added'] = import_added
        
        # Step 2: Replace strings
        content, replacements = replace_strings(content, STRING_MAPPINGS)
        result['replacements'] = replacements
        
        # Step 3: Add l10n variables where needed
        content, methods_modified = add_l10n_variable(content)
        result['l10n_vars_added'] = methods_modified
        
        # Write modified content
        with open(full_path, 'w', encoding='utf-8') as f:
            f.write(content)
        
        result['success'] = True
        
    except Exception as e:
        result['error'] = str(e)
    
    return result


def main():
    """Main execution function."""
    print("=" * 60)
    print("🚀 Automatic L10N String Replacer")
    print("=" * 60)
    print()
    
    # Get project root
    project_root = input("Enter your Flutter project root path (or press Enter for current directory): ").strip()
    if not project_root:
        project_root = os.getcwd()
    
    if not os.path.exists(project_root):
        print(f"❌ Error: Project root not found: {project_root}")
        return
    
    print(f"📁 Project root: {project_root}")
    print()
    
    # Process files
    results = []
    for file_path in FILES_TO_PROCESS:
        print(f"🔄 Processing: {file_path}")
        result = process_file(file_path, project_root)
        results.append(result)
        
        if result['success']:
            print(f"   ✅ Success!")
            print(f"   📝 Import added: {result['import_added']}")
            print(f"   🔢 Replacements: {result['replacements']}")
            if result['l10n_vars_added']:
                print(f"   📌 L10n vars added to: {', '.join(result['l10n_vars_added'])}")
        else:
            print(f"   ❌ Failed: {result['error']}")
        print()
    
    # Summary
    print("=" * 60)
    print("📊 SUMMARY")
    print("=" * 60)
    
    successful = sum(1 for r in results if r['success'])
    failed = len(results) - successful
    total_replacements = sum(r['replacements'] for r in results)
    
    print(f"✅ Successful: {successful}/{len(results)}")
    print(f"❌ Failed: {failed}/{len(results)}")
    print(f"🔢 Total replacements: {total_replacements}")
    print()
    
    if failed == 0:
        print("🎉 All files processed successfully!")
        print()
        print("📋 Next steps:")
        print("1. Run: flutter gen-l10n")
        print("2. Run: flutter run")
        print("3. Test language switching in Settings")
        print()
        print("⚠️  Backup files created with .backup extension")
        print("   Review changes and delete backups when satisfied")
    else:
        print("⚠️  Some files failed to process. Check errors above.")
    
    print()


if __name__ == "__main__":
    main()
