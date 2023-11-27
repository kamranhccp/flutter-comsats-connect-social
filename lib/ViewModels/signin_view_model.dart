import 'package:firebase_auth/firebase_auth.dart';

import '../services/authentication_services.dart';

class SigninViewModel {
  final AuthenticationService _authenticationService = AuthenticationService();

  Future<User?> signIn(String email, String password) async {
    try {
      final User? user = await _authenticationService.loginWithEmailAndPassword(
          email, password);
      return user;
    } catch (e) {
      print(e);
      return null;
    }
  }
}
