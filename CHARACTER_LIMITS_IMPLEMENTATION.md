# Character Limits Implementation

## Summary

Implemented character limits for user-generated questions to ensure optimal readability on question cards.

## Character Limits

### Pandora Mode: 150 characters
- **Location**: `lib/features/pandora/presentation/pages/pandora_question_submission_page.dart`
- **Rationale**: 
  - More restrictive for multiplayer consistency
  - Prevents spam/abuse with overly long questions
  - Forces users to be concise and clear
  - All players see consistent question lengths

### Personal Decks: 200 characters  
- **Location**: `lib/features/custom/presentation/pages/question_editor_page.dart`
- **Rationale**:
  - Allows more flexibility for personal creativity
  - Still fits comfortably on cards (4-6 lines at 24px font)
  - Slightly longer than existing longest question (141 chars)
  - Consistent with curated content (95th percentile: ~96-126 chars)

## Implementation Details

### Constants File
Added to `lib/core/constants/app_constants.dart`:
```dart
// Question Character Limits
static const int pandoraQuestionMaxLength = 150;
static const int personalDeckQuestionMaxLength = 200;
```

### Features

1. **Character Counter**: Shows remaining characters (e.g., "150/150")
2. **Visual Feedback**: Counter turns orange when approaching limit (>90%)
3. **Hard Limit**: TextField enforces maximum length automatically
4. **Consistent UX**: Applied to both "Add Question" and "Edit Question" dialogs

### Card Design Constraints

Based on analysis of `lib/features/game/presentation/widgets/question_card.dart`:
- Card size: 90% screen width × 60% screen height
- Font: Poppins 24px with line height 1.5
- Available space: ~60% of card height for text (after logo, buttons, badges)
- 200 chars ≈ 4-6 lines = comfortable reading experience

### Data Analysis

From existing questions database:
- Longest existing question: 141 characters
- 95th percentile: 96-126 characters (varies by category)
- Average: 56-79 characters
- Recommended limits fit within existing patterns

## Not Implemented

**Spark AI Questions**: No character limits needed as questions are AI-generated with built-in constraints.

## Testing Recommendations

1. Test questions at exactly 150/200 characters
2. Test with long German compound words
3. Verify counter color changes at 135/180 characters
4. Confirm questions display correctly on various screen sizes
