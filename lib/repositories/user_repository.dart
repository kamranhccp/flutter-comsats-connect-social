import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/user_model.dart';

class UserRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Create a user profile in Firestore
  Future<void> createUserProfile(UserModel user) async {
    await _firestore.collection('users').doc(user.id).set({
      'id': user.id,
      'name': user.name,
      'email': user.email,
      'createdAt': user.createdAt,
      'username': user.username,
      'bio': user.bio,
      'profileImageUrl': user.profileImageUrl,
      'followers': user.followers,
      'followings': user.followings,
      'posts': user.posts,
      'isFounder': user.isFounder,
      'isVerified': user.isVerified,
    });
  }

  // Update a user profile in Firestore
  Future<void> updateUserProfile(UserModel user) async {
    await _firestore.collection('users').doc(user.id).update({
      'id': user.id,
      'name': user.name,
      'email': user.email,
      'bio': user.bio,
    });
  }

  // Retrieve user data from Firestore
  Future<UserModel?> getUserProfile(String userId) async {
    try {
      final DocumentSnapshot documentSnapshot = await _firestore
          .collection('users')
          .doc(userId)
          .get(GetOptions(source: Source.serverAndCache));
      if (documentSnapshot.exists) {
        return UserModel.fromJson(
            documentSnapshot.data() as Map<String, dynamic>);
      } else {
        return null;
      }
    } catch (e) {
      print('Error retrieving user profile: $e');
      return null;
    }
  }
}
