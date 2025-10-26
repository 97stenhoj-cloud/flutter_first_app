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

// Category descriptions
const Map<String, String> categoryDescriptions = {
  // Couple mode
  'Love Talks': 'Explore romance, chemistry, and connection through heartfelt questions that celebrate your relationship. From "how we met" moments to what makes you feel most loved, these cards deepen emotional intimacy.',
  'Deep Talks': 'These cards dive into values, vulnerability, and what it means to grow together. They help partners reflect on independence, communication, and shared purpose.',
  'Silly Talks': 'Pure fun and laughter! These quirky, light-hearted prompts uncover your weirdest habits, funniest thoughts, and most random "what ifs." Great for friends, family, or couples who love not taking life too seriously.',
  'Car Talks': 'Perfect for road trips or long drives, this deck turns time on the road into great conversation. Expect funny, creative, and nostalgic prompts about travel, adventure, and personality quirks. Keeps everyone talking long after the music fades.',
  'Spicy Talks': 'Flirty, bold, and intimate — these cards invite couples to explore desire, fantasies, and passion together. Every question is crafted to spark honest, exciting conversations about what turns you on and brings you closer. Best for nights when sparks should fly.',
  'Do-you-dare Talks': 'A fearless deck that blends emotional honesty with hot-button topics. Expect questions about trust, politics, religion, money, and personal boundaries — all designed to reveal what really matters to you both. Disclaimer: Some questions are raw and unfiltered — they can spark breakthrough conversations or touch sensitive nerves. Play with openness, empathy, and respect.',
  'Love Languages Remix Talks': 'Inspired by the five love languages, this deck helps partners express affection in the ways that truly resonate. Discover how words, actions, and gestures make your connection stronger. A must-have for couples who want to love more intentionally.',
  
  // Friends mode
  'Cozy Talks': 'Warm and easygoing questions that make you feel right at home. They spark comforting chats about small joys, memories, and what makes you smile. Great for lazy Sundays, rainy days, or getting to know someone gently.',
  'Party Night Talks': 'Your go-to ice-breaker deck for fun nights with friends. These lively questions spark laughter, stories, and playful debates — from party fails to who\'s the biggest flirt on the dance floor. Perfect for loosening up the mood and keeping the good times rolling.',
  'Unpopular Opinions XL ': 'The deck that dares you to say what everyone else is thinking but won\'t admit. From tipping culture to influencer fame, social rules, and modern values — these cards spark honest debates and surprising insights. Perfect for friends who love good conversation, strong opinions, and a little healthy disagreement.',
  'After Dark Talks': 'Enter the eerie side of conversation with questions that send shivers down your spine. From creepy coincidences to survival fears and "what would you do" horror moments, this deck is made to thrill and unsettle. Perfect for late-night hangs, candlelight chills, or anyone who loves a good scare.',
  'Plot Twists & Dilemmas ': 'This deck drops you right into life\'s funniest and trickiest "what would you do?" moments. From loyalty tests to outrageous hypotheticals, it\'s all about quick thinking, gut reactions, and seeing how everyone handles a curveball. Perfect for group nights full of laughter, surprises, and revealing who\'s really got your back.',
  
  // Family mode
  'History Talks': 'A nostalgic mix of personal memories and family moments. These questions inspire storytelling, laughter, and rediscovery of your roots. Perfect for family gatherings, reunions, or cozy evenings together with loved ones.',
  'Tiny Talks': 'Made for parents and their little ones, this deck turns everyday moments into playful conversations. With fun, simple questions about imagination, favorites, and silly ideas, it helps kids express themselves while parents learn more about how they think. Perfect for ages 3 to 9.',
  'The Good Old Days Talks': 'A nostalgic journey through the past — from childhood memories to how life has changed. These cards spark laughter, stories, and appreciation for how far we\'ve come. Perfect for grandparents to share their memories and connect across generations.',
  'Would You Rather Talks': 'A family-friendly twist on the classic "Would you rather…" game. Packed with funny, imaginative choices that get everyone thinking, laughing, and defending their picks.',
};

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
  'friends_Green & Red Flags': 'https://tpjsebutbieghpmvpktv.supabase.co/storage/v1/object/public/category_icons/friends.png',
  
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
  Map<String, bool> expandedStates = {}; // Track which cards are expanded
List<TextSpan> _buildDescriptionSpans(String description) {
  if (description.contains('Disclaimer:')) {
    final parts = description.split('Disclaimer:');
    return [
      TextSpan(text: parts[0]),
      TextSpan(text: '\n\n'),
      TextSpan(
        text: 'Disclaimer:${parts[1]}',
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
  final isExpanded = expandedStates[category] ?? false;
  final description = categoryDescriptions[category] ?? 'Discover amazing questions in this category!';
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
                      // Background Image
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
                      
                      // Content
                      Padding(
                        padding: const EdgeInsets.all(24),
                        child: Column(
                          children: [
                            // Top Section
                            // Top Section - Perfectly Centered
                            Expanded(
                              child: Center(
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                  
                                  // Lock Icon
                                  if (isLocked)
                                    const Icon(
                                      Icons.lock,
                                      size: 48,
                                      color: Colors.white,
                                    ),
                                  if (isLocked) const SizedBox(height: 16),
                                  
                                  // Category Name
                                  Flexible(
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 16),
                                      child: Text(
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
                                    ),
                                  ),
                                  
                                  // Expanded Description
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
                            // Bottom Section - Buttons
                            Column(
                              children: [
                                // Read More / Read Less Button
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
                                
                                // Tap to Play Text
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
                        ),],

                  ),
                ),
              ],),
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