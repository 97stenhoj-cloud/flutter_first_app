// lib/features/game/presentation/pages/category_selection_page.dart
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../core/utils/theme_helper.dart';
import '../../../../core/utils/unlock_manager.dart';
import '../../../../core/constants/app_constants.dart';
import '../../../../core/services/supabase_service.dart';
import 'game_page.dart';
import '../../../../l10n/app_localizations.dart';

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
    
    return Scaffold(
      body: Container(
        decoration: ThemeHelper.getBackgroundDecoration(widget.isDarkMode), // Use main background
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
                    ? const Center(child: CircularProgressIndicator(color: Colors.white))
                    : categories.isEmpty
                        ? Center(
                            child: Text(
                              'No categories found',
                              style: GoogleFonts.poppins(
                                color: ThemeHelper.getBodyTextColor(widget.isDarkMode),
                                fontSize: 18,
                              ),
                            ),
                          )
                        : GridView.builder(
                            padding: const EdgeInsets.all(AppConstants.defaultPadding),
                            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              childAspectRatio: 1,
                              crossAxisSpacing: 16,
                              mainAxisSpacing: 16,
                            ),
                            itemCount: categories.length,
                            itemBuilder: (context, index) {
                              final category = categories[index];
                              final isLocked = _isCategoryLocked(category);
                              final colors = ThemeHelper.getGameModeGradient(widget.gameMode, widget.isDarkMode);
                              
                              return GestureDetector(
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
                                      colors: isLocked
                                          ? [Colors.grey[400]!, Colors.grey[600]!]
                                          : colors,
                                      begin: Alignment.topLeft,
                                      end: Alignment.bottomRight,
                                    ),
                                    borderRadius: BorderRadius.circular(12),
                                    boxShadow: ThemeHelper.getButtonShadow(widget.isDarkMode),
                                  ),
                                  child: Stack(
                                    alignment: Alignment.center,
                                    children: [
                                      Text(
                                        category,
                                        style: GoogleFonts.poppins(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w600,
                                          color: Colors.white,
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                      if (isLocked)
                                        const Positioned(
                                          top: 8,
                                          right: 8,
                                          child: Icon(
                                            Icons.lock,
                                            color: Colors.white70,
                                            size: 20,
                                          ),
                                        ),
                                    ],
                                  ),
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