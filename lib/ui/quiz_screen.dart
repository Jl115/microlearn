import 'package:flutter/material.dart';

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
          return Card(
            margin: const EdgeInsets.all(8.0),
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(q['question'], style: const TextStyle(fontWeight: FontWeight.bold)),
                  const SizedBox(height: 8),
                  ...List<Widget>.fromList(q['options'].map<Widget>((opt) => RadioListTile(
                        title: Text(opt),
                        value: opt,
                        groupValue: null,
                        onChanged: (_) {},
                      ))),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
