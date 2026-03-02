import 'package:get_it/get_it.dart';
import 'package:microlearn/data/repositories/auth_repository.dart';
import 'package:microlearn/data/repositories/lesson_repository.dart';
import 'package:microlearn/services/quiz_service.dart';

final GetIt getIt = GetIt.instance;

Future<void> setupDependencies() async {
  // Repositories
  getIt.registerLazySingleton<AuthRepository>(() => AuthRepository());
  getIt.registerLazySingleton<LessonRepository>(() => LessonRepository());

  // Services
  getIt.registerLazySingleton<QuizService>(() => QuizService());
}
