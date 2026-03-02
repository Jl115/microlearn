import 'package:microlearn/services/lesson_service.dart';

class LessonRepository {
  final LessonService _service = LessonService();

  Future<List<Map<String, dynamic>> fetchTodayLessons() async {
    // TODO: integrate with Firestore or mock data
    return await _service.getMockLessons();
  }

  Future<void> markCompleted(String lessonId) async {
    // TODO: update Firestore or local DB
    await _service.markAsCompleted(lessonId);
  }
}
