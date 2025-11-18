// lib/features/spark/presentation/pages/spark_history_screen.dart

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/utils/theme_helper.dart';
import '../../models/spark_question.dart';
import '../../services/spark_service.dart';
import 'spark_single_question_view.dart';

class SparkHistoryScreen extends ConsumerStatefulWidget {
  final bool isDarkMode;

  const SparkHistoryScreen({
    super.key,
    required this.isDarkMode,
  });

  @override
  ConsumerState<SparkHistoryScreen> createState() => _SparkHistoryScreenState();
}

class _SparkHistoryScreenState extends ConsumerState<SparkHistoryScreen> {
  final _sparkService = SparkService();
  List<SparkQuestion>? _questions;
  bool _isLoading = true;
  String? _error;

  @override
  void initState() {
    super.initState();
    _loadQuestions();
  }

  Future<void> _loadQuestions() async {
    setState(() {
      _isLoading = true;
      _error = null;
    });

    try {
      final questions = await _sparkService.getUserSparkQuestions();
      if (mounted) {
        setState(() {
          _questions = questions;
          _isLoading = false;
        });
      }
    } catch (e) {
      if (mounted) {
        setState(() {
          _error = e.toString();
          _isLoading = false;
        });
      }
    }
  }

  String _getExpirationText(SparkQuestion question) {
    if (question.expiresAt == null) {
      return 'No expiration';
    }

    final timeRemaining = question.timeRemaining;
    if (timeRemaining == null || timeRemaining.isNegative || timeRemaining == Duration.zero) {
      return 'Expired';
    } else if (timeRemaining.inHours < 1) {
      return 'Expires in ${timeRemaining.inMinutes} min';
    } else {
      return 'Expires in ${timeRemaining.inHours}h';
    }
  }

  @override
  Widget build(BuildContext context) {
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
                    Expanded(
                      child: Text(
                        'Spark History',
                        style: GoogleFonts.poppins(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: ThemeHelper.getTextColor(widget.isDarkMode),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              // Content
              Expanded(
                child: _isLoading
                    ? Center(
                        child: CircularProgressIndicator(
                          valueColor: AlwaysStoppedAnimation<Color>(
                            ThemeHelper.getGameModeGradient('spark', widget.isDarkMode)[0],
                          ),
                        ),
                      )
                    : _error != null
                        ? Center(
                            child: Padding(
                              padding: const EdgeInsets.all(24),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.error_outline,
                                    size: 64,
                                    color: Colors.red,
                                  ),
                                  const SizedBox(height: 16),
                                  Text(
                                    'Error loading questions',
                                    style: GoogleFonts.poppins(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: ThemeHelper.getTextColor(widget.isDarkMode),
                                    ),
                                  ),
                                  const SizedBox(height: 8),
                                  Text(
                                    _error!,
                                    style: GoogleFonts.poppins(
                                      fontSize: 14,
                                      color: ThemeHelper.getMutedTextColor(widget.isDarkMode),
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                  const SizedBox(height: 24),
                                  ElevatedButton(
                                    onPressed: _loadQuestions,
                                    child: Text('Retry'),
                                  ),
                                ],
                              ),
                            ),
                          )
                        : _questions == null || _questions!.isEmpty
                            ? Center(
                                child: Padding(
                                  padding: const EdgeInsets.all(24),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.auto_awesome_outlined,
                                        size: 64,
                                        color: ThemeHelper.getMutedTextColor(widget.isDarkMode),
                                      ),
                                      const SizedBox(height: 16),
                                      Text(
                                        'No Spark Questions',
                                        style: GoogleFonts.poppins(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                          color: ThemeHelper.getTextColor(widget.isDarkMode),
                                        ),
                                      ),
                                      const SizedBox(height: 8),
                                      Text(
                                        'Generate your first Spark questions to see them here',
                                        style: GoogleFonts.poppins(
                                          fontSize: 14,
                                          color: ThemeHelper.getMutedTextColor(widget.isDarkMode),
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                    ],
                                  ),
                                ),
                              )
                            : RefreshIndicator(
                                onRefresh: _loadQuestions,
                                child: ListView.builder(
                                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                                  itemCount: _questions!.length,
                                  itemBuilder: (context, index) {
                                    final question = _questions![index];
                                    final isExpired = question.isExpired;

                                    return Padding(
                                      padding: const EdgeInsets.only(bottom: 12),
                                      child: Container(
                                        decoration: BoxDecoration(
                                          gradient: LinearGradient(
                                            begin: Alignment.topLeft,
                                            end: Alignment.bottomRight,
                                            colors: isExpired
                                                ? [
                                                    Colors.grey.withValues(alpha: 0.3),
                                                    Colors.grey.withValues(alpha: 0.2),
                                                  ]
                                                : ThemeHelper.getGameModeGradient('spark', widget.isDarkMode),
                                          ),
                                          borderRadius: BorderRadius.circular(16),
                                          boxShadow: [
                                            BoxShadow(
                                              color: Colors.black.withValues(alpha: 0.1),
                                              blurRadius: 10,
                                              offset: const Offset(0, 4),
                                            ),
                                          ],
                                        ),
                                        child: Material(
                                          color: Colors.transparent,
                                          child: InkWell(
                                            onTap: isExpired
                                                ? null
                                                : () {
                                                    // Navigate to view this single question
                                                    Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                        builder: (context) => SparkSingleQuestionView(
                                                          question: question,
                                                          isDarkMode: widget.isDarkMode,
                                                        ),
                                                      ),
                                                    ).then((_) => _loadQuestions());
                                                  },
                                            borderRadius: BorderRadius.circular(16),
                                            child: Padding(
                                              padding: const EdgeInsets.all(20),
                                              child: Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  // Question text
                                                  Text(
                                                    question.question,
                                                    style: GoogleFonts.poppins(
                                                      fontSize: 16,
                                                      fontWeight: FontWeight.w600,
                                                      color: Colors.white,
                                                      height: 1.4,
                                                    ),
                                                    maxLines: 3,
                                                    overflow: TextOverflow.ellipsis,
                                                  ),
                                                  const SizedBox(height: 12),

                                                  // Bottom row: expiration + favorite status
                                                  Row(
                                                    children: [
                                                      Icon(
                                                        Icons.access_time,
                                                        size: 14,
                                                        color: Colors.white.withValues(alpha: 0.8),
                                                      ),
                                                      const SizedBox(width: 4),
                                                      Text(
                                                        _getExpirationText(question),
                                                        style: GoogleFonts.poppins(
                                                          fontSize: 12,
                                                          color: Colors.white.withValues(alpha: 0.8),
                                                        ),
                                                      ),
                                                      const Spacer(),
                                                      if (question.isFavorited)
                                                        Icon(
                                                          Icons.favorite,
                                                          size: 16,
                                                          color: Colors.white.withValues(alpha: 0.8),
                                                        ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
