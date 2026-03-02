import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

class LessonService {
  // Mock data for now – you can replace with Firestore later
  Future<List<Map<String, dynamic>>> getMockLessons() async {
    return [
      {'id': '1', 'title': 'Intro to Dart', 'content': 'Learn basics of Dart language.'},
      {'id': '2', 'title': 'Flutter Widgets', 'content': 'Explore core Flutter widgets.'},
      {'id': '3', 'title': 'State Management', 'content': 'Understanding Bloc & GetIt.'},
    ];
  }

  // Real Firestore fetch (optional – requires collection 'lessons')
  Future<List<Map<String, dynamic>>> getFirestoreLessons() async {
    final snapshot = await FirebaseFirestore.instance.collection('lessons').get();
    return snapshot.docs.map((doc) => {
          'id': doc.id,
          ...doc.data(),
        }).toList();
  }

  Future<void> markAsCompleted(String lessonId) async {
    // No-op for mock – in real app update Firestore or a local DB.
  }
}
