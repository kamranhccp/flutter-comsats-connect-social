import 'package:firebase_auth/firebase_auth.dart';

import '../models/user_model.dart';
import '../repositories/user_repository.dart';
import '../services/authentication_services.dart';

class SignUpViewModel {
  final AuthenticationService _authenticationService = AuthenticationService();
  final UserRepository _userRepository = UserRepository();

  // Sign up a user with email and password
  Future<User?> signUp(String name, String email, String password) async {
    try {
      // Create a new user in Firebase Authentication
      final User? user = await _authenticationService
          .registerWithEmailAndPassword(email, password);

      if (user != null) {
        // Create a UserModel object to store in Firestore
        final userModel = UserModel(
          id: user.uid,
          name: name,
          email: email,
          password:
              password, // NOTE: Storing passwords like this is not recommended; it's just for demonstration.
          createdAt: DateTime.now().toLocal().toString(),
        );

        // Store the user's profile data in Firestore
        await _userRepository.createUserProfile(userModel);

        return user;
      } else {
        return null;
      }
    } catch (e) {
      print('Error signing up: $e');
      return null;
    }
  }
}
