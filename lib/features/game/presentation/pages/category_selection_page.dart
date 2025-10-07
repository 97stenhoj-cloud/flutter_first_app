import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../core/utils/theme_helper.dart';
import '../../../../core/utils/unlock_manager.dart';
import '../../../../core/constants/app_constants.dart';
import '../../../../core/services/supabase_service.dart';
import 'game_page.dart';

class CategorySelectionPage extends StatefulWidget {
  final int playerCount;
  final String gameMode;
  final bool isDarkMode;
  
  const CategorySelectionPage({
    super.key,
    required this.playerCount,
    required this.gameMode,
    required this.isDarkMode,
  });

  @override
  State<CategorySelectionPage> createState() => _CategorySelectionPageState();
}

class _CategorySelectionPageState extends State<CategorySelectionPage> {
  final unlockManager = UnlockManager();
  final supabaseService = SupabaseService();
  
  List<String> categories = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadCategories();
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: ThemeHelper.getSecondaryGradient(widget.isDarkMode),
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(AppConstants.defaultPadding),
            child: Column(
              children: [
                // Header with back button
                Row(
                  children: [
                    IconButton(
                      onPressed: () => Navigator.pop(context),
                      icon: Icon(
                        Icons.arrow_back,
                        color: ThemeHelper.getTextColor(widget.isDarkMode),
                        size: 28,
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Text(
                        'Choose a Category',
                        style: GoogleFonts.poppins(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: ThemeHelper.getTextColor(widget.isDarkMode),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                
                // Category list
                Expanded(
                  child: isLoading
                      ? Center(
                          child: CircularProgressIndicator(
                            color: ThemeHelper.getTextColor(widget.isDarkMode),
                          ),
                        )
                      : categories.isEmpty
                          ? Center(
                              child: Text(
                                'No categories found',
                                style: GoogleFonts.poppins(
                                  fontSize: 18,
                                  color: ThemeHelper.getTextColor(widget.isDarkMode),
                                ),
                              ),
                            )
                          : ListView.builder(
                              itemCount: categories.length,
                              itemBuilder: (context, index) {
                                final categoryName = categories[index];
                                final isLocked = _isCategoryLocked(categoryName);
                                
                                return Padding(
                                  padding: const EdgeInsets.only(bottom: 16),
                                  child: _buildCategoryButton(
                                    context,
                                    categoryName: categoryName,
                                    isLocked: isLocked,
                                  ),
                                );
                              },
                            ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  bool _isCategoryLocked(String categoryName) {
    // Get the locked categories for this game mode from AppConstants
    final gameModeCategories = AppConstants.gameCategories[widget.gameMode];
    if (gameModeCategories == null) return false;
    
    // Find the category in the constants to check if it's locked
    final categoryData = gameModeCategories.firstWhere(
      (cat) => cat['name'] == categoryName,
      orElse: () => {'name': categoryName, 'locked': false},
    );
    
    final isLocked = (categoryData['locked'] as bool) && 
                     !unlockManager.isBundleUnlocked(widget.gameMode);
    
    return isLocked;
  }

  Widget _buildCategoryButton(
    BuildContext context, {
    required String categoryName,
    required bool isLocked,
  }) {
    List<Color> gradientColors;
    
    if (isLocked) {
      gradientColors = [
        Colors.grey.shade600,
        Colors.grey.shade700,
      ];
    } else {
      switch (widget.gameMode) {
        case 'Couple':
          gradientColors = widget.isDarkMode
              ? [const Color(0xFFAD1457), const Color(0xFF880E4F)]
              : [const Color(0xFFF8BBD9), const Color(0xFFF48FB1)];
          break;
        case 'Friends':
          gradientColors = widget.isDarkMode
              ? [const Color(0xFFFF8F00), const Color(0xFFFF6F00)]
              : [const Color(0xFFFFE0B2), const Color(0xFFFFCC80)];
          break;
        case 'Family':
          gradientColors = widget.isDarkMode
              ? [const Color(0xFF8D6E63), const Color(0xFF6D4C41)]
              : [const Color(0xFFBCAAA4), const Color(0xFFA1887F)];
          break;
        default:
          gradientColors = [
            const Color.fromRGBO(245, 100, 105, 1),
            const Color.fromRGBO(220, 75, 85, 1),
          ];
      }
    }
    
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: gradientColors,
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: isLocked
              ? () {
                  _showSubscriptionDialog(context);
                }
              : () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => GamePage(
                        playerCount: widget.playerCount,
                        gameMode: widget.gameMode,
                        category: categoryName,
                        isDarkMode: widget.isDarkMode,
                      ),
                    ),
                  );
                },
          borderRadius: BorderRadius.circular(12),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    categoryName,
                    style: GoogleFonts.poppins(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                ),
                if (isLocked)
                  const Icon(
                    Icons.lock,
                    color: Colors.white70,
                    size: 24,
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _showSubscriptionDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        contentPadding: const EdgeInsets.all(24),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Choose Your Subscription',
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.bold,
                fontSize: 24,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),
            Text(
              'Unlock premium categories and get access to exclusive question packs',
              style: GoogleFonts.poppins(
                fontSize: 14,
                color: Colors.grey[600],
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 24),
            
            // 1 Bundle
            _buildSubscriptionOption(
              context: context,
              bundleCount: 1,
              price: '59 DKK',
              description: 'Choose 1 category bundle',
              color: const Color(0xFFAD1457),
            ),
            const SizedBox(height: 12),
            
            // 2 Bundles
            _buildSubscriptionOption(
              context: context,
              bundleCount: 2,
              price: '109 DKK',
              description: 'Choose 2 category bundles',
              color: const Color(0xFFFF8F00),
              popular: true,
            ),
            const SizedBox(height: 12),
            
            // 3 Bundles (All)
            _buildSubscriptionOption(
              context: context,
              bundleCount: 3,
              price: '149 DKK',
              description: 'All 3 category bundles',
              color: const Color(0xFF8D6E63),
              badge: 'BEST VALUE',
            ),
            
            const SizedBox(height: 20),
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text(
                'Maybe Later',
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w600,
                  color: Colors.grey,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSubscriptionOption({
    required BuildContext context,
    required int bundleCount,
    required String price,
    required String description,
    required Color color,
    bool popular = false,
    String? badge,
  }) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [color, color.withValues(alpha: 0.8)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(16),
            border: popular 
                ? Border.all(color: Colors.amber, width: 2)
                : null,
          ),
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: () {
                Navigator.pop(context);
                _showBundleSelection(context, bundleCount, price);
              },
              borderRadius: BorderRadius.circular(16),
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            description,
                            style: GoogleFonts.poppins(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            '$price/month',
                            style: GoogleFonts.poppins(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.white,
                      size: 20,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        if (badge != null)
          Positioned(
            top: -10,
            right: 10,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
              decoration: BoxDecoration(
                color: Colors.amber,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                badge,
                style: GoogleFonts.poppins(
                  fontSize: 11,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
            ),
          ),
      ],
    );
  }

  void _showBundleSelection(BuildContext context, int bundleCount, String price) {
    final availableBundles = ['Couple', 'Friends', 'Family'];
    final selectedBundles = <String>[];

    showDialog(
      context: context,
      builder: (context) => StatefulBuilder(
        builder: (context, setDialogState) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            title: Text(
              bundleCount == 3 
                  ? 'Unlock All Bundles'
                  : 'Select ${bundleCount == 1 ? "Your" : "$bundleCount"} Bundle${bundleCount > 1 ? "s" : ""}',
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
              textAlign: TextAlign.center,
            ),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                if (bundleCount < 3) ...[
                  Text(
                    'Select the category bundle${bundleCount > 1 ? "s" : ""} you want to unlock',
                    style: GoogleFonts.poppins(fontSize: 14),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 20),
                  ...availableBundles.map((bundle) {
                    final isSelected = selectedBundles.contains(bundle);
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 12),
                      child: CheckboxListTile(
                        title: Text(
                          bundle,
                          style: GoogleFonts.poppins(fontWeight: FontWeight.w600),
                        ),
                        subtitle: Text(
                          '4 premium categories',
                          style: GoogleFonts.poppins(fontSize: 12),
                        ),
                        value: isSelected,
                        onChanged: selectedBundles.length >= bundleCount && !isSelected
                            ? null
                            : (value) {
                                setDialogState(() {
                                  if (value == true) {
                                    selectedBundles.add(bundle);
                                  } else {
                                    selectedBundles.remove(bundle);
                                  }
                                });
                              },
                        activeColor: const Color(0xFFAD1457),
                      ),
                    );
                  }),
                ] else ...[
                  Text(
                    'Get access to all premium categories in all 3 bundles!',
                    style: GoogleFonts.poppins(fontSize: 14),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 16),
                  ...availableBundles.map((bundle) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 8),
                      child: Row(
                        children: [
                          const Icon(Icons.check_circle, color: Colors.green, size: 20),
                          const SizedBox(width: 12),
                          Text(
                            '$bundle Bundle',
                            style: GoogleFonts.poppins(
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    );
                  }),
                ],
                const SizedBox(height: 16),
                Text(
                  price,
                  style: GoogleFonts.poppins(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: const Color(0xFFAD1457),
                  ),
                ),
                Text(
                  'per month',
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    color: Colors.grey,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  'Demo: Unlocks will reset on app restart',
                  style: GoogleFonts.poppins(
                    fontSize: 11,
                    color: Colors.grey,
                    fontStyle: FontStyle.italic,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: Text(
                  'Cancel',
                  style: GoogleFonts.poppins(fontWeight: FontWeight.w600),
                ),
              ),
              ElevatedButton(
                onPressed: (bundleCount == 3 || selectedBundles.length == bundleCount)
                    ? () {
                        final bundlesToUnlock = bundleCount == 3 
                            ? availableBundles 
                            : selectedBundles;
                        
                        unlockManager.unlockMultipleBundles(bundlesToUnlock);
                        Navigator.pop(context);
                        setState(() {});
                        
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              'Subscription activated! ${bundlesToUnlock.join(", ")} unlocked.',
                              style: GoogleFonts.poppins(),
                            ),
                            backgroundColor: Colors.green,
                            duration: const Duration(seconds: 3),
                          ),
                        );
                      }
                    : null,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFAD1457),
                  foregroundColor: Colors.white,
                  disabledBackgroundColor: Colors.grey[300],
                ),
                child: Text(
                  'Subscribe',
                  style: GoogleFonts.poppins(fontWeight: FontWeight.w600),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}