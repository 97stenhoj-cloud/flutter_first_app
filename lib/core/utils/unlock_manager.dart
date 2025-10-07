import 'package:flutter/foundation.dart';
import '../services/auth_service.dart';

class UnlockManager extends ChangeNotifier {
  static final UnlockManager _instance = UnlockManager._internal();
  factory UnlockManager() => _instance;
  UnlockManager._internal();

  final authService = AuthService();
  
  // Local cache
  final Set<String> _unlockedBundles = {};
  int _questionCount = 0;

  // Initialize from Supabase
  Future<void> initialize() async {
    if (authService.isLoggedIn) {
      final bundles = await authService.getUnlockedBundles();
      _unlockedBundles.clear();
      _unlockedBundles.addAll(bundles);
      notifyListeners();
    }
  }

  bool isBundleUnlocked(String gameMode) {
    return _unlockedBundles.contains(gameMode);
  }

  Future<void> unlockBundle(String gameMode) async {
    _unlockedBundles.add(gameMode);
    
    if (authService.isLoggedIn) {
      await authService.updateSubscription(
        unlockedBundles: _unlockedBundles.toList(),
        tier: _getTierFromCount(_unlockedBundles.length),
      );
    }
    
    notifyListeners();
  }

  Future<void> unlockMultipleBundles(List<String> gameModes) async {
    _unlockedBundles.addAll(gameModes);
    
    if (authService.isLoggedIn) {
      await authService.updateSubscription(
        unlockedBundles: _unlockedBundles.toList(),
        tier: _getTierFromCount(_unlockedBundles.length),
      );
    }
    
    notifyListeners();
  }

  void lockAllBundles() {
    _unlockedBundles.clear();
    notifyListeners();
  }

  String _getTierFromCount(int count) {
    if (count == 0) return 'none';
    if (count == 1) return '1-bundle';
    if (count == 2) return '2-bundles';
    return '3-bundles';
  }

  Set<String> get unlockedBundles => Set.from(_unlockedBundles);
  int get unlockedBundleCount => _unlockedBundles.length;

  // Question counter for ads
  void incrementQuestionCount() {
    _questionCount++;
  }

  void resetQuestionCount() {
    _questionCount = 0;
  }

  int get questionCount => _questionCount;

  bool shouldShowAd() {
    return _unlockedBundles.isEmpty && _questionCount > 0 && _questionCount % 7 == 0;
  }

  bool get isPremium => _unlockedBundles.isNotEmpty;
}