// lib/features/game/presentation/pages/category_selection_page.dart
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../core/utils/theme_helper.dart';
import '../../../../core/utils/unlock_manager.dart';
import '../../../../core/constants/app_constants.dart';
import '../../../../core/services/supabase_service.dart';
import 'game_page.dart';
import '../../../../l10n/app_localizations.dart';
import '../../../custom/presentation/pages/custom_deck_list_page.dart';

class CategorySelectionPage extends StatefulWidget {
  final String gameMode;
  final bool isDarkMode;
  
  const CategorySelectionPage({
    super.key,
    required this.gameMode,
    required this.isDarkMode,
  });

  @override
  State<CategorySelectionPage> createState() => _CategorySelectionPageState();
}

class _CategorySelectionPageState extends State<CategorySelectionPage> {
  final unlockManager = UnlockManager();
  final supabaseService = SupabaseService();
  final PageController _pageController = PageController(viewportFraction: 0.85);
  
  List<String> categories = [];
  bool isLoading = true;
  int currentPage = 0;

  @override
  void initState() {
    super.initState();
    if (widget.gameMode.toLowerCase() != 'personal') {
      _loadCategories();
    } else {
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  Future<void> _loadCategories() async {
    try {
      final fetchedCategories = await supabaseService.getCategories(widget.gameMode);
      setState(() {
        categories = fetchedCategories;
        isLoading = false;
      });
    } catch (e) {
      debugPrint('Error loading categories: $e');
      setState(() {
        isLoading = false;
      });
    }
  }

  bool _isCategoryLocked(String categoryName) {
    final gameModeCategories = AppConstants.gameCategories[widget.gameMode];
    if (gameModeCategories == null) return false;
    
    final categoryData = gameModeCategories.firstWhere(
      (cat) => cat['name'] == categoryName,
      orElse: () => {'name': categoryName, 'locked': false},
    );
    
    final isMarkedAsLocked = categoryData['locked'] as bool;
    final isBundleUnlocked = unlockManager.isBundleUnlocked(widget.gameMode);
    
    return isMarkedAsLocked && !isBundleUnlocked;
  }

  void _showLockedDialog(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(l10n.locked),
        content: Text(l10n.lockedMessage),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text(l10n.ok),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    
    // CHECK FOR PERSONAL MODE - Show custom decks instead
    if (widget.gameMode.toLowerCase() == 'personal') {
      return CustomDeckListPage(isDarkMode: widget.isDarkMode);
    }
    
    // Regular category selection for other game modes
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
                        l10n.chooseCategory,
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
              
              // Carousel
              Expanded(
                child: isLoading
                    ? Center(
                        child: CircularProgressIndicator(
                          color: ThemeHelper.getHeadingTextColor(widget.isDarkMode),
                        ),
                      )
                    : categories.isEmpty
                        ? Center(
                            child: Text(
                              l10n.noCategoriesFound,
                              style: GoogleFonts.poppins(
                                fontSize: 18,
                                color: ThemeHelper.getBodyTextColor(widget.isDarkMode),
                              ),
                            ),
                          )
                        : Column(
                            children: [
                              // Carousel
                              Expanded(
                                child: PageView.builder(
                                  controller: _pageController,
                                  itemCount: categories.length,
                                  onPageChanged: (index) {
                                    setState(() {
                                      currentPage = index;
                                    });
                                  },
                                  itemBuilder: (context, index) {
                                    final category = categories[index];
                                    final isLocked = _isCategoryLocked(category);
                                    return _buildCarouselCard(
                                      category: category,
                                      isLocked: isLocked,
                                      index: index,
                                    );
                                  },
                                ),
                              ),
                              
                              // Page indicators
                              Padding(
                                padding: const EdgeInsets.only(bottom: 40),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: List.generate(
                                    categories.length,
                                    (index) => AnimatedContainer(
                                      duration: const Duration(milliseconds: 300),
                                      margin: const EdgeInsets.symmetric(horizontal: 4),
                                      width: currentPage == index ? 24 : 8,
                                      height: 8,
                                      decoration: BoxDecoration(
                                        color: currentPage == index
                                            ? ThemeHelper.getGameModeGradient(widget.gameMode, widget.isDarkMode)[0]
                                            : ThemeHelper.getHeadingTextColor(widget.isDarkMode).withValues(alpha: 0.3),
                                        borderRadius: BorderRadius.circular(4),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCarouselCard({
    required String category,
    required bool isLocked,
    required int index,
  }) {
    final colors = ThemeHelper.getGameModeGradient(widget.gameMode, widget.isDarkMode);
    final isCurrentPage = currentPage == index;
    
    return AnimatedBuilder(
      animation: _pageController,
      builder: (context, child) {
        double scale = 1.0;
        double opacity = 1.0;
        
        if (_pageController.position.haveDimensions) {
          final page = _pageController.page ?? currentPage.toDouble();
          final distanceFromCenter = (page - index).abs();
          
          // Scale and opacity based on distance from center
          scale = (1.0 - (distanceFromCenter * 0.15)).clamp(0.85, 1.0);
          opacity = (1.0 - (distanceFromCenter * 0.3)).clamp(0.5, 1.0);
        }
        
        return Transform.scale(
          scale: scale,
          child: Opacity(
            opacity: opacity,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 20),
              child: GestureDetector(
                onTap: () {
                  if (isLocked) {
                    _showLockedDialog(context);
                  } else {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => GamePage(
                          gameMode: widget.gameMode,
                          category: category,
                          isDarkMode: widget.isDarkMode,
                        ),
                      ),
                    );
                  }
                },
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
                      Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            if (isLocked)
                              const Icon(
                                Icons.lock,
                                size: 48,
                                color: Colors.white,
                              ),
                            if (isLocked) const SizedBox(height: 16),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 32),
                              child: Text(
                                category,
                                style: GoogleFonts.poppins(
                                  fontSize: 32,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                                textAlign: TextAlign.center,
                                maxLines: 3,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            const SizedBox(height: 16),
                            Text(
                              isLocked ? 'Premium' : 'Tap to play',
                              style: GoogleFonts.poppins(
                                fontSize: 16,
                                color: Colors.white.withValues(alpha: 0.9),
                              ),
                            ),
                          ],
                        ),
                      ),
                      
                      // Decorative gradient overlay at bottom
                      Positioned(
                        bottom: 0,
                        left: 0,
                        right: 0,
                        child: Container(
                          height: 100,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                                Colors.transparent,
                                Colors.black.withValues(alpha: 0.2),
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
        );
      },
    );
  }
}