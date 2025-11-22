import 'dart:io';

/// AdMob configuration with production ad unit IDs
/// Platform-specific ad units for iOS and Android
class AdConfig {
  // Production Ad Unit IDs for iOS
  static const String _iosBannerAdUnitId = 'ca-app-pub-5871307243361155/6403296826';
  static const String _iosInterstitialAdUnitId = 'ca-app-pub-5871307243361155/1671405393';
  static const String _iosRewardedAdUnitId = 'ca-app-pub-5871307243361155/6147327711';

  // Production Ad Unit IDs for Android
  static const String _androidBannerAdUnitId = 'ca-app-pub-5871307243361155/2208082709';
  static const String _androidInterstitialAdUnitId = 'ca-app-pub-5871307243361155/9895001036';
  static const String _androidRewardedAdUnitId = 'ca-app-pub-5871307243361155/3054260511';

  // Test Ad Unit IDs (for development/testing)
  static const String _testBannerAdUnitId = 'ca-app-pub-3940256099942544/6300978111';
  static const String _testInterstitialAdUnitId = 'ca-app-pub-3940256099942544/1033173712';
  static const String _testRewardedAdUnitId = 'ca-app-pub-3940256099942544/5224354917';

  /// Whether to use test ad units (set to false for production)
  static const bool useTestAds = true; // TODO: Set to false before release!

  /// Get banner ad unit ID for current platform
  static String get bannerAdUnitId {
    if (useTestAds) return _testBannerAdUnitId;
    return Platform.isIOS ? _iosBannerAdUnitId : _androidBannerAdUnitId;
  }

  /// Get interstitial ad unit ID for current platform
  static String get interstitialAdUnitId {
    if (useTestAds) return _testInterstitialAdUnitId;
    return Platform.isIOS ? _iosInterstitialAdUnitId : _androidInterstitialAdUnitId;
  }

  /// Get rewarded ad unit ID for current platform
  static String get rewardedAdUnitId {
    if (useTestAds) return _testRewardedAdUnitId;
    return Platform.isIOS ? _iosRewardedAdUnitId : _androidRewardedAdUnitId;
  }
}
