import 'package:flutter/material.dart';
import '../../../core/theme/app_theme.dart';
import '../../models/mood.dart';
class MoodHistoryList extends StatelessWidget {
  final List<Mood> moods;

  const MoodHistoryList({super.key, required this.moods});

  Color _getMoodColor(MoodType type) {
    switch (type) {
      case MoodType.happy:
        return AppColors.happy;
      case MoodType.sad:
        return AppColors.sad;
      case MoodType.angry:
        return AppColors.angry;
    }
  }

  @override
  Widget build(BuildContext context) {
    if (moods.isEmpty) {
      return Container(
        height: 120,
        alignment: Alignment.center,
        child: Text(
          'No mood history yet',
          style: Theme.of(context).textTheme.bodyMedium,
        ),
      );
    }

    return SizedBox(
      height: 120,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        itemCount: moods.length,
        itemBuilder: (context, index) {
          final mood = moods[index];
          return Padding(
            padding: const EdgeInsets.only(right: 12),
            child: _MoodHistoryItem(
              mood: mood,
              color: _getMoodColor(mood.type),
            ),
          );
        },
      ),
    );
  }
}

class _MoodHistoryItem extends StatelessWidget {
  final Mood mood;
  final Color color;

  const _MoodHistoryItem({
    required this.mood,
    required this.color,
  });

  String _formatDate(DateTime date) {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final moodDate = DateTime(date.year, date.month, date.day);

    if (moodDate == today) {
      return 'Today';
    } else if (moodDate == today.subtract(const Duration(days: 1))) {
      return 'Yesterday';
    } else {
      return '${date.day}/${date.month}';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            color.withValues(alpha: 0.8),
            color.withValues(alpha: 0.4),
          ],
        ),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: color,
          width: 2,
        ),
        boxShadow: [
          BoxShadow(
            color: color.withValues(alpha: 0.4),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            mood.emoji,
            style: const TextStyle(fontSize: 32),
          ),
          const SizedBox(height: 8),
          Text(
            _formatDate(mood.date),
            style: const TextStyle(
              color: AppColors.textPrimary,
              fontSize: 12,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
