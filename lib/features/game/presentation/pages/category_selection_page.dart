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

// Category image URLs - keyed by "gameMode_categoryName"
const Map<String, String> categoryImages = {
  // Couple mode
  'couple_Love Talks': 'https://tpjsebutbieghpmvpktv.supabase.co/storage/v1/object/public/category_icons/couple.png',
  'couple_Deep Talks': 'https://tpjsebutbieghpmvpktv.supabase.co/storage/v1/object/public/category_icons/couple.png',
  'couple_Silly Talks': 'https://tpjsebutbieghpmvpktv.supabase.co/storage/v1/object/public/category_icons/couple.png',
  'couple_Car Talks': 'https://tpjsebutbieghpmvpktv.supabase.co/storage/v1/object/public/category_icons/couple.png',
  'couple_Spicy Talks': 'https://tpjsebutbieghpmvpktv.supabase.co/storage/v1/object/public/category_icons/couple.png',
  'couple_Do-you-dare Talks': 'https://tpjsebutbieghpmvpktv.supabase.co/storage/v1/object/public/category_icons/couple.png',
  'couple_Love Languages Remix Talks': 'https://tpjsebutbieghpmvpktv.supabase.co/storage/v1/object/public/category_icons/couple.png',
  
  // Friends mode
  'friends_Cozy Talks': 'https://tpjsebutbieghpmvpktv.supabase.co/storage/v1/object/public/category_icons/friends.png',
  'friends_Silly Talks': 'https://tpjsebutbieghpmvpktv.supabase.co/storage/v1/object/public/category_icons/friends.png',
  'friends_Car Talks': 'https://tpjsebutbieghpmvpktv.supabase.co/storage/v1/object/public/category_icons/friends.png',
  'friends_Party Night Talks': 'https://tpjsebutbieghpmvpktv.supabase.co/storage/v1/object/public/category_icons/friends.png',
  'friends_Unpopular Opinions XL ': 'https://tpjsebutbieghpmvpktv.supabase.co/storage/v1/object/public/category_icons/friends.png',
  'friends_After Dark Talks': 'https://tpjsebutbieghpmvpktv.supabase.co/storage/v1/object/public/category_icons/friends.png',
  'friends_Plot Twists & Dilemmas ': 'https://tpjsebutbieghpmvpktv.supabase.co/storage/v1/object/public/category_icons/friends.png',

  // Family mode
  'family_Silly Talks': 'https://tpjsebutbieghpmvpktv.supabase.co/storage/v1/object/public/category_icons/family.png',
  'family_Cozy Talks': 'https://tpjsebutbieghpmvpktv.supabase.co/storage/v1/object/public/category_icons/family.png',
  'family_History Talks': 'https://tpjsebutbieghpmvpktv.supabase.co/storage/v1/object/public/category_icons/family.png',
  'family_Tiny Talks': 'https://tpjsebutbieghpmvpktv.supabase.co/storage/v1/object/public/category_icons/family.png',
  'family_Car Talks': 'https://tpjsebutbieghpmvpktv.supabase.co/storage/v1/object/public/category_icons/family.png',
  'family_The Good Old Days Talks': 'https://tpjsebutbieghpmvpktv.supabase.co/storage/v1/object/public/category_icons/family.png',
  'family_Would You Rather Talks': 'https://tpjsebutbieghpmvpktv.supabase.co/storage/v1/object/public/category_icons/family.png',
};

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
  Map<String, bool> expandedStates = {};

  List<TextSpan> _buildDescriptionSpans(String description) {
    if (description.contains('Disclaimer:')) {
      final parts = description.split('Disclaimer:');
      return [
        TextSpan(text: parts[0]),
        const TextSpan(text: '\n\n'),
        TextSpan(
          text: 'Disclaimer:${parts[1]}',
          style: const TextStyle(
            fontWeight: FontWeight.w900,
            fontSize: 15.5,
          ),
        ),
      ];
    }
    
    if (description.contains('*Note:*')) {
      final parts = description.split('*Note:*');
      return [
        TextSpan(text: parts[0]),
        const TextSpan(text: '\n\n'),
        TextSpan(
          text: 'Note:${parts[1]}',
          style: const TextStyle(
            fontWeight: FontWeight.w900,
            fontSize: 15.5,
          ),
        ),
      ];
    }
    
    return [TextSpan(text: description)];
  }

  @override
  void initState() {
    super.initState();
    _initializeUnlockManager();
    if (widget.gameMode.toLowerCase() != 'personal') {
      _loadCategories();
    } else {
      setState(() {
        isLoading = false;
      });
    }
  }

  Future<void> _initializeUnlockManager() async {
    await unlockManager.initialize();
    if (mounted) {
      setState(() {});
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
    return unlockManager.isCategoryLocked(widget.gameMode, categoryName);
  }

  String _getCategoryDescription(String category) {
    final l10n = AppLocalizations.of(context)!;
    
    switch (category) {
      case 'Love Talks':
        return l10n.deckDescLoveTalks;
      case 'Deep Talks':
        return l10n.deckDescDeepTalks;
      case 'Spicy Talks':
        return l10n.deckDescSpicyTalks;
      case 'Do-you-dare Talks':
        return l10n.deckDescDoYouDareTalks;
      case 'Love Languages Remix Talks':
        return l10n.deckDescLoveLanguagesTalks;
      case 'Silly Talks':
        return l10n.deckDescSillyTalks;
      case 'Car Talks':
        return l10n.deckDescCarTalks;
      case 'Cozy Talks':
        return l10n.deckDescCozyTalks;
      case 'Party Night Talks':
        return l10n.deckDescPartyNight;
      case 'Unpopular Opinions XL':
      case 'Unpopular Opinions XL ':
        return l10n.deckDescUnpopularOpinions;
      case 'Plot Twists & Dilemmas':
      case 'Plot Twists & Dilemmas ':
        return l10n.deckDescPlotTwists;
      case 'After Dark Talks':
        return l10n.deckDescAfterDark;
      case 'History Talks':
        return l10n.deckDescHistoryTalks;
      case 'Tiny Talks':
        return l10n.deckDescTinyTalks;
      case 'The Good Old Days Talks':
        return l10n.deckDescGoodOldDays;
      case 'Would You Rather Talks':
        return l10n.deckDescWouldYouRather;
      default:
        return '';
    }
  }

  String _getQuestionCountText(String categoryName) {
    final l10n = AppLocalizations.of(context)!;
    final isFree = !_isCategoryLocked(categoryName);
    
    if (unlockManager.isPremium) {
      return l10n.questionsCount75;
    } else if (isFree) {
      return l10n.questionsCount30;
    } else {
      return l10n.questionsCount5Preview;
    }
  }

  String _getPremiumUpgradeText() {
    final l10n = AppLocalizations.of(context)!;
    return l10n.unlockFullDeck;
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
    
    if (widget.gameMode.toLowerCase() == 'personal') {
      return CustomDeckListPage(isDarkMode: widget.isDarkMode);
    }
    
    return Scaffold(
      body: Container(
        decoration: ThemeHelper.getBackgroundDecoration(widget.isDarkMode),
        child: SafeArea(
          child: Column(
            children: [
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
    final isExpanded = expandedStates[category] ?? false;
    final description = _getCategoryDescription(category);
    final imageKey = '${widget.gameMode.toLowerCase()}_$category';
    final imageUrl = categoryImages[imageKey];
    final l10n = AppLocalizations.of(context)!;
    
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
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
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
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(24),
                    child: Stack(
                      children: [
                        if (imageUrl != null)
                          Positioned.fill(
                            child: Opacity(
                              opacity: 0.15,
                              child: Image.network(
                                imageUrl,
                                fit: BoxFit.cover,
                                errorBuilder: (context, error, stackTrace) {
                                  return const SizedBox.shrink();
                                },
                              ),
                            ),
                          ),
                        
                        Padding(
                          padding: const EdgeInsets.all(24),
                          child: Column(
                            children: [
                              Expanded(
                                child: Center(
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      if (isLocked)
                                        const Icon(
                                          Icons.lock,
                                          size: 48,
                                          color: Colors.white,
                                        ),
                                      if (isLocked) const SizedBox(height: 16),
                                      
                                      Flexible(
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(horizontal: 16),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              Text(
                                                category,
                                                style: GoogleFonts.poppins(
                                                  fontSize: 28,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.white,
                                                  height: 1.2,
                                                ),
                                                textAlign: TextAlign.center,
                                                maxLines: 3,
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                              const SizedBox(height: 8),
                                              
                                              // Question count badge
                                              Container(
                                                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                                                decoration: BoxDecoration(
                                                  color: Colors.white.withValues(alpha: 0.2),
                                                  borderRadius: BorderRadius.circular(20),
                                                  border: Border.all(
                                                    color: Colors.white.withValues(alpha: 0.3),
                                                    width: 1.5,
                                                  ),
                                                ),
                                                child: Text(
                                                  _getQuestionCountText(category),
                                                  style: GoogleFonts.poppins(
                                                    fontSize: 13,
                                                    fontWeight: FontWeight.w600,
                                                    color: Colors.white,
                                                  ),
                                                ),
                                              ),
                                              
                                              // Premium upgrade badge for locked categories
                                              if (isLocked && !unlockManager.isPremium) ...[
                                                const SizedBox(height: 8),
                                                Container(
                                                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                                                  decoration: BoxDecoration(
                                                    color: const Color(0xFFD4A574),
                                                    borderRadius: BorderRadius.circular(20),
                                                    border: Border.all(
                                                      color: Colors.white.withValues(alpha: 0.5),
                                                      width: 1.5,
                                                    ),
                                                  ),
                                                  child: Row(
                                                    mainAxisSize: MainAxisSize.min,
                                                    children: [
                                                      const Icon(Icons.lock_open, color: Colors.white, size: 14),
                                                      const SizedBox(width: 6),
                                                      Text(
                                                        _getPremiumUpgradeText(),
                                                        style: GoogleFonts.poppins(
                                                          fontSize: 12,
                                                          fontWeight: FontWeight.bold,
                                                          color: Colors.white,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ],
                                          ),
                                        ),
                                      ),
                                      
                                      if (isExpanded) ...[
                                        const SizedBox(height: 16),
                                        Flexible(
                                          child: SingleChildScrollView(
                                            child: Padding(
                                              padding: const EdgeInsets.symmetric(horizontal: 16),
                                              child: Text.rich(
                                                TextSpan(
                                                  children: _buildDescriptionSpans(description),
                                                ),
                                                style: GoogleFonts.poppins(
                                                  fontSize: 14,
                                                  color: Colors.white.withValues(alpha: 0.9),
                                                  height: 1.4,
                                                ),
                                                textAlign: TextAlign.center,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ],
                                  ),
                                ),
                              ),
                              
                              Column(
                                children: [
                                  TextButton.icon(
                                    onPressed: () {
                                      setState(() {
                                        expandedStates[category] = !isExpanded;
                                      });
                                    },
                                    icon: Icon(
                                      isExpanded ? Icons.expand_less : Icons.expand_more,
                                      color: Colors.white,
                                    ),
                                    label: Text(
                                      isExpanded ? l10n.showLess : l10n.readMore,
                                      style: GoogleFonts.poppins(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    style: TextButton.styleFrom(
                                      backgroundColor: Colors.white.withValues(alpha: 0.2),
                                      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                    ),
                                  ),
                                  
                                  const SizedBox(height: 12),
                                  
                                  Text(
                                    isLocked ? 'Premium' : l10n.tapToPlay,
                                    style: GoogleFonts.poppins(
                                      fontSize: 14,
                                      color: Colors.white.withValues(alpha: 0.7),
                                    ),
                                  ),
                                ],
                              ),
                            ],
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