// lib/features/game/presentation/pages/game_mode_selection_page.dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../../../../core/utils/theme_helper.dart';
import '../../../../core/services/auth_service.dart';
import '../../../../core/services/connectivity_service.dart';
import '../../../../core/providers/unlock_provider.dart';
import '../../../subscription/presentation/pages/subscription_page_new.dart';
import '../../../auth/presentation/pages/social_auth_page.dart';
import '../../../../l10n/app_localizations.dart';
import 'category_selection_page.dart';
import '../../../pandora/presentation/pages/pandora_entry_page.dart';
import '../../../../core/widgets/custom_dialog.dart';
import '../../../spark/presentation/pages/spark_creator_screen.dart';
import '../../../../core/widgets/ad_banner_widget.dart';

class GameModeSelectionPage extends ConsumerStatefulWidget {
  final bool isDarkMode;

  const GameModeSelectionPage({
    super.key,
    required this.isDarkMode,
  });

  @override
  ConsumerState<GameModeSelectionPage> createState() => _GameModeSelectionPageState();
}

class _GameModeSelectionPageState extends ConsumerState<GameModeSelectionPage> {
  final PageController _pageController = PageController(
    viewportFraction: 0.45,
    initialPage: 0,
  );
  int currentPage = 0;
  final authService = AuthService();

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  Future<void> _handlePersonalMode(BuildContext context) async {
  final unlockState = ref.read(unlockProvider);

  // Check if user is signed in
  if (!authService.isLoggedIn) {
    _showSignInRequiredDialog(context);
    return;
  }

  // Check if user is premium
  if (!unlockState.isPremium) {
    await _showPremiumRequiredDialog(context);
    return;
  }

  // User is signed in and premium - allow access
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => CategorySelectionPage(
        gameMode: 'personal',
        isDarkMode: widget.isDarkMode,
      ),
    ),
  );
}

  Future<void> _handleSparkMode(BuildContext context) async {
    final unlockNotifier = ref.read(unlockProvider.notifier);
    final unlockState = ref.read(unlockProvider);

    // Check if user is signed in
    if (!authService.isLoggedIn) {
      _showSignInRequiredDialog(context);
      return;
    }

    // Check if user can use Spark (Premium or Premium+)
    if (!unlockNotifier.canUseSpark()) {
      await _showSparkPremiumRequiredDialog(context);
      return;
    }

    // Check internet connection - Spark Mode requires online access
    final hasInternet = await ConnectivityService.hasInternetConnection();
    if (!hasInternet && mounted) {
      _showSparkOfflineDialog(context);
      return;
    }

    // User has Spark access - navigate to Spark creator
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => SparkCreatorScreen(isDarkMode: widget.isDarkMode),
      ),
    );
  }

  Future<void> _showSparkPremiumRequiredDialog(BuildContext context) async {
    final l10n = AppLocalizations.of(context)!;

    final result = await showDialog<bool>(
      context: context,
      builder: (context) => CustomDialog(
        isDarkMode: widget.isDarkMode,
        icon: Icons.auto_awesome,
        iconColor: const Color(0xFFFF6B9D),
        title: 'Spark Mode - Premium Feature',
        content: 'Spark Mode is available for Premium and Premium+ subscribers. Generate AI-powered conversation starters tailored to your occasion!',
        actions: [
          DialogButton(
            text: l10n.cancel,
            onPressed: () => Navigator.pop(context, false),
            isPrimary: false,
            isDarkMode: widget.isDarkMode,
          ),
          const SizedBox(height: 12),
          DialogButton(
            text: l10n.getPremium,
            onPressed: () async {
              final subscribed = await Navigator.push<bool>(
                context,
                MaterialPageRoute(
                  builder: (context) => SubscriptionPageNew(isDarkMode: widget.isDarkMode),
                ),
              );

              if (mounted) {
                Navigator.pop(context, subscribed);
              }
            },
            isPrimary: true,
            isDarkMode: widget.isDarkMode,
            icon: Icons.auto_awesome,
          ),
        ],
      ),
    );

    // If user subscribed, refresh and navigate
    if (result == true && mounted) {
      await ref.read(unlockProvider.notifier).initialize();
      final unlockNotifier = ref.read(unlockProvider.notifier);

      if (unlockNotifier.canUseSpark() && mounted) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => SparkCreatorScreen(isDarkMode: widget.isDarkMode),
          ),
        );
      }
    }
  }

  void _showSparkOfflineDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => CustomDialog(
        isDarkMode: widget.isDarkMode,
        icon: Icons.wifi_off,
        iconColor: Colors.orange,
        title: 'Spark Mode Requires Internet',
        content: 'Spark Mode uses AI to generate personalized questions and requires an active internet connection. Please connect to the internet and try again.',
        actions: [
          DialogButton(
            text: 'OK',
            onPressed: () => Navigator.pop(context),
            isPrimary: true,
            isDarkMode: widget.isDarkMode,
          ),
        ],
      ),
    );
  }

  void _showSignInRequiredDialog(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
  
  showDialog(
    context: context,
    builder: (context) => CustomDialog(
      isDarkMode: widget.isDarkMode,
      icon: Icons.login,
      iconColor: const Color(0xFFD4A574),
      title: l10n.signInRequired,
      content: l10n.signInToUsePersonal,
      actions: [
        DialogButton(
          text: l10n.cancel,
          onPressed: () => Navigator.pop(context),
          isPrimary: false,
          isDarkMode: widget.isDarkMode,
        ),
        const SizedBox(height: 12),
        DialogButton(
          text: l10n.signInSignUp,
          onPressed: () {
            Navigator.pop(context);
            // Navigate to sign in page
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => SocialAuthPage(isDarkMode: widget.isDarkMode),
              ),
            );
          },
          isPrimary: true,
          isDarkMode: widget.isDarkMode,
          icon: Icons.login,
        ),
      ],
    ),
  );
}

  Future<void> _showPremiumRequiredDialog(BuildContext context) async {
  final l10n = AppLocalizations.of(context)!;
  
  final result = await showDialog<bool>(
    context: context,
    builder: (context) => CustomDialog(
      isDarkMode: widget.isDarkMode,
      icon: Icons.workspace_premium,
      iconColor: const Color(0xFFD4A574),
      title: l10n.premiumFeatureTitle,
      content: l10n.premiumPersonal,
      actions: [
        DialogButton(
          text: l10n.cancel,
          onPressed: () => Navigator.pop(context, false),
          isPrimary: false,
          isDarkMode: widget.isDarkMode,
        ),
        const SizedBox(height: 12),
        DialogButton(
          text: l10n.getPremium,
          onPressed: () async {
            // Navigate to subscription page
            final subscribed = await Navigator.push<bool>(
              context,
              MaterialPageRoute(
                builder: (context) => SubscriptionPageNew(isDarkMode: widget.isDarkMode),
              ),
            );
            
            if (mounted) {
              Navigator.pop(context, subscribed);
            }
          },
          isPrimary: true,
          isDarkMode: widget.isDarkMode,
          icon: Icons.workspace_premium,
        ),
      ],
    ),
  );
  
  // If user subscribed, refresh unlock manager and update UI
  if (result == true && mounted) {
    await ref.read(unlockProvider.notifier).initialize();
    final unlockState = ref.read(unlockProvider);

    // Now navigate to Personal mode
    if (unlockState.isPremium) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => CategorySelectionPage(
            gameMode: 'personal',
            isDarkMode: widget.isDarkMode,
          ),
        ),
      );
    }
  }
}

  List<Map<String, dynamic>> getGameModes(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return [
      {
        'text': 'Spark',
        'imageUrl': 'https://tpjsebutbieghpmvpktv.supabase.co/storage/v1/object/public/category_icons/sparkai.png',
        'gameMode': 'spark',
        'isPremium': true,
        'onPressed': () => _handleSparkMode(context),
      },
      {
        'text': l10n.couple,
        'imageUrl': 'https://tpjsebutbieghpmvpktv.supabase.co/storage/v1/object/public/category_icons/couple.png',
        'gameMode': 'couple',
        'isPremium': false,
        'onPressed': () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => CategorySelectionPage(
              gameMode: 'couple',
              isDarkMode: widget.isDarkMode,
            ),
          ),
        ),
      },
      {
        'text': l10n.friends,
        'imageUrl': 'https://tpjsebutbieghpmvpktv.supabase.co/storage/v1/object/public/category_icons/friends.png',
        'gameMode': 'friends',
        'isPremium': false,
        'onPressed': () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => CategorySelectionPage(
              gameMode: 'friends',
              isDarkMode: widget.isDarkMode,
            ),
          ),
        ),
      },
      {
        'text': l10n.family,
        'imageUrl': 'https://tpjsebutbieghpmvpktv.supabase.co/storage/v1/object/public/category_icons/family.png',
        'gameMode': 'family',
        'isPremium': false,
        'onPressed': () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => CategorySelectionPage(
              gameMode: 'family',
              isDarkMode: widget.isDarkMode,
            ),
          ),
        ),
      },
      {
        'text': l10n.personal,
        'imageUrl': 'https://tpjsebutbieghpmvpktv.supabase.co/storage/v1/object/public/category_icons/personal.png',
        'gameMode': 'personal',
        'isPremium': true,
        'onPressed': () => _handlePersonalMode(context),
      },
      {
        'text': 'Pandora',
        'imageUrl': 'https://tpjsebutbieghpmvpktv.supabase.co/storage/v1/object/public/category_icons/pandora.png',
        'gameMode': 'pandora',
        'isPremium': false,
        'onPressed': () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => PandoraEntryPage(isDarkMode: widget.isDarkMode),
          ),
        ),
      },
    ];
  }

  @override
  Widget build(BuildContext context) {
    final gameModes = getGameModes(context);
    
    return Scaffold(
      body: Container(
        decoration: ThemeHelper.getBackgroundDecoration(widget.isDarkMode),
        child: SafeArea(
          child: Stack(
            children: [
              // Vertical Carousel - Full screen
              PageView.builder(
                controller: _pageController,
                scrollDirection: Axis.vertical,
                itemCount: gameModes.length,
                onPageChanged: (index) {
                  setState(() {
                    currentPage = index;
                  });
                },
                itemBuilder: (context, index) {
                  final mode = gameModes[index];
                  return _buildCarouselCard(
                    text: mode['text'],
                    imageUrl: mode['imageUrl'],
                    gameMode: mode['gameMode'],
                    isPremium: mode['isPremium'] ?? false,
                    onPressed: mode['onPressed'],
                    index: index,
                  );
                },
              ),
              
              // Back button overlay (top left)
              Positioned(
                top: 16,
                left: 16,
                child: IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: Icon(
                    Icons.arrow_back,
                    color: ThemeHelper.getHeadingTextColor(widget.isDarkMode),
                    size: 32,
                  ),
                  style: IconButton.styleFrom(
                    backgroundColor: Colors.black.withValues(alpha: 0.2),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: ref.watch(unlockProvider).isPremium
        ? null
        : const AdBannerWidget(),
    );
  }

  Widget _buildCarouselCard({
    required String text,
    required String imageUrl,
    required String gameMode,
    required bool isPremium,
    required VoidCallback onPressed,
    required int index,
  }) {
    final colors = ThemeHelper.getGameModeGradient(gameMode, widget.isDarkMode);
    final isCurrentPage = currentPage == index;
    final userIsPremium = ref.watch(unlockProvider).isPremium; // Watch for reactivity
    
    return AnimatedBuilder(
      animation: _pageController,
      builder: (context, child) {
        double scale = 1.0;
        double opacity = 1.0;
        
        if (_pageController.position.haveDimensions) {
          final page = _pageController.page ?? currentPage.toDouble();
          final distanceFromCenter = (page - index).abs();
          
          scale = (1.0 - (distanceFromCenter * 0.15)).clamp(0.85, 1.0);
          opacity = (1.0 - (distanceFromCenter * 0.3)).clamp(0.5, 1.0);
        }
        
        return Transform.scale(
          scale: scale,
          child: Opacity(
            opacity: opacity,
            child: GestureDetector(
              onTap: onPressed,
              child: Container(
                margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 40),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: colors,
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(32),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: widget.isDarkMode ? 0.4 : 0.2),
                      blurRadius: 20,
                      offset: const Offset(0, 10),
                    ),
                  ],
                ),
                child: Stack(
                  children: [
                    // Main content
                    Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          // Image instead of emoji
                          gameMode == 'spark'
                              ? ClipRRect(
                                  borderRadius: BorderRadius.circular(16),
                                  child: SizedBox(
                                    width: 120,
                                    height: 120,
                                    child: Transform.scale(
                                      scale: 1.5,
                                      child: CachedNetworkImage(
                                        imageUrl: imageUrl,
                                        width: 120,
                                        height: 120,
                                        fit: BoxFit.cover,
                                        placeholder: (context, url) => const Center(
                                          child: CircularProgressIndicator(
                                            color: Colors.white,
                                            strokeWidth: 2,
                                          ),
                                        ),
                                        errorWidget: (context, url, error) {
                                          return const Icon(
                                            Icons.auto_awesome,
                                            size: 120,
                                            color: Colors.white,
                                          );
                                        },
                                      ),
                                    ),
                                  ),
                                )
                              : CachedNetworkImage(
                                  imageUrl: imageUrl,
                                  width: 120,
                                  height: 120,
                                  fit: BoxFit.contain,
                                  placeholder: (context, url) => const Center(
                                    child: CircularProgressIndicator(
                                      color: Colors.white,
                                      strokeWidth: 2,
                                    ),
                                  ),
                                  errorWidget: (context, url, error) {
                                    return Icon(
                                      Icons.image_not_supported,
                                      size: 120,
                                      color: Colors.white.withValues(alpha: 0.5),
                                    );
                                  },
                                ),
                          const SizedBox(height: 24),
                          Text(
                            text,
                            style: GoogleFonts.poppins(
                              fontSize: 32,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                    
                    // Lock icon for premium modes
                    if (isPremium && !userIsPremium)
                      Positioned(
                        top: 20,
                        right: 20,
                        child: Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: Colors.black.withValues(alpha: 0.3),
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(
                            Icons.lock,
                            color: Colors.white,
                            size: 24,
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}