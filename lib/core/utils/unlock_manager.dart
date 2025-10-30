import 'package:flutter/foundation.dart';
import '../../core/services/auth_service.dart';

class UnlockManager extends ChangeNotifier {
  static final UnlockManager _instance = UnlockManager._internal();
  factory UnlockManager() => _instance;
  UnlockManager._internal();

  final _authService = AuthService();
  
  // Single premium status
  bool _isPremium = false;
  int _questionCount = 0;

  // Initialize from Supabase
  Future<void> initialize() async {
    if (_authService.isLoggedIn) {
      // Check if user has premium tier
      final tier = await _authService.getSubscriptionTier();
      _isPremium = tier == 'premium';
      notifyListeners();
    }
  }

  // Check if user has premium
  bool get isPremium => _isPremium;

  // Unlock premium (for all categories)
  Future<void> unlockPremium() async {
    _isPremium = true;
    
    if (_authService.isLoggedIn) {
      await _authService.updateSubscription(
        unlockedBundles: [],
        tier: 'premium',
      );
    }
    
    notifyListeners();
  }

  // Lock premium
  void lockPremium() {
    _isPremium = false;
    notifyListeners();
  }

  // Check if category is locked
  bool isCategoryLocked(String gameMode, String categoryName) {
    if (_isPremium) return false;
    
    final freeCategories = _getFreeCategoriesForMode(gameMode);
    return !freeCategories.contains(categoryName);
  }

  // Get free categories per mode
  List<String> _getFreeCategoriesForMode(String gameMode) {
    switch (gameMode.toLowerCase()) {
      case 'couple':
        return ['Love Talks', 'Deep Talks', 'Silly Talks'];
      case 'friends':
        return ['Cozy Talks', 'Silly Talks', 'Car Talks'];
      case 'family':
        return ['Cozy Talks', 'History Talks', 'Silly Talks'];
      default:
        return [];
    }
  }

  // Check if question is accessible in free category (max 30)
  bool canAccessQuestionInFreeCategory(String gameMode, String categoryName, int questionIndex) {
    if (_isPremium) return true;
    
    final freeCategories = _getFreeCategoriesForMode(gameMode);
    if (!freeCategories.contains(categoryName)) {
      // Locked category: allow 5-question preview
      return questionIndex < 5;
    }
    
    // Free category: allow 30 questions
    return questionIndex < 30;
  }

  // Get question limit for category
  int getQuestionLimitForCategory(String gameMode, String categoryName) {
    if (_isPremium) return 999999; // Unlimited
    
    final freeCategories = _getFreeCategoriesForMode(gameMode);
    if (freeCategories.contains(categoryName)) {
      return 30; // Free category limit
    }
    return 5; // Locked category preview
  }

  // Question counter for ads
  void incrementQuestionCount() {
    _questionCount++;
  }

  void resetQuestionCount() {
    _questionCount = 0;
  }

  int get questionCount => _questionCount;

  bool shouldShowAd() {
    return !_isPremium && _questionCount > 0 && _questionCount % 7 == 0;
  }

  // Pandora limits
  bool canCreatePandoraSession() => true; // Anyone can create
  
  int getMaxPandoraPlayers() {
    return _isPremium ? 999 : 6; // Free: 6, Premium: unlimited
  }
  
  int getMaxPandoraQuestions() {
    return _isPremium ? 999 : 12; // Free: 12, Premium: unlimited
  }
  
  bool shouldShowPandoraUpgrade(int currentQuestions) {
    return !_isPremium && currentQuestions >= 12;
  }
}