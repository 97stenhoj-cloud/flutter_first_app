// lib/features/game/presentation/pages/game_mode_selection_page.dart
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../core/utils/theme_helper.dart';
import '../../../../core/constants/app_constants.dart';
import '../../../../l10n/app_localizations.dart';
import 'category_selection_page.dart';
import '../../../pandora/presentation/pages/pandora_entry_page.dart';

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
    viewportFraction: 0.5, // Show 50% of each card, so you see current + parts of prev/next
    initialPage: 0,
  );
  int currentPage = 0;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  List<Map<String, dynamic>> getGameModes(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return [
      {
        'text': l10n.couple,
        'emoji': '💑',
        'gameMode': 'couple',
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
        'emoji': '👥',
        'gameMode': 'friends',
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
        'emoji': '👨‍👩‍👧‍👦',
        'gameMode': 'family',
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
        'emoji': '📝',
        'gameMode': 'personal',
        'onPressed': () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => CategorySelectionPage(
              gameMode: 'personal',
              isDarkMode: widget.isDarkMode,
            ),
          ),
        ),
      },
      {
        'text': 'Pandora',
        'emoji': '🔮',
        'gameMode': 'pandora',
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
    final l10n = AppLocalizations.of(context)!;
    final gameModes = getGameModes(context);
    
    return Scaffold(
      body: Container(
        decoration: ThemeHelper.getBackgroundDecoration(widget.isDarkMode),
        child: SafeArea(
          child: Column(
            children: [
              // Header
              Padding(
                padding: const EdgeInsets.all(AppConstants.defaultPadding),
                child: Row(
                  children: [
                    IconButton(
                      onPressed: () => Navigator.pop(context),
                      icon: Icon(
                        Icons.arrow_back,
                        color: ThemeHelper.getHeadingTextColor(widget.isDarkMode),
                        size: 28,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        l10n.chooseGameMode,
                        style: GoogleFonts.poppins(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: ThemeHelper.getHeadingTextColor(widget.isDarkMode),
                        ),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      ),
                    ),
                  ],
                ),
              ),
              
              // Vertical Carousel
              Expanded(
                child: PageView.builder(
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
                      emoji: mode['emoji'],
                      gameMode: mode['gameMode'],
                      onPressed: mode['onPressed'],
                      index: index,
                    );
                  },
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
    required String emoji,
    required String gameMode,
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
          
          // Subtle scaling - keep all visible cards readable
          scale = (1.0 - (distanceFromCenter * 0.2)).clamp(0.8, 1.0);
          opacity = (1.0 - (distanceFromCenter * 0.4)).clamp(0.5, 1.0);
        }
        
        return Center(
          child: Transform.scale(
            scale: scale,
            child: Opacity(
              opacity: opacity,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
                child: GestureDetector(
                  onTap: onPressed,
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: colors,
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      borderRadius: BorderRadius.circular(24),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withValues(alpha: widget.isDarkMode ? 0.4 : 0.2),
                          blurRadius: isCurrentPage ? 20 : 10,
                          offset: Offset(0, isCurrentPage ? 10 : 5),
                        ),
                      ],
                    ),
                    child: Stack(
                      children: [
                        // Content
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 24),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                emoji,
                                style: TextStyle(
                                  fontSize: isCurrentPage ? 56 : 44,
                                ),
                              ),
                              const SizedBox(height: 12),
                              Text(
                                text,
                                style: GoogleFonts.poppins(
                                  fontSize: isCurrentPage ? 26 : 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                                textAlign: TextAlign.center,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                              if (isCurrentPage) ...[
                                const SizedBox(height: 8),
                                Text(
                                  'Tap to continue',
                                  style: GoogleFonts.poppins(
                                    fontSize: 14,
                                    color: Colors.white.withValues(alpha: 0.9),
                                  ),
                                ),
                              ],
                            ],
                          ),
                        ),
                        
                        // Decorative gradient overlay at bottom (only on current page)
                        if (isCurrentPage)
                          Positioned(
                            bottom: 0,
                            left: 0,
                            right: 0,
                            child: Container(
                              height: 50,
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                  colors: [
                                    Colors.transparent,
                                    Colors.black.withValues(alpha: 0.15),
                                  ],
                                ),
                                borderRadius: const BorderRadius.only(
                                  bottomLeft: Radius.circular(24),
                                  bottomRight: Radius.circular(24),
                                ),
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}