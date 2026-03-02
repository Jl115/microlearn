import 'package:cloud_firestore/cloud_firestore.dart';

class LessonService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<list<Map>> fetchTodayLessons() async {
    // Placeholder: fetch from a collection "lessons" limited to today
    final snapshot = await _db.collection('lessons').limit(5).get();
    return snapshot.docs.map((doc) => doc.data()).toList();
  }

  Future<void> markCompleted(String lessonId) async {
    await _db.collection('lessons').doc(lessonId).update({
      'completed': true,
      'completedAt': FieldValue.serverTimestamp(),
    });
  }
}
