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
  
  List<String> categories = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    // FIXED: Only load categories if NOT personal mode
    if (widget.gameMode.toLowerCase() != 'personal') {
      _loadCategories();
    } else {
      setState(() {
        isLoading = false;
      });
    }
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
                        : ListView.builder(
                            padding: const EdgeInsets.all(AppConstants.defaultPadding),
                            itemCount: categories.length,
                            itemBuilder: (context, index) {
                              final category = categories[index];
                              final isLocked = _isCategoryLocked(category);
                              
                              return Padding(
                                padding: const EdgeInsets.only(bottom: 16),
                                child: ThemeHelper.buildLayeredButton(
                                  text: category,
                                  icon: isLocked ? Icons.lock : null,
                                  onPressed: () {
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
                                  isPrimary: !isLocked,
                                  isDarkMode: widget.isDarkMode,
                                ),
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
}