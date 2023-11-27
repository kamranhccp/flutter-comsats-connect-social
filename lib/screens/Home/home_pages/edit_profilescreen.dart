import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:comsatsconnect/widegts/button_elevatedbutton.dart';
import 'package:comsatsconnect/widegts/button_testformfield.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../../models/user_model.dart';
import '../../../repositories/user_repository.dart';

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({Key? key}) : super(key: key);

  @override
  _EditProfilePageState createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _bioController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Profile'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Profile Image
              GestureDetector(
                onTap: () {
                  // To handle the logic to change the profile image
                },
                child: Center(
                    child: Stack(
                  children: [
                    CircleAvatar(
                      radius: 60,
                      backgroundImage:
                          NetworkImage('https://i.imgur.com/zL4Krbz.jpg'),
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                          color: Colors.black,
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(
                          Icons.camera_alt,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                )),
              ),
              const SizedBox(height: 30),
              // Full Name
              ButtonTextFormField(
                controller: _nameController,
                obscureText: false,
                labelText: 'Full Name',
              ),

              const SizedBox(height: 30),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ButtonTextFormField(
                    controller: _emailController,
                    labelText: 'Email',
                    obscureText: false,
                  ),
                  const SizedBox(height: 8),
                  FirebaseAuth.instance.currentUser!.emailVerified
                      ? Row(
                          children: [
                            Icon(Icons.verified_user, color: Colors.green),
                            const SizedBox(width: 10),
                            const Text(
                              "You have a verified email address",
                              style: TextStyle(
                                color: Colors.green,
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                letterSpacing: 0.6,
                              ),
                            ),
                          ],
                        )
                      : Row(
                          children: [
                            Icon(Icons.warning, color: Colors.red),
                            const SizedBox(width: 10),
                            // show Text that email is not verified yet
                            // and a button to send verification email again
                            Row(
                              children: [
                                const Text(
                                  "Email not verified",
                                  style: TextStyle(
                                    color: Colors.red,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    letterSpacing: 0.6,
                                  ),
                                ),
                                const SizedBox(width: 35),
                                TextButton(
                                  style: TextButton.styleFrom(
                                    backgroundColor: Colors.blue
                                        .withOpacity(0.2), // background

                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(30),
                                    ),
                                  ),
                                  onPressed: () {
                                    final sendVerification = FirebaseAuth
                                        .instance.currentUser!
                                        .sendEmailVerification();
                                    // show a snackbar to tell user to check email
                                    sendVerification.then(
                                      (value) => ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        const SnackBar(
                                          behavior: SnackBarBehavior.floating,
                                          content: Text(
                                              "Verification email sent. Please check your email."),
                                        ),
                                      ),
                                    );
                                  },
                                  child: Text(
                                    "Send Verification Email",
                                    style: TextStyle(
                                      color: Colors.blue.shade800,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                      letterSpacing: 0.6,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        )
                ],
              ),

              const SizedBox(height: 30),
              // Bio
              TextFormField(
                controller: _bioController,
                decoration: InputDecoration(
                  enabled: true,
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: Colors.black26,
                    ),
                    borderRadius: BorderRadius.all(
                      Radius.circular(30),
                    ),
                  ),
                  border: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: Colors.black26,
                    ),
                    borderRadius: BorderRadius.all(
                      Radius.circular(30),
                    ),
                  ),
                  labelText: 'Bio',
                  labelStyle: const TextStyle(
                    color: Colors.black38,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                maxLines: 3,
                maxLength: 120,
              ),

              // Save Changes Button
              const SizedBox(height: 20),
              ButtonElevated(
                onPressed: () async {
                  String name = _nameController.text;
                  String email = _emailController.text;
                  String bio = _bioController.text;

                  final userData = await FirebaseFirestore.instance
                      .collection('users')
                      .doc(FirebaseAuth.instance.currentUser!.uid)
                      .get();
                  if (name.isEmpty) {
                    name = userData.data()!['name'];
                  } else {
                    name = _nameController.text;
                  }
                  if (email.isEmpty) {
                    email = userData.data()!['email'];
                  } else {
                    email = _emailController.text;
                  }
                  if (bio.isEmpty) {
                    bio = userData.data()!['bio'];
                  } else {
                    bio = _bioController.text;
                  }
                  UserModel user = UserModel(
                    id: FirebaseAuth.instance.currentUser!.uid,
                    name: name,
                    email: email,
                    password: '',
                    bio: bio,
                  );
                  UserRepository().updateUserProfile(user);
                  // Navigate back to the previous screen
                  Navigator.pop(context);
                },
                text: 'Save Changes',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
