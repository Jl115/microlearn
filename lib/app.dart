import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'di.dart';
import 'ui/home_screen.dart';
import 'ui/lesson_screen.dart';
import 'ui/quiz_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupDependencies();
  runApp(const SkillSnapApp());
}

class SkillSnapApp extends StatelessWidget {
  const SkillSnapApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SkillSnap',
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      initialRoute: '/',
      routes: {
        '/': (context) => const HomeScreen(),
        '/lesson': (context) => const LessonScreen(),
        '/quiz': (context) => const QuizScreen(),
      },
    );
  }
}
