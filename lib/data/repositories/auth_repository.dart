import 'package:microlearn/services/auth_service.dart';

class AuthRepository {
  final AuthService _service = AuthService();

  Future<bool> login(String email, String password) async {
    try {
      await _service.signIn(email, password);
      return true;
    } catch (_) {
      return false;
    }
  }

  Future<void> logout() async {
    await _service.signOut();
  }
}
