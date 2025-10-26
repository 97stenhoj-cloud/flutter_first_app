// lib/features/pandora/presentation/pages/session_stats_page.dart
// FIXED: Shows most reacted questions by category, removed 100 emoji
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../core/services/pandora_service.dart';
import '../../../../l10n/app_localizations.dart';

class SessionStatsPage extends StatefulWidget {
  final String sessionId;
  final bool isDarkMode;
  
  const SessionStatsPage({
    super.key,
    required this.sessionId,
    required this.isDarkMode,
  });

  @override
  State<SessionStatsPage> createState() => _SessionStatsPageState();
}

class _SessionStatsPageState extends State<SessionStatsPage> {
  final pandoraService = PandoraService();
  Map<String, dynamic>? stats;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadStats();
  }

  Future<void> _loadStats() async {
    try {
      final loadedStats = await pandoraService.getSessionStats(widget.sessionId);
      setState(() {
        stats = loadedStats;
        isLoading = false;
      });
    } catch (e) {
      debugPrint('Error loading stats: $e');
      setState(() {
        isLoading = false;
      });
    }
  }

  String _getParticipantName(String? participantId) {
    if (participantId == null || stats == null) return 'Unknown';
    
    final participants = stats!['participants'] as List;
    final participant = participants.firstWhere(
      (p) => p['id'] == participantId,
      orElse: () => {'display_name': 'Unknown'},
    );
    
    return participant['display_name'] as String;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: widget.isDarkMode
                ? [const Color(0xFF5A2A3A), const Color(0xFF4A1A2A)]
                : [const Color(0xFFFFE4EC), const Color(0xFFFFD4E4)],
          ),
        ),
        child: SafeArea(
          child: isLoading
              ? const Center(child: CircularProgressIndicator(color: Colors.white))
              : SingleChildScrollView(
                  padding: const EdgeInsets.all(24),
                  child: Column(
                    children: [
                      // Trophy and title
                      const Icon(
                        Icons.emoji_events,
                        size: 80,
                        color: Color(0xFFFFD700),
                      ),
                      const SizedBox(height: 16),
                      Text(
                        'Game Stats! 🎉',
                        style: GoogleFonts.poppins(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'Thanks for playing together!',
                        style: GoogleFonts.poppins(
                          fontSize: 16,
                          color: Colors.white.withValues(alpha: 0.9),
                        ),
                      ),
                      
                      const SizedBox(height: 32),
                      
                      // Stats cards
                      _buildStatCard(
                        icon: '📝',
                        title: 'Questions Asked',
                        value: '${stats?['total_questions'] ?? 0}',
                        color: const Color(0xFF4CAF50),
                      ),
                      
                      _buildStatCard(
                        icon: '👥',
                        title: 'Players',
                        value: '${stats?['total_participants'] ?? 0}',
                        color: const Color(0xFF2196F3),
                      ),
                      
                      _buildStatCard(
                        icon: '❤️',
                        title: 'Total Reactions',
                        value: '${stats?['total_reactions'] ?? 0}',
                        color: const Color(0xFFE91E63),
                      ),
                      
                      // Reaction breakdown
                      if (stats != null) ...[
                        const SizedBox(height: 16),
                        _buildReactionBreakdown(),
                      ],
                      
                      // Most reacted questions by category
                      if (stats?['most_loved_question'] != null) ...[
                        const SizedBox(height: 16),
                        _buildQuestionAwardCard(
                          icon: '❤️',
                          title: 'Most Loved Question',
                          question: stats!['most_loved_question'],
                          count: '${stats!['most_loved_count']} hearts',
                          color: const Color(0xFFE91E63),
                        ),
                      ],
                      
                      if (stats?['most_funny_question'] != null) ...[
                        const SizedBox(height: 16),
                        _buildQuestionAwardCard(
                          icon: '😂',
                          title: 'Most Fun Question',
                          question: stats!['most_funny_question'],
                          count: '${stats!['most_funny_count']} laughs',
                          color: const Color(0xFFFFEB3B),
                        ),
                      ],
                      
                      if (stats?['most_shocking_question'] != null) ...[
                        const SizedBox(height: 16),
                        _buildQuestionAwardCard(
                          icon: '😮',
                          title: 'Most Shocking Question',
                          question: stats!['most_shocking_question'],
                          count: '${stats!['most_shocking_count']} shocks',
                          color: const Color(0xFF9C27B0),
                        ),
                      ],
                      
                      if (stats?['most_lit_question'] != null) ...[
                        const SizedBox(height: 16),
                        _buildQuestionAwardCard(
                          icon: '🔥',
                          title: 'Most Lit Question',
                          question: stats!['most_lit_question'],
                          count: '${stats!['most_lit_count']} fires',
                          color: const Color(0xFFFF5722),
                        ),
                      ],
                      
                      // Most questions by
                      if (stats?['most_questions_by_id'] != null) ...[
                        const SizedBox(height: 16),
                        _buildAwardCard(
                          icon: '🏆',
                          title: 'Most Questions Asked',
                          winner: _getParticipantName(stats!['most_questions_by_id']),
                          count: '${stats!['most_questions_count']} questions',
                          color: const Color(0xFFFF9800),
                        ),
                      ],
                      
                      // Most targeted
                      if (stats?['most_targeted_id'] != null) ...[
                        const SizedBox(height: 16),
                        _buildAwardCard(
                          icon: '🎯',
                          title: 'Hot Seat Award',
                          winner: _getParticipantName(stats!['most_targeted_id']),
                          count: '${stats!['most_targeted_count']} questions',
                          color: const Color(0xFFFF6B9D),
                        ),
                      ],
                      
                      const SizedBox(height: 32),
                      
                      // Back to menu button
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.of(context).popUntil((route) => route.isFirst);
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            foregroundColor: const Color(0xFFFF6B9D),
                            padding: const EdgeInsets.symmetric(vertical: 16),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          child: Text(
                            'Back to Menu',
                            style: GoogleFonts.poppins(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
        ),
      ),
    );
  }

  Widget _buildStatCard({
    required String icon,
    required String title,
    required String value,
    required Color color,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.1),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              color: color.withValues(alpha: 0.2),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Center(
              child: Text(
                icon,
                style: const TextStyle(fontSize: 32),
              ),
            ),
          ),
          const SizedBox(width: 20),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    color: Colors.grey[600],
                  ),
                ),
                Text(
                  value,
                  style: GoogleFonts.poppins(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: color,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildReactionBreakdown() {
    final l10n = AppLocalizations.of(context)!;
    final reactionCounts = stats!['reaction_counts'] as Map<String, dynamic>;
    // REMOVED 'hundred' emoji
    final reactions = [
      {'emoji': '😂', 'type': 'laugh', 'label': 'Laugh'},
      {'emoji': '😮', 'type': 'shock', 'label': 'Shock'},
      {'emoji': '❤️', 'type': 'heart', 'label': 'Heart'},
      {'emoji': '🔥', 'type': 'fire', 'label': 'Fire'},
    ];
    
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.1),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            l10n.reactionBreakdown,
            style: GoogleFonts.poppins(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.grey[800],
            ),
          ),
          const SizedBox(height: 16),
          ...reactions.map((reaction) {
            final type = reaction['type'] as String;
            final count = reactionCounts[type] ?? 0;
            
            return Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: Row(
                children: [
                  Text(
                    reaction['emoji'] as String,
                    style: const TextStyle(fontSize: 28),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      reaction['label'] as String,
                      style: GoogleFonts.poppins(
                        fontSize: 16,
                        color: Colors.grey[700],
                      ),
                    ),
                  ),
                  Text(
                    '$count',
                    style: GoogleFonts.poppins(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: const Color(0xFFFF6B9D),
                    ),
                  ),
                ],
              ),
            );
          }),
        ],
      ),
    );
  }

  Widget _buildAwardCard({
    required String icon,
    required String title,
    required String winner,
    required String count,
    required Color color,
  }) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.15),
            blurRadius: 15,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        children: [
          Text(
            icon,
            style: const TextStyle(fontSize: 48),
          ),
          const SizedBox(height: 12),
          Text(
            title,
            style: GoogleFonts.poppins(
              fontSize: 16,
              color: Colors.grey[600],
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 8),
          Text(
            winner,
            style: GoogleFonts.poppins(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: color,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 4),
          Text(
            count,
            style: GoogleFonts.poppins(
              fontSize: 14,
              color: Colors.grey[500],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildQuestionAwardCard({
    required String icon,
    required String title,
    required String question,
    required String count,
    required Color color,
  }) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.15),
            blurRadius: 15,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        children: [
          Text(
            icon,
            style: const TextStyle(fontSize: 48),
          ),
          const SizedBox(height: 12),
          Text(
            title,
            style: GoogleFonts.poppins(
              fontSize: 16,
              color: Colors.grey[600],
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 12),
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: color.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Text(
              question,
              style: GoogleFonts.poppins(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Colors.grey[800],
              ),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            count,
            style: GoogleFonts.poppins(
              fontSize: 14,
              color: color,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}