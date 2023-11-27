import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:comsatsconnect/screens/Home/home_pages/main_home_feed.dart';
import 'package:comsatsconnect/widegts/button_elevatedbutton.dart';
import 'package:comsatsconnect/widegts/button_testformfield.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class UsernameEnter extends StatefulWidget {
  const UsernameEnter({super.key});

  @override
  State<UsernameEnter> createState() => _UsernameEnterState();
}

class _UsernameEnterState extends State<UsernameEnter> {
  final TextEditingController _usernameController = TextEditingController();

  Future<void> storeUsername(String username) async {
    final User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      final uid = user.uid;
      final userRef = FirebaseFirestore.instance.collection('users').doc(uid);

      try {
        await userRef.set({'username': username}, SetOptions(merge: true));
      } catch (e) {
        print('Error storing username: $e');
        // Handle the error
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            const SizedBox(height: 70.0),
            Text(
              "Comsats Connect",
              style: GoogleFonts.pacifico(
                fontSize: 35.0,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 5.0),
            const Text(
              "Create Username to continue",
              style: TextStyle(
                fontSize: 20.0,
                color: Colors.black54,
              ),
            ),
            const SizedBox(height: 40.0),
            ButtonTextFormField(
              controller: _usernameController,
              obscureText: false,
              labelText: "Create Username",
            ),
            const SizedBox(height: 10.0),
            Text(
              "Choose username wisely. You can't change it later.",
              style: TextStyle(
                color: Colors.black54,
              ),
            ),
            const SizedBox(height: 23.0),
            ButtonElevated(
              text: "Continue",
              onPressed: () {
                final String username = _usernameController.text.trim();
                if (username.isNotEmpty) {
                  // add username to firestore
                  storeUsername(username);
                  // navigate to home screen
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const MainHomeFeed(),
                    ),
                  );
                } else if (username.isEmpty) {
                  // show snackbar
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10.0),
                        ),
                      ),
                      behavior: SnackBarBehavior.floating,
                      content: Text('Please enter a username'),
                    ),
                  );
                } else {
                  // show snackbar
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10.0),
                        ),
                      ),
                      behavior: SnackBarBehavior.floating,
                      content:
                          Text('Problem from our side. Please try again later'),
                    ),
                  );
                }
              },
            ),
          ],
        ),
      )),
    );
  }
}
