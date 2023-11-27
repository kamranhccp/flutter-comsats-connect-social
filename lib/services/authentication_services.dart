import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthenticationService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // User registration with email and password
  Future<User?> registerWithEmailAndPassword(
      String email, String password) async {
    try {
      final UserCredential result = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      final User? user = result.user;
      return user;
    } catch (e) {
      print('Error registering user: $e');
      return null;
    }
  }

  // User login with email and password
  Future<User?> loginWithEmailAndPassword(String email, String password) async {
    try {
      final UserCredential result = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      final User? user = result.user;
      return user;
    } catch (e) {
      print('Error logging in: $e');
      return null;
    }
  }

  // Sign out the user
  Future<void> signOut() async {
    await _auth.signOut();
  }

  // for username adding to firestore for user in same collection with username
  Future<void> addUsername(String username) async {
    final User? user = _auth.currentUser;
    if (user != null) {
      final uid = user.uid;

      // reference to the user document
      final userRef = FirebaseFirestore.instance.collection('users').doc(uid);

      try {
        await userRef.set(
          {'username': username},
          SetOptions(merge: true),
        );
      } catch (e) {
        print('Error adding username: $e');
      }
    }
  }
}
