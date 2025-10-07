class AppConstants {
  static const String appTitle = 'Connect';  // Changed from 'Swipe & Talk'
  
  // ... rest of the file stays the same

  
  // Game Modes
  static const String coupleMode = 'Couple';
  static const String friendsMode = 'Friends';
  static const String familyMode = 'Family';
  
  // Asset Paths
  static const String videoAssetPath = 'assets/images/parrots.mp4';
  static const String questionsAssetPath = 'assets/data/questions.json';

  // App Icon
  static const String appIconPath = 'assets/images/appIcon.png';
  
  // UI Constants
  static const double defaultPadding = 24.0;
  static const double buttonHeight = 60.0;
  static const double buttonWidth = 200.0;
  static const double largButtonWidth = 250.0;
  static const double largButtonHeight = 80.0;
  
  // Default Questions (fallback)
  static const Map<String, List<String>> defaultQuestions = {
    coupleMode: [
      'What is your favorite childhood memory?',
      'If you could have dinner with anyone, who would it be?',
      'What makes you feel most comfortable and relaxed?',
    ],
    friendsMode: [
      'What is your biggest turn-on?',
      'Describe your ideal romantic evening.',
      'What is something you find irresistibly attractive?',
    ],
    familyMode: [
      'If you could have any superpower, what would it be?',
      'What is the weirdest thing you have ever eaten?',
      'If you were a cartoon character, who would you be?',
    ],
  };

  // Category data structure
  static const Map<String, List<Map<String, dynamic>>> gameCategories = {
    coupleMode: [
      {'name': 'Love Talks', 'locked': false},
      {'name': 'Deep Talks', 'locked': false},
      {'name': 'Silly Talks', 'locked': false},
      {'name': 'Car Talks', 'locked': false},
      {'name': 'Spicy Talks', 'locked': true},
      {'name': 'Do-You-Dare', 'locked': true},
      {'name': 'Plot Twist: Our Future', 'locked': true},
      {'name': 'Love Languages Remix', 'locked': true},
    ],
    friendsMode: [
      {'name': 'Cozy Talks', 'locked': false},
      {'name': 'Silly Talks', 'locked': false},
      {'name': 'Car Talks', 'locked': false},
      {'name': 'Party Night Talks', 'locked': false},
      {'name': 'Unpopular Opinions XL', 'locked': true},
      {'name': 'After Dark Confessions', 'locked': true},
      {'name': 'Then & Now', 'locked': true},
      {'name': 'Green & Red Flags', 'locked': true},
    ],
    familyMode: [
      {'name': 'Cozy Talks', 'locked': false},
      {'name': 'History Talks', 'locked': false},
      {'name': 'Fun Talks', 'locked': false},
      {'name': 'Car Talks', 'locked': false},
      {'name': 'What-Ifs', 'locked': true},
      {'name': 'Would You Rather', 'locked': true},
      {'name': 'Time Capsule: Talk Edition', 'locked': true},
      {'name': 'Then & Now', 'locked': true},
    ],
  };
}