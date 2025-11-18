// lib/features/ai_deck/presentation/pages/ai_deck_creator_screen.dart

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/utils/theme_helper.dart';
import '../../../../core/widgets/custom_dialog.dart';
import '../../../../core/providers/unlock_provider.dart';
import '../../../../l10n/app_localizations.dart';
import '../../models/ai_deck_model.dart';
import 'ai_question_review_screen.dart';

class AIDeckCreatorScreen extends ConsumerStatefulWidget {
  final bool isDarkMode;

  const AIDeckCreatorScreen({super.key, required this.isDarkMode});

  @override
  ConsumerState<AIDeckCreatorScreen> createState() => _AIDeckCreatorScreenState();
}

class _AIDeckCreatorScreenState extends ConsumerState<AIDeckCreatorScreen> {
  final _occasionController = TextEditingController();
  final _remarksController = TextEditingController();

  double _energyValue = 3.0;
  double _depthValue = 3.0;
  double _spiceValue = 2.0;
  int _groupSize = 4;
  bool _isGenerating = false;

  @override
  void dispose() {
    _occasionController.dispose();
    _remarksController.dispose();
    super.dispose();
  }

  Future<void> _generateQuestions() async {
    final l10n = AppLocalizations.of(context)!;

    // Validate inputs
    if (_occasionController.text.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(l10n.pleaseEnterOccasion, style: GoogleFonts.poppins()),
          backgroundColor: Colors.orange,
        ),
      );
      return;
    }

    // Check premium status
    final isPremium = ref.read(unlockProvider).isPremium;
    if (!isPremium) {
      _showPremiumDialog();
      return;
    }

    setState(() {
      _isGenerating = true;
    });

    try {
      // Create generation prompts
      // Note: numCards is set to 10 - users generate in 10-card batches until they save or hit 50 total
      final prompts = GenerationPrompts(
        occasion: _occasionController.text.trim(),
        groupSize: _groupSize,
        numCards: 10, // Always 10 cards per batch
        energy: _energyValue.toInt(),
        depth: _depthValue.toInt(),
        spice: _spiceValue.toInt(),
        remarks: _remarksController.text.trim().isEmpty ? null : _remarksController.text.trim(),
      );

      // Navigate to review screen
      if (!mounted) return;

      final result = await Navigator.push<String>(
        context,
        MaterialPageRoute(
          builder: (context) => AIQuestionReviewScreen(
            prompts: prompts,
            isDarkMode: widget.isDarkMode,
          ),
        ),
      );

      // If a deck was created, go back to deck list
      if (result != null && mounted) {
        Navigator.pop(context, result);
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              l10n.errorGeneratingQuestions(e.toString()),
              style: GoogleFonts.poppins(),
            ),
            backgroundColor: Colors.red,
          ),
        );
      }
    } finally {
      if (mounted) {
        setState(() {
          _isGenerating = false;
        });
      }
    }
  }

  void _showPremiumDialog() {
    final l10n = AppLocalizations.of(context)!;
    showDialog(
      context: context,
      builder: (context) => CustomDialog(
        isDarkMode: widget.isDarkMode,
        icon: Icons.workspace_premium,
        iconColor: const Color(0xFFFFD700),
        title: l10n.premiumFeatureTitle,
        content: l10n.aiDeckPremiumMessage,
        actions: [
          DialogButton(
            text: l10n.mayBeLater,
            onPressed: () => Navigator.pop(context),
            isDarkMode: widget.isDarkMode,
          ),
          const SizedBox(height: 12),
          DialogButton(
            text: l10n.getPremium,
            onPressed: () {
              Navigator.pop(context);
              // Navigate to premium screen
              // TODO: Navigate to premium subscription page
            },
            isPrimary: true,
            isDarkMode: widget.isDarkMode,
            icon: Icons.star,
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
        decoration: ThemeHelper.getBackgroundDecoration(widget.isDarkMode),
        child: SafeArea(
          child: Column(
            children: [
              // Header
              Padding(
                padding: const EdgeInsets.all(20),
                child: Row(
                  children: [
                    IconButton(
                      onPressed: () => Navigator.pop(context),
                      icon: Icon(
                        Icons.arrow_back,
                        color: ThemeHelper.getTextColor(widget.isDarkMode),
                        size: 28,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        l10n.createAiDeck,
                        style: GoogleFonts.poppins(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: ThemeHelper.getTextColor(widget.isDarkMode),
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(
                          colors: [Color(0xFF9C27B0), Color(0xFF673AB7)],
                        ),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Icon(Icons.auto_awesome, color: Colors.white, size: 16),
                          const SizedBox(width: 4),
                          Text(
                            'AI',
                            style: GoogleFonts.poppins(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              // Form content
              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Occasion input
                      _buildSectionTitle(l10n.whatIsTheOccasion),
                      const SizedBox(height: 8),
                      TextField(
                        controller: _occasionController,
                        decoration: InputDecoration(
                          hintText: l10n.occasionHint,
                          filled: true,
                          fillColor: widget.isDarkMode
                              ? Colors.white.withValues(alpha: 0.1)
                              : Colors.black.withValues(alpha: 0.05),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide.none,
                          ),
                          prefixIcon: Icon(
                            Icons.celebration,
                            color: ThemeHelper.getMutedTextColor(widget.isDarkMode),
                          ),
                        ),
                        style: GoogleFonts.poppins(
                          color: ThemeHelper.getTextColor(widget.isDarkMode),
                        ),
                      ),
                      const SizedBox(height: 24),

                      // Energy slider
                      _buildSectionTitle('Energy'),
                      const SizedBox(height: 8),
                      Text(
                        'How energetic is the vibe?',
                        style: GoogleFonts.poppins(
                          fontSize: 12,
                          color: ThemeHelper.getMutedTextColor(widget.isDarkMode),
                        ),
                      ),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          Icon(
                            Icons.self_improvement,
                            color: const Color(0xFFFF9800),
                            size: 20,
                          ),
                          const SizedBox(width: 8),
                          Text(
                            'Super chill',
                            style: GoogleFonts.poppins(
                              fontSize: 12,
                              color: const Color(0xFFFF9800),
                            ),
                          ),
                          Expanded(
                            child: Slider(
                              value: _energyValue,
                              min: 1,
                              max: 5,
                              divisions: 4,
                              label: _energyValue.toInt().toString(),
                              activeColor: const Color(0xFFFF9800),
                              inactiveColor: widget.isDarkMode
                                  ? Colors.white.withValues(alpha: 0.3)
                                  : Colors.black.withValues(alpha: 0.2),
                              onChanged: (value) {
                                setState(() {
                                  _energyValue = value;
                                });
                              },
                            ),
                          ),
                          Text(
                            'Wild party',
                            style: GoogleFonts.poppins(
                              fontSize: 12,
                              color: const Color(0xFFFF9800),
                            ),
                          ),
                          const SizedBox(width: 8),
                          Icon(
                            Icons.celebration,
                            color: const Color(0xFFFF9800),
                            size: 20,
                          ),
                        ],
                      ),
                      Center(
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                          decoration: BoxDecoration(
                            color: const Color(0xFFFF9800).withValues(alpha: 0.2),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Text(
                            'Level: ${_energyValue.toInt()}/5',
                            style: GoogleFonts.poppins(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: const Color(0xFFFF9800),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 24),

                      // Depth slider
                      _buildSectionTitle('Depth'),
                      const SizedBox(height: 8),
                      Text(
                        'How personal and vulnerable?',
                        style: GoogleFonts.poppins(
                          fontSize: 12,
                          color: ThemeHelper.getMutedTextColor(widget.isDarkMode),
                        ),
                      ),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          Icon(
                            Icons.pool,
                            color: const Color(0xFF2196F3),
                            size: 20,
                          ),
                          const SizedBox(width: 8),
                          Text(
                            'Light',
                            style: GoogleFonts.poppins(
                              fontSize: 12,
                              color: const Color(0xFF2196F3),
                            ),
                          ),
                          Expanded(
                            child: Slider(
                              value: _depthValue,
                              min: 1,
                              max: 5,
                              divisions: 4,
                              label: _depthValue.toInt().toString(),
                              activeColor: const Color(0xFF2196F3),
                              inactiveColor: widget.isDarkMode
                                  ? Colors.white.withValues(alpha: 0.3)
                                  : Colors.black.withValues(alpha: 0.2),
                              onChanged: (value) {
                                setState(() {
                                  _depthValue = value;
                                });
                              },
                            ),
                          ),
                          Text(
                            'Very deep',
                            style: GoogleFonts.poppins(
                              fontSize: 12,
                              color: const Color(0xFF2196F3),
                            ),
                          ),
                          const SizedBox(width: 8),
                          Icon(
                            Icons.scuba_diving,
                            color: const Color(0xFF2196F3),
                            size: 20,
                          ),
                        ],
                      ),
                      Center(
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                          decoration: BoxDecoration(
                            color: const Color(0xFF2196F3).withValues(alpha: 0.2),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Text(
                            'Level: ${_depthValue.toInt()}/5',
                            style: GoogleFonts.poppins(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: const Color(0xFF2196F3),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 24),

                      // Spice slider
                      _buildSectionTitle('Spice'),
                      const SizedBox(height: 8),
                      Text(
                        'How bold and flirty?',
                        style: GoogleFonts.poppins(
                          fontSize: 12,
                          color: ThemeHelper.getMutedTextColor(widget.isDarkMode),
                        ),
                      ),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          Icon(
                            Icons.family_restroom,
                            color: const Color(0xFFE91E63),
                            size: 20,
                          ),
                          const SizedBox(width: 8),
                          Text(
                            'Wholesome',
                            style: GoogleFonts.poppins(
                              fontSize: 12,
                              color: const Color(0xFFE91E63),
                            ),
                          ),
                          Expanded(
                            child: Slider(
                              value: _spiceValue,
                              min: 1,
                              max: 4,
                              divisions: 3,
                              label: _spiceValue.toInt().toString(),
                              activeColor: const Color(0xFFE91E63),
                              inactiveColor: widget.isDarkMode
                                  ? Colors.white.withValues(alpha: 0.3)
                                  : Colors.black.withValues(alpha: 0.2),
                              onChanged: (value) {
                                setState(() {
                                  _spiceValue = value;
                                });
                              },
                            ),
                          ),
                          Text(
                            'Spicy',
                            style: GoogleFonts.poppins(
                              fontSize: 12,
                              color: const Color(0xFFE91E63),
                            ),
                          ),
                          const SizedBox(width: 8),
                          Icon(
                            Icons.local_fire_department,
                            color: const Color(0xFFE91E63),
                            size: 20,
                          ),
                        ],
                      ),
                      Center(
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                          decoration: BoxDecoration(
                            color: const Color(0xFFE91E63).withValues(alpha: 0.2),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Text(
                            'Level: ${_spiceValue.toInt()}/4',
                            style: GoogleFonts.poppins(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: const Color(0xFFE91E63),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 24),

                      // Group size
                      _buildSectionTitle(l10n.sizeOfGroup),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              color: widget.isDarkMode
                                  ? Colors.white.withValues(alpha: 0.1)
                                  : Colors.black.withValues(alpha: 0.05),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                IconButton(
                                  onPressed: _groupSize > 2
                                      ? () {
                                          setState(() {
                                            _groupSize--;
                                          });
                                        }
                                      : null,
                                  icon: const Icon(Icons.remove),
                                  color: ThemeHelper.getTextColor(widget.isDarkMode),
                                ),
                                Container(
                                  width: 60,
                                  alignment: Alignment.center,
                                  child: Text(
                                    _groupSize.toString(),
                                    style: GoogleFonts.poppins(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: ThemeHelper.getTextColor(widget.isDarkMode),
                                    ),
                                  ),
                                ),
                                IconButton(
                                  onPressed: _groupSize < 10
                                      ? () {
                                          setState(() {
                                            _groupSize++;
                                          });
                                        }
                                      : null,
                                  icon: const Icon(Icons.add),
                                  color: ThemeHelper.getTextColor(widget.isDarkMode),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(width: 16),
                          Icon(
                            Icons.people,
                            color: ThemeHelper.getMutedTextColor(widget.isDarkMode),
                          ),
                          const SizedBox(width: 8),
                          Text(
                            l10n.people,
                            style: GoogleFonts.poppins(
                              color: ThemeHelper.getMutedTextColor(widget.isDarkMode),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 24),

                      // Remarks (optional)
                      _buildSectionTitle(l10n.anyOtherRemarks),
                      const SizedBox(height: 8),
                      TextField(
                        controller: _remarksController,
                        maxLines: 3,
                        decoration: InputDecoration(
                          hintText: l10n.remarksHint,
                          filled: true,
                          fillColor: widget.isDarkMode
                              ? Colors.white.withValues(alpha: 0.1)
                              : Colors.black.withValues(alpha: 0.05),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide.none,
                          ),
                          prefixIcon: Padding(
                            padding: const EdgeInsets.only(left: 12, right: 8, bottom: 50),
                            child: Icon(
                              Icons.notes,
                              color: ThemeHelper.getMutedTextColor(widget.isDarkMode),
                            ),
                          ),
                        ),
                        style: GoogleFonts.poppins(
                          color: ThemeHelper.getTextColor(widget.isDarkMode),
                        ),
                      ),
                      const SizedBox(height: 32),

                      // Generate button
                      Center(
                        child: Container(
                          width: double.infinity,
                          height: 60,
                          decoration: BoxDecoration(
                            gradient: const LinearGradient(
                              colors: [Color(0xFF9C27B0), Color(0xFF673AB7)],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                            ),
                            borderRadius: BorderRadius.circular(30),
                            boxShadow: [
                              BoxShadow(
                                color: const Color(0xFF9C27B0).withValues(alpha: 0.3),
                                blurRadius: 20,
                                offset: const Offset(0, 10),
                              ),
                            ],
                          ),
                          child: Material(
                            color: Colors.transparent,
                            child: InkWell(
                              onTap: _isGenerating ? null : _generateQuestions,
                              borderRadius: BorderRadius.circular(30),
                              child: Center(
                                child: _isGenerating
                                    ? const CircularProgressIndicator(
                                        valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                                      )
                                    : Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          const Icon(
                                            Icons.auto_awesome,
                                            color: Colors.white,
                                            size: 24,
                                          ),
                                          const SizedBox(width: 12),
                                          Text(
                                            l10n.generateQuestions,
                                            style: GoogleFonts.poppins(
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ],
                                      ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 32),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: GoogleFonts.poppins(
        fontSize: 16,
        fontWeight: FontWeight.w600,
        color: ThemeHelper.getTextColor(widget.isDarkMode),
      ),
    );
  }
}