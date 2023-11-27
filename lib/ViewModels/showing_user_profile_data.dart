import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:comsatsconnect/models/user_model.dart';

// getting user data from firestore
Future<UserModel> fetchUserDataFromFirestore(String userId) async {
  final userId = FirebaseFirestore.instance.collection('users').doc().id;
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  final DocumentSnapshot userSnapshot =
      await firestore.collection('users').doc(userId).get();

  if (userSnapshot.exists) {
    final Map<String, dynamic> userData =
        userSnapshot.data() as Map<String, dynamic>;
    return UserModel(
      username: userData['username'],
      name: userData['fullName'],
      id: userData['id'],
      email: userData['email'],
      password: userData['password'],
      profileImageUrl: userData['profileImageUrl'],
      bio: userData['bio'],
      followers: userData['followers'],
      followings: userData['followings'],
      posts: userData['posts'],
    );
  } else {
    // Handle the case when the user doesn't exist in Firestore
    throw Exception('User not found in Firestore');
  }
}
