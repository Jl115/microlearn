import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/lesson/lesson_bloc.dart';
import '../services/quiz_service.dart';
import 'quiz_screen.dart';

class LessonScreen extends StatelessWidget {
  final Map<String, dynamic> lesson;
  const LessonScreen({Key? key, required this.lesson}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final quizService = QuizService();
    final quiz = quizService.generateQuiz(lesson['content'] ?? '');
    return Scaffold(
      appBar: AppBar(title: Text(lesson['title'] ?? 'Lesson')),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(lesson['content'] ?? ''),
            ),
          ),
          ElevatedButton(
            child: const Text('Complete & Take Quiz'),
            onPressed: () {
              context.read<LessonBloc>().add(MarkLessonCompleted(lesson['id']));
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => QuizScreen(quiz: quiz),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
