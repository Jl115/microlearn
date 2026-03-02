import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:microlearn/data/repositories/lesson_repository.dart';
import 'package:microlearn/di.dart';

part 'lesson_event.dart';
part 'lesson_state.dart';

class LessonBloc extends Bloc<LessonEvent, LessonState> {
  final LessonRepository _repo = getIt<LessonRepository>();

  LessonBloc() : super(LessonInitial()) {
    on<LoadLessonsEvent>((event, emit) async {
      emit(LessonLoading());
      try {
        final lessons = await _repo.fetchTodayLessons();
        emit(LessonLoaded(lessons));
      } catch (e) {
        emit(LessonError(e.toString()));
      }
    });
    on<CompleteLessonEvent>((event, emit) async {
      await _repo.markCompleted(event.lessonId);
      add(LoadLessonsEvent());
    });
  }
}
