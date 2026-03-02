class LessonService {
  // Mock data for now – you can replace with Firestore later
  Future<List<Map<String, dynamic>>> getMockLessons() async {
    return [
      {'id': '1', 'title': 'Intro to Dart', 'content': 'Learn basics of Dart language.'},
      {'id': '2', 'title': 'Flutter Widgets', 'content': 'Explore core Flutter widgets.'},
      {'id': '3', 'title': 'State Management', 'content': 'Understanding Bloc & GetIt.'},
    ];
  }

  Future<void> markAsCompleted(String lessonId) async {
    // No-op for mock – in a real app you would update Firestore or a local DB.
  }
}
