import 'package:firebase_auth/firebase_auth.dart';

bool isUserLoggedIn() {
  final user = FirebaseAuth.instance.currentUser;
  return user != null;
}
