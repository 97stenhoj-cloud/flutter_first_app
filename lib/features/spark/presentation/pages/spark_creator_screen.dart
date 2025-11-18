// lib/features/spark/presentation/pages/spark_creator_screen.dart

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/utils/theme_helper.dart';
import '../../../../core/providers/unlock_provider.dart';
import '../../../../l10n/app_localizations.dart';
import '../../models/spark_question.dart';
import '../../services/spark_service.dart';
import 'spark_question_view_screen.dart';
import 'spark_history_screen.dart';
import '../../../../core/widgets/custom_dialog.dart';
import '../../../subscription/presentation/pages/subscription_page_new.dart';

class SparkCreatorScreen extends ConsumerStatefulWidget {
  final bool isDarkMode;

  const SparkCreatorScreen({super.key, required this.isDarkMode});

  @override
  ConsumerState<SparkCreatorScreen> createState() => _SparkCreatorScreenState();
}

class _SparkCreatorScreenState extends ConsumerState<SparkCreatorScreen> {
  final _occasionController = TextEditingController();
  final _additionalPromptController = TextEditingController();
  final _sparkService = SparkService();

  // Question count slider (5, 10, 15, 20, 25)
  int _questionCount = 10;

  // Other sliders
  double _energyValue = 3.0;
  double _depthValue = 3.0;
  double _spiceValue = 2.0;
  int _groupSize = 4;

  bool _isGenerating = false;

  @override
  void dispose() {
    _occasionController.dispose();
    _additionalPromptController.dispose();
    super.dispose();
  }

  Future<void> _generateSparkQuestions() async {
    final l10n = AppLocalizations.of(context)!;

    // Validate occasion input
    if (_occasionController.text.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(l10n.pleaseEnterOccasion, style: GoogleFonts.poppins()),
          backgroundColor: Colors.orange,
        ),
      );
      return;
    }

    // Check if user can use Spark
    final unlockNotifier = ref.read(unlockProvider.notifier);
    if (!unlockNotifier.canUseSpark()) {
      _showPremiumDialog();
      return;
    }

    // Check if user has remaining questions
    final remaining = ref.read(unlockProvider).sparkQuestionsRemaining;
    if (remaining < _questionCount) {
      _showLimitReachedDialog(remaining);
      return;
    }

    setState(() {
      _isGenerating = true;
    });

    try {
      // Create generation parameters
      final params = SparkGenerationParams(
        questionCount: _questionCount,
        energy: _energyValue.toInt(),
        depth: _depthValue.toInt(),
        spice: _spiceValue.toInt(),
        groupSize: _groupSize,
        occasion: _occasionController.text.trim(),
        additionalPrompt: _additionalPromptController.text.trim().isEmpty
            ? null
            : _additionalPromptController.text.trim(),
      );

      // Generate questions
      final questions = await _sparkService.generateSparkQuestions(params: params);

      // Increment usage
      await unlockNotifier.incrementSparkUsage(_questionCount);

      // Navigate to question view screen
      if (!mounted) return;

      await Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => SparkQuestionViewScreen(
            questions: questions,
            isDarkMode: widget.isDarkMode,
          ),
        ),
      );

      // After returning from questions, show completion dialog
      if (mounted) {
        _showCompletionDialog();
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              'Error generating Spark questions: ${e.toString()}',
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
        title: 'Spark Mode - Premium Feature',
        content: 'Spark Mode is available for Premium and Premium+ subscribers. Upgrade now to generate AI-powered questions!',
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

  void _showLimitReachedDialog(int remaining) {
    showDialog(
      context: context,
      builder: (context) => CustomDialog(
        isDarkMode: widget.isDarkMode,
        icon: Icons.warning_amber_rounded,
        iconColor: Colors.orange,
        title: 'Monthly Limit Reached',
        content: 'You only have $remaining Spark questions remaining this month. You\'re trying to generate $_questionCount questions.\n\nUpgrade to Premium+ for 400 questions per month!',
        actions: [
          DialogButton(
            text: 'Cancel',
            onPressed: () => Navigator.pop(context),
            isDarkMode: widget.isDarkMode,
          ),
          const SizedBox(height: 12),
          DialogButton(
            text: 'Upgrade',
            onPressed: () {
              Navigator.pop(context);
              // TODO: Navigate to premium subscription page
            },
            isPrimary: true,
            isDarkMode: widget.isDarkMode,
            icon: Icons.upgrade,
          ),
        ],
      ),
    );
  }

  void _showCompletionDialog() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => CustomDialog(
        isDarkMode: widget.isDarkMode,
        icon: Icons.auto_awesome,
        iconColor: const Color(0xFFFF6B9D),
        title: 'Spark Complete!',
        content: 'What would you like to do next?',
        actions: [
          // Generate More
          DialogButton(
            text: 'Generate More',
            onPressed: () {
              Navigator.pop(context); // Close dialog, stay on creator screen
            },
            isDarkMode: widget.isDarkMode,
            icon: Icons.add_circle_outline,
          ),
          const SizedBox(height: 12),
          // View History
          DialogButton(
            text: 'View History',
            onPressed: () {
              Navigator.pop(context); // Close dialog
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SparkHistoryScreen(isDarkMode: widget.isDarkMode),
                ),
              );
            },
            isDarkMode: widget.isDarkMode,
            icon: Icons.history,
          ),
          const SizedBox(height: 12),
          // Main Menu
          DialogButton(
            text: 'Main Menu',
            onPressed: () {
              Navigator.pop(context); // Close dialog
              Navigator.pop(context); // Go back to main menu
            },
            isPrimary: true,
            isDarkMode: widget.isDarkMode,
            icon: Icons.home,
          ),
        ],
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: GoogleFonts.poppins(
        fontSize: 18,
        fontWeight: FontWeight.bold,
        color: ThemeHelper.getTextColor(widget.isDarkMode),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final unlockState = ref.watch(unlockProvider);
    final remaining = unlockState.sparkQuestionsRemaining;
    final limit = ref.read(unlockProvider.notifier).getSparkLimit();

    return Scaffold(
      body: Stack(
        children: [
          // Main content
          Container(
            decoration: ThemeHelper.getBackgroundDecoration(widget.isDarkMode),
            child: SafeArea(
              child: Column(
                children: [
              // Header with remaining count
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
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              const Icon(Icons.auto_awesome, color: Color(0xFFFF6B9D), size: 24),
                              const SizedBox(width: 8),
                              Text(
                                'Spark Mode',
                                style: GoogleFonts.poppins(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                  color: ThemeHelper.getTextColor(widget.isDarkMode),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 4),
                          Text(
                            '$remaining of $limit questions remaining',
                            style: GoogleFonts.poppins(
                              fontSize: 12,
                              color: ThemeHelper.getMutedTextColor(widget.isDarkMode),
                            ),
                          ),
                        ],
                      ),
                    ),
                    // History button
                    IconButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SparkHistoryScreen(isDarkMode: widget.isDarkMode),
                          ),
                        );
                      },
                      icon: Icon(
                        Icons.history,
                        color: ThemeHelper.getTextColor(widget.isDarkMode),
                        size: 28,
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
                      // Question count slider (5-25 in intervals of 5)
                      _buildSectionTitle('How many questions?'),
                      const SizedBox(height: 16),
                      Center(
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                          decoration: BoxDecoration(
                            gradient: const LinearGradient(
                              colors: [Color(0xFFFF6B9D), Color(0xFFFF8FA3)],
                            ),
                            borderRadius: BorderRadius.circular(30),
                            boxShadow: [
                              BoxShadow(
                                color: const Color(0xFFFF6B9D).withValues(alpha: 0.3),
                                blurRadius: 12,
                                offset: const Offset(0, 4),
                              ),
                            ],
                          ),
                          child: Text(
                            '$_questionCount Questions',
                            style: GoogleFonts.poppins(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),
                      Row(
                        children: [
                          Text(
                            '5',
                            style: GoogleFonts.poppins(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: const Color(0xFFFF6B9D),
                            ),
                          ),
                          Expanded(
                            child: Slider(
                              value: _questionCount.toDouble(),
                              min: 5,
                              max: 25,
                              divisions: 4, // 5 intervals: 5, 10, 15, 20, 25
                              label: _questionCount.toString(),
                              activeColor: const Color(0xFFFF6B9D),
                              inactiveColor: widget.isDarkMode
                                  ? Colors.white.withValues(alpha: 0.3)
                                  : Colors.black.withValues(alpha: 0.2),
                              onChanged: (value) {
                                setState(() {
                                  _questionCount = value.toInt();
                                });
                              },
                            ),
                          ),
                          Text(
                            '25',
                            style: GoogleFonts.poppins(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: const Color(0xFFFF6B9D),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 32),

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

                      // Group size picker
                      _buildSectionTitle('Group size'),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          IconButton(
                            onPressed: _groupSize > 2
                                ? () => setState(() => _groupSize--)
                                : null,
                            icon: const Icon(Icons.remove_circle_outline),
                            color: const Color(0xFFFF6B9D),
                          ),
                          Expanded(
                            child: Center(
                              child: Container(
                                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                                decoration: BoxDecoration(
                                  color: const Color(0xFFFF6B9D).withValues(alpha: 0.2),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Text(
                                  '$_groupSize ${_groupSize == 1 ? 'person' : 'people'}',
                                  style: GoogleFonts.poppins(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                    color: const Color(0xFFFF6B9D),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          IconButton(
                            onPressed: _groupSize < 20
                                ? () => setState(() => _groupSize++)
                                : null,
                            icon: const Icon(Icons.add_circle_outline),
                            color: const Color(0xFFFF6B9D),
                          ),
                        ],
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
                          const Icon(Icons.self_improvement, color: Color(0xFFFF9800), size: 20),
                          const SizedBox(width: 8),
                          Text('Chill', style: GoogleFonts.poppins(fontSize: 12, color: const Color(0xFFFF9800))),
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
                              onChanged: (value) => setState(() => _energyValue = value),
                            ),
                          ),
                          Text('Wild', style: GoogleFonts.poppins(fontSize: 12, color: const Color(0xFFFF9800))),
                          const SizedBox(width: 8),
                          const Icon(Icons.celebration, color: Color(0xFFFF9800), size: 20),
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
                          const Icon(Icons.pool, color: Color(0xFF2196F3), size: 20),
                          const SizedBox(width: 8),
                          Text('Light', style: GoogleFonts.poppins(fontSize: 12, color: const Color(0xFF2196F3))),
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
                              onChanged: (value) => setState(() => _depthValue = value),
                            ),
                          ),
                          Text('Deep', style: GoogleFonts.poppins(fontSize: 12, color: const Color(0xFF2196F3))),
                          const SizedBox(width: 8),
                          const Icon(Icons.favorite, color: Color(0xFF2196F3), size: 20),
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
                        'How flirty or intimate?',
                        style: GoogleFonts.poppins(
                          fontSize: 12,
                          color: ThemeHelper.getMutedTextColor(widget.isDarkMode),
                        ),
                      ),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          const Icon(Icons.ac_unit, color: Color(0xFFE91E63), size: 20),
                          const SizedBox(width: 8),
                          Text('Mild', style: GoogleFonts.poppins(fontSize: 12, color: const Color(0xFFE91E63))),
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
                              onChanged: (value) => setState(() => _spiceValue = value),
                            ),
                          ),
                          Text('Spicy', style: GoogleFonts.poppins(fontSize: 12, color: const Color(0xFFE91E63))),
                          const SizedBox(width: 8),
                          const Icon(Icons.local_fire_department, color: Color(0xFFE91E63), size: 20),
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
                      const SizedBox(height: 32),

                      // Optional additional prompt
                      _buildSectionTitle('Additional Instructions (Optional)'),
                      const SizedBox(height: 8),
                      Text(
                        'Add any specific requests or themes',
                        style: GoogleFonts.poppins(
                          fontSize: 12,
                          color: ThemeHelper.getMutedTextColor(widget.isDarkMode),
                        ),
                      ),
                      const SizedBox(height: 8),
                      TextField(
                        controller: _additionalPromptController,
                        maxLines: 3,
                        decoration: InputDecoration(
                          hintText: 'e.g., "Focus on career topics" or "Keep it lighthearted"',
                          filled: true,
                          fillColor: widget.isDarkMode
                              ? Colors.white.withValues(alpha: 0.1)
                              : Colors.black.withValues(alpha: 0.05),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide.none,
                          ),
                          prefixIcon: Padding(
                            padding: const EdgeInsets.only(bottom: 40),
                            child: Icon(
                              Icons.edit_note,
                              color: ThemeHelper.getMutedTextColor(widget.isDarkMode),
                            ),
                          ),
                        ),
                        style: GoogleFonts.poppins(
                          color: ThemeHelper.getTextColor(widget.isDarkMode),
                        ),
                      ),
                      const SizedBox(height: 32),
                    ],
                  ),
                ),
              ),

              // Generate button or Subscribe button
              Padding(
                padding: const EdgeInsets.all(20),
                child: ref.read(unlockProvider.notifier).canUseSpark()
                    ? Container(
                        decoration: BoxDecoration(
                          gradient: const LinearGradient(
                            colors: [Color(0xFFFF6B9D), Color(0xFFFF8FA3)],
                          ),
                          borderRadius: BorderRadius.circular(16),
                          boxShadow: [
                            BoxShadow(
                              color: const Color(0xFFFF6B9D).withValues(alpha: 0.3),
                              blurRadius: 12,
                              offset: const Offset(0, 6),
                            ),
                          ],
                        ),
                        child: ElevatedButton(
                          onPressed: _isGenerating ? null : _generateSparkQuestions,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.transparent,
                            shadowColor: Colors.transparent,
                            minimumSize: const Size(double.infinity, 56),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16),
                            ),
                          ),
                          child: _isGenerating
                              ? const CircularProgressIndicator(color: Colors.white)
                              : Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Icon(Icons.auto_awesome, color: Colors.white),
                                    const SizedBox(width: 8),
                                    Text(
                                      'Generate $_questionCount Questions',
                                      style: GoogleFonts.poppins(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                ),
                        ),
                      )
                    : Container(
                        decoration: BoxDecoration(
                          gradient: const LinearGradient(
                            colors: [Color(0xFFD4A574), Color(0xFFB8956A)],
                          ),
                          borderRadius: BorderRadius.circular(16),
                          boxShadow: [
                            BoxShadow(
                              color: const Color(0xFFD4A574).withValues(alpha: 0.3),
                              blurRadius: 12,
                              offset: const Offset(0, 6),
                            ),
                          ],
                        ),
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => SubscriptionPageNew(isDarkMode: widget.isDarkMode),
                              ),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.transparent,
                            shadowColor: Colors.transparent,
                            minimumSize: const Size(double.infinity, 56),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16),
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Icon(Icons.workspace_premium, color: Colors.white),
                              const SizedBox(width: 8),
                              Text(
                                'Subscribe to Premium',
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
                ],
              ),
            ),
          ),

          // Loading overlay (AI-style)
          if (_isGenerating)
            Container(
              decoration: ThemeHelper.getBackgroundDecoration(widget.isDarkMode),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.auto_awesome,
                      size: 64,
                      color: Color(0xFFFF6B9D),
                    ),
                    const SizedBox(height: 24),
                    const CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(Color(0xFFFF6B9D)),
                    ),
                    const SizedBox(height: 24),
                    Text(
                      'Generating Spark Questions...',
                      style: GoogleFonts.poppins(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: ThemeHelper.getTextColor(widget.isDarkMode),
                      ),
                    ),
                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }
}
