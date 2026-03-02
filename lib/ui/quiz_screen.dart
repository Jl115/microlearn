import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:microlearn/bloc/lesson/lesson_bloc.dart';
import 'package:microlearn/services/quiz_service.dart';

class QuizScreen extends StatelessWidget {
  final List<Map<String, dynamic>> quiz;
  const QuizScreen({Key? key, required this.quiz}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Quiz')),
      body: ListView.builder(
        itemCount: quiz.length,
        itemBuilder: (context, index) {
          final q = quiz[index];
          return ListTile(
            title: Text(q['question'] as String),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: (q['options'] as List<String>)
                  .map((opt) => Row(
                        children: [
                          const Icon(Icons.circle_outlined, size: 12),
                          const SizedBox(width: 8),
                          Text(opt),
                        ],
                      ))
                  .toList(),
            ),
          );
        },
      ),
    );
  }
}
