import 'package:flutter/foundation.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import '../config/ad_config.dart';

/// Centralized AdMob service for managing all ad types
/// Handles banner ads, interstitial ads, and rewarded video ads
class AdService {
  // Singleton pattern
  static final AdService _instance = AdService._internal();
  factory AdService() => _instance;
  AdService._internal();

  // Ad instances (interstitial and rewarded only - banners are per-widget)
  InterstitialAd? _interstitialAd;
  RewardedAd? _rewardedAd;

  // Loading states
  bool _isInterstitialAdLoaded = false;
  bool _isRewardedAdLoaded = false;

  // Callbacks
  VoidCallback? _onInterstitialAdClosed;
  Function(int amount)? _onRewardEarned;

  /// Initialize the Mobile Ads SDK
  static Future<void> initialize() async {
    await MobileAds.instance.initialize();
    debugPrint('✅ AdMob SDK initialized');
  }

  /// Check if interstitial ad is loaded
  bool get isInterstitialAdLoaded => _isInterstitialAdLoaded;

  /// Check if rewarded ad is loaded
  bool get isRewardedAdLoaded => _isRewardedAdLoaded;

  // ==================== BANNER ADS ====================

  /// Create a new banner ad instance (non-singleton, for individual widgets)
  /// Returns the loaded BannerAd or null if loading fails
  /// Each widget should manage its own banner ad lifecycle
  Future<BannerAd?> createBannerAd() async {
    try {
      debugPrint('📱 Creating new banner ad instance...');

      final banner = BannerAd(
        adUnitId: AdConfig.bannerAdUnitId,
        size: AdSize.banner,
        request: const AdRequest(),
        listener: BannerAdListener(
          onAdLoaded: (ad) {
            debugPrint('✅ Banner ad loaded');
          },
          onAdFailedToLoad: (ad, error) {
            debugPrint('❌ Banner ad failed to load: $error');
            ad.dispose();
          },
          onAdOpened: (ad) {
            debugPrint('📱 Banner ad opened');
          },
          onAdClosed: (ad) {
            debugPrint('📱 Banner ad closed');
          },
        ),
      );

      await banner.load();
      return banner;
    } catch (e) {
      debugPrint('❌ Error creating banner ad: $e');
      return null;
    }
  }

  // ==================== INTERSTITIAL ADS ====================

  /// Load an interstitial ad
  /// [onClosed] callback will be called when ad is closed
  Future<void> loadInterstitialAd({VoidCallback? onClosed}) async {
    try {
      debugPrint('📺 Loading interstitial ad...');
      _onInterstitialAdClosed = onClosed;

      await InterstitialAd.load(
        adUnitId: AdConfig.interstitialAdUnitId,
        request: const AdRequest(),
        adLoadCallback: InterstitialAdLoadCallback(
          onAdLoaded: (ad) {
            debugPrint('✅ Interstitial ad loaded');
            _interstitialAd = ad;
            _isInterstitialAdLoaded = true;

            // Set full screen content callback
            ad.fullScreenContentCallback = FullScreenContentCallback(
              onAdShowedFullScreenContent: (ad) {
                debugPrint('📺 Interstitial ad showed full screen');
              },
              onAdDismissedFullScreenContent: (ad) {
                debugPrint('📺 Interstitial ad dismissed');
                _disposeInterstitialAd();
                _onInterstitialAdClosed?.call();
                // Pre-load next ad
                loadInterstitialAd(onClosed: _onInterstitialAdClosed);
              },
              onAdFailedToShowFullScreenContent: (ad, error) {
                debugPrint('❌ Interstitial ad failed to show: $error');
                _disposeInterstitialAd();
                // Retry loading
                loadInterstitialAd(onClosed: _onInterstitialAdClosed);
              },
            );
          },
          onAdFailedToLoad: (error) {
            debugPrint('❌ Interstitial ad failed to load: $error');
            _isInterstitialAdLoaded = false;
            _interstitialAd = null;
            // Retry after delay
            Future.delayed(const Duration(seconds: 5), () {
              loadInterstitialAd(onClosed: _onInterstitialAdClosed);
            });
          },
        ),
      );
    } catch (e) {
      debugPrint('❌ Error loading interstitial ad: $e');
    }
  }

  /// Show interstitial ad if loaded
  /// Returns true if ad was shown, false otherwise
  Future<bool> showInterstitialAd() async {
    if (_interstitialAd != null && _isInterstitialAdLoaded) {
      try {
        await _interstitialAd!.show();
        return true;
      } catch (e) {
        debugPrint('❌ Error showing interstitial ad: $e');
        _disposeInterstitialAd();
        return false;
      }
    } else {
      debugPrint('⚠️ Interstitial ad not ready');
      // Try to load for next time
      loadInterstitialAd(onClosed: _onInterstitialAdClosed);
      return false;
    }
  }

  /// Dispose interstitial ad
  void _disposeInterstitialAd() {
    _interstitialAd?.dispose();
    _interstitialAd = null;
    _isInterstitialAdLoaded = false;
  }

  // ==================== REWARDED ADS ====================

  /// Load a rewarded ad
  /// [onRewardEarned] callback with reward amount
  Future<void> loadRewardedAd({Function(int amount)? onRewardEarned}) async {
    try {
      debugPrint('🎁 Loading rewarded ad...');
      _onRewardEarned = onRewardEarned;

      await RewardedAd.load(
        adUnitId: AdConfig.rewardedAdUnitId,
        request: const AdRequest(),
        rewardedAdLoadCallback: RewardedAdLoadCallback(
          onAdLoaded: (ad) {
            debugPrint('✅ Rewarded ad loaded');
            _rewardedAd = ad;
            _isRewardedAdLoaded = true;

            // Set full screen content callback
            ad.fullScreenContentCallback = FullScreenContentCallback(
              onAdShowedFullScreenContent: (ad) {
                debugPrint('🎁 Rewarded ad showed full screen');
              },
              onAdDismissedFullScreenContent: (ad) {
                debugPrint('🎁 Rewarded ad dismissed');
                _disposeRewardedAd();
                // Pre-load next ad
                loadRewardedAd(onRewardEarned: _onRewardEarned);
              },
              onAdFailedToShowFullScreenContent: (ad, error) {
                debugPrint('❌ Rewarded ad failed to show: $error');
                _disposeRewardedAd();
                // Retry loading
                loadRewardedAd(onRewardEarned: _onRewardEarned);
              },
            );
          },
          onAdFailedToLoad: (error) {
            debugPrint('❌ Rewarded ad failed to load: $error');
            _isRewardedAdLoaded = false;
            _rewardedAd = null;
            // Retry after delay
            Future.delayed(const Duration(seconds: 5), () {
              loadRewardedAd(onRewardEarned: _onRewardEarned);
            });
          },
        ),
      );
    } catch (e) {
      debugPrint('❌ Error loading rewarded ad: $e');
    }
  }

  /// Show rewarded ad if loaded
  /// Returns true if ad was shown, false otherwise
  Future<bool> showRewardedAd() async {
    if (_rewardedAd != null && _isRewardedAdLoaded) {
      try {
        await _rewardedAd!.show(
          onUserEarnedReward: (ad, reward) {
            debugPrint('🎁 User earned reward: ${reward.amount} ${reward.type}');
            _onRewardEarned?.call(reward.amount.toInt());
          },
        );
        return true;
      } catch (e) {
        debugPrint('❌ Error showing rewarded ad: $e');
        _disposeRewardedAd();
        return false;
      }
    } else {
      debugPrint('⚠️ Rewarded ad not ready');
      // Try to load for next time
      loadRewardedAd(onRewardEarned: _onRewardEarned);
      return false;
    }
  }

  /// Dispose rewarded ad
  void _disposeRewardedAd() {
    _rewardedAd?.dispose();
    _rewardedAd = null;
    _isRewardedAdLoaded = false;
  }

  // ==================== CLEANUP ====================

  /// Dispose all ads (interstitial and rewarded)
  /// Note: Banner ads are managed individually by each AdBannerWidget
  Future<void> disposeAll() async {
    _disposeInterstitialAd();
    _disposeRewardedAd();
    debugPrint('🗑️ All ads disposed');
  }
}
