import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:microlearn/bloc/lesson/lesson_bloc.dart';
import 'package:microlearn/di.dart';
import 'package:microlearn/services/quiz_service.dart';
import 'quiz_screen.dart';

class LessonScreen extends StatelessWidget {
  final Map<String, dynamic> lesson;
  const LessonScreen({Key? key, required this.lesson}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(lesson['title'] ?? 'Lesson')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(lesson['content'] ?? '', style: const TextStyle(fontSize: 16)),
            const Spacer(),
            ElevatedButton(
              onPressed: () async {
                // Mark as completed
                context.read<LessonBloc>().add(CompleteLessonEvent(lesson['id']));
                // Generate quiz using rule‑based service
                final quiz = getIt<QuizService>().generateQuiz(lesson['content'] ?? '');
                // Navigate to quiz screen
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => QuizScreen(quiz: quiz)),
                );
                // Return to home after pushing quiz
                Navigator.pop(context);
              },
              child: const Text('Mark as Completed'),
            ),
          ],
        ),
      ),
    );
  }
}
