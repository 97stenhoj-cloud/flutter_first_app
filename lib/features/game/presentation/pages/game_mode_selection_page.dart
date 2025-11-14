// lib/features/game/presentation/pages/game_mode_selection_page.dart
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../core/utils/theme_helper.dart';
import '../../../../core/services/auth_service.dart';
import '../../../../core/utils/unlock_manager.dart';
import '../../../subscription/presentation/pages/subscription_page.dart';
import '../../../auth/presentation/pages/social_auth_page.dart';
import '../../../../l10n/app_localizations.dart';
import 'category_selection_page.dart';
import '../../../pandora/presentation/pages/pandora_entry_page.dart';
import '../../../../core/widgets/custom_dialog.dart';

class GameModeSelectionPage extends StatefulWidget {
  final bool isDarkMode;
  
  const GameModeSelectionPage({
    super.key,
    required this.isDarkMode,
  });

  @override
  State<GameModeSelectionPage> createState() => _GameModeSelectionPageState();
}

class _GameModeSelectionPageState extends State<GameModeSelectionPage> {
  final PageController _pageController = PageController(
    viewportFraction: 0.45,
    initialPage: 1,
  );
  int currentPage = 0;
  final authService = AuthService();
  final unlockManager = UnlockManager();

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  Future<void> _handlePersonalMode(BuildContext context) async {
  final l10n = AppLocalizations.of(context)!;
  
  // Check if user is signed in
  if (!authService.isLoggedIn) {
    _showSignInRequiredDialog(context);
    return;
  }
  
  // Check if user is premium
  if (!unlockManager.isPremium) {
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
                builder: (context) => SubscriptionPage(isDarkMode: widget.isDarkMode),
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
    await unlockManager.initialize();
    setState(() {}); // Refresh UI to remove lock icon
    
    // Now navigate to Personal mode
    if (unlockManager.isPremium) {
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
                          Image.network(
                            imageUrl,
                            width: 120,
                            height: 120,
                            fit: BoxFit.contain,
                            errorBuilder: (context, error, stackTrace) {
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
                    if (isPremium && !unlockManager.isPremium)
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