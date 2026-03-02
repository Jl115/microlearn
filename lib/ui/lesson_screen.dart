import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:microlearn/bloc/lesson/lesson_bloc.dart';

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
              onPressed: () {
                // Mark as completed and go back to Home
                context.read<LessonBloc>().add(CompleteLessonEvent(lesson['id']));
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
