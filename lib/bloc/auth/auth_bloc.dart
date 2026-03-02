import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:microlearn/data/repositories/auth_repository.dart';
import 'package:microlearn/di.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository _repo = getIt<AuthRepository>();

  AuthBloc() : super(AuthUnauthenticated()) {
    on<LoginEvent>((event, emit) async {
      final success = await _repo.login(event.email, event.password);
      if (success) {
        emit(AuthAuthenticated(event.email));
      } else {
        emit(AuthFailure('Login failed'));
      }
    });
    on<LogoutEvent>((event, emit) async {
      await _repo.logout();
      emit(AuthUnauthenticated());
    });
  }
}
