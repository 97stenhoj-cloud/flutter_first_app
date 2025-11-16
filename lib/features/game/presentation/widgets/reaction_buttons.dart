import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ReactionButtons extends StatelessWidget {
  final Map<String, int> currentReactions;
  final String? mySelectedReaction;
  final Function(String) onReactionTap;

  const ReactionButtons({
    super.key,
    required this.currentReactions,
    required this.mySelectedReaction,
    required this.onReactionTap,
  });

  @override
  Widget build(BuildContext context) {
    final reactions = [
      {'emoji': '😂', 'type': 'laugh'},
      {'emoji': '😮', 'type': 'shock'},
      {'emoji': '❤️', 'type': 'heart'},
      {'emoji': '🔥', 'type': 'fire'},
    ];

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: reactions.map((reaction) {
          final type = reaction['type'] as String;
          final emoji = reaction['emoji'] as String;
          final count = currentReactions[type] ?? 0;
          final isSelected = mySelectedReaction == type;

          return GestureDetector(
            onTap: () => onReactionTap(type),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              decoration: BoxDecoration(
                color: isSelected
                    ? const Color(0xFFFF6B9D).withValues(alpha: 0.3)
                    : Colors.white.withValues(alpha: 0.9),
                borderRadius: BorderRadius.circular(20),
                border: isSelected
                    ? Border.all(
                        color: const Color(0xFFFF6B9D),
                        width: 2,
                      )
                    : null,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.1),
                    blurRadius: 4,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    emoji,
                    style: TextStyle(
                      fontSize: isSelected ? 32 : 28,
                    ),
                  ),
                  if (count > 0) ...[
                    const SizedBox(height: 4),
                    Text(
                      '$count',
                      style: GoogleFonts.poppins(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: const Color(0xFFFF6B9D),
                      ),
                    ),
                  ],
                ],
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
