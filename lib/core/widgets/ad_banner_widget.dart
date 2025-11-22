import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import '../services/ad_service.dart';
import '../providers/unlock_provider.dart';

/// Reusable banner ad widget with automatic premium user handling
/// Shows banner ad at the bottom of the screen for free users only
class AdBannerWidget extends ConsumerStatefulWidget {
  const AdBannerWidget({super.key});

  @override
  ConsumerState<AdBannerWidget> createState() => _AdBannerWidgetState();
}

class _AdBannerWidgetState extends ConsumerState<AdBannerWidget> {
  final adService = AdService();
  BannerAd? _bannerAd;
  bool _isLoaded = false;
  bool _isInitialized = false;

  @override
  void initState() {
    super.initState();
    // Use addPostFrameCallback to ensure unlockProvider is fully initialized
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _loadBannerAd();
    });
  }

  Future<void> _loadBannerAd() async {
    if (!mounted) return;

    // Wait for unlock provider to fully initialize
    await Future.delayed(const Duration(milliseconds: 100));

    if (!mounted) return;

    final isPremium = ref.read(unlockProvider).isPremium;

    setState(() {
      _isInitialized = true;
    });

    if (isPremium) {
      debugPrint('User is premium, skipping banner ad');
      return;
    }

    // Create individual banner instance (not shared)
    final banner = await adService.createBannerAd();
    if (banner != null && mounted) {
      setState(() {
        _bannerAd = banner;
        _isLoaded = true;
      });
    }
  }

  @override
  void dispose() {
    _bannerAd?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Watch premium status for real-time updates
    final isPremium = ref.watch(unlockProvider.select((state) => state.isPremium));

    // Don't show banner for premium users
    if (isPremium) {
      return const SizedBox.shrink();
    }

    // Show placeholder while initializing to maintain consistent spacing
    if (!_isInitialized || !_isLoaded || _bannerAd == null) {
      return SizedBox(
        height: 50, // Standard banner ad height
        child: Container(), // Empty placeholder
      );
    }

    // Show the loaded ad
    return Container(
      alignment: Alignment.center,
      width: _bannerAd!.size.width.toDouble(),
      height: _bannerAd!.size.height.toDouble(),
      child: AdWidget(ad: _bannerAd!),
    );
  }
}
