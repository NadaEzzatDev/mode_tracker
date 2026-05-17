import 'package:hive/hive.dart';
import '../models/mood.dart';

class MoodStorage {
  static const String _boxName = 'moods';
  late Box<Mood> _box;

  Future<void> init() async {
    _box = await Hive.openBox<Mood>(_boxName);
  }

  Future<void> saveMood(Mood mood) async {
    await _box.add(mood);
  }

  List<Mood> getAllMoods() {
    return _box.values.toList()
      ..sort((a, b) => b.date.compareTo(a.date));
  }

  Mood? getTodayMood() {
    final today = DateTime.now();
    try {
      return _box.values.firstWhere(
        (mood) =>
            mood.date.year == today.year &&
            mood.date.month == today.month &&
            mood.date.day == today.day,
      );
    } catch (e) {
      return null;
    }
  }

  Future<void> updateTodayMood(MoodType type) async {
    final today = DateTime.now();
    final existingMood = getTodayMood();

    if (existingMood != null) {
      final index = _box.values.toList().indexOf(existingMood);
      await _box.putAt(index, Mood(type: type, date: today));
    } else {
      await saveMood(Mood(type: type, date: today));
    }
  }
}
