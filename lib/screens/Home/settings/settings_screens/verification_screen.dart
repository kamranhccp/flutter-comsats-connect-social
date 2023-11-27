import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:comsatsconnect/widegts/button_elevatedbutton.dart';
import 'package:comsatsconnect/widegts/button_testformfield.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Verification extends StatefulWidget {
  const Verification({super.key});

  @override
  State<Verification> createState() => _VerificationState();
}

class _VerificationState extends State<Verification> {
  TextEditingController _emailController = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> sendVerificationEmail(String email) async {
    try {
      // 1. update the email in firestore
      await FirebaseFirestore.instance
          .collection('users')
          .doc(_auth.currentUser!.uid)
          .update({'email': email});

      // 2. update the email in firebase auth
      await _auth.currentUser!.updateEmail(email);

      // 3. Send the verification email
      await _auth.currentUser!.sendEmailVerification();

      // 4. Show a snackbar to inform the user
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          behavior: SnackBarBehavior.floating,
          content: Text('Verification email sent. Please verify your email.'),
        ),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          behavior: SnackBarBehavior.floating,
          content: Text('Error sending verification email: $e'),
        ),
      );
    }
  }

  Future<void> createFirestoreIsVerified() async {
    try {
      // 5. create a document in firestore in user collection with isVerified = true in 'verification' sub-collection
      await FirebaseFirestore.instance
          .collection('users')
          .doc(_auth.currentUser!.uid)
          .collection('verification')
          .doc('isVerified')
          .set({'isVerified': false});
    } catch (e) {
      print('Error updating Firestore: $e');
    }
  }

  Future<void> updateFirestoreIsVerified() async {
    try {
      // 6. update a document in firestore in user collection with isVerified = true
      // in 'verification' sub-collection if email is verified
      if (_auth.currentUser!.emailVerified) {
        await FirebaseFirestore.instance
            .collection('users')
            .doc(_auth.currentUser!.uid)
            .collection('verification')
            .doc('isVerified')
            .update({'isVerified': true});

        await FirebaseFirestore.instance
            .collection('users')
            .doc(_auth.currentUser!.uid)
            .update({'isVerified': true});
        // check isVerified is true or false in firestore and store it in a variable
        // if true then show a snackbar that you are verified
        // else show a snackbar that you are not verified

        final bool isVerified = await FirebaseFirestore.instance
            .collection('users')
            .doc(_auth.currentUser!.uid)
            .collection('verification')
            .doc('isVerified')
            .get()
            .then((value) => value.data()!['isVerified']);

        if (isVerified) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: Colors.green,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(12)),
              ),
              behavior: SnackBarBehavior.floating,
              content: Text(
                'Great! You are already a verified user.',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                ),
              ),
            ),
          );
        }
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            behavior: SnackBarBehavior.floating,
            content: Text('Please verify your email first.'),
          ),
        );
      }
    } catch (e) {
      print('Error updating Firestore: $e');
    }
  }

  bool isEmailValid(String email) {
    return RegExp(
            r'^[A-Z]{2}\d{2}-[A-Z]{3}-\d{3}@ISBSTUDENT\.COMSATS\.EDU\.PK$',
            caseSensitive: false)
        .hasMatch(email);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Verification'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              // Some text for User Information like
              // A Icon with Heading like "A Verified Badge"
              // A Text like "A verified badge is a check that appears next to an ISB Student's
              // name in search and on their profile. It means ISB Student has confirmed that
              // this is the authentic account for this public figure, celebrity or global brand."

              // A Icon with Heading like "Why verify my email?"
              // A Text like "Verifying your email address makes it easier for you to use the
              // features of ISB Connect, including sharing posts with your email contacts."
              Column(
                children: [
                  Row(
                    children: [
                      const Icon(Icons.verified, color: Colors.black),
                      const SizedBox(width: 10),
                      const Text(
                        "Verified Badge",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          letterSpacing: 0.6,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 3),
                  const Text(
                    "It means it has been confirmed that this is the authentic account for this public figure, celebrity or global brand.",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                      fontWeight: FontWeight.normal,
                      letterSpacing: 0.6,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 10),
              Column(
                children: [
                  Row(
                    children: [
                      const Icon(Icons.workspaces_outlined,
                          color: Colors.black),
                      const SizedBox(width: 10),
                      const Text(
                        "How it Works?",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          letterSpacing: 0.6,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 3),
                  const Text(
                    "Verifications are done automatically by the system. You just have to enter your ISB Student email and click on the button below. A verification email will be sent to your ISB Student email. Click on the link in the email to verify your email.",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                      fontWeight: FontWeight.normal,
                      letterSpacing: 0.6,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Column(
                children: [
                  Row(
                    children: [
                      const Icon(Icons.support, color: Colors.black),
                      const SizedBox(width: 10),
                      const Text(
                        "Dedicated Support",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          letterSpacing: 0.6,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 3),
                  const Text(
                    "ISB Connect provides dedicated support to help manage accounts that have a large audience in Pakistan and have a high likelihood of being impersonated.",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                      fontWeight: FontWeight.normal,
                      letterSpacing: 0.6,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 30),
              // send verification email
              // A Text like "Enter your ISB Student email to send a verification email."
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  // icon
                  const Icon(
                    Icons.email_outlined,
                    color: Colors.black,
                    size: 35,
                  ),
                  const SizedBox(width: 10),
                  const Text(
                    "Enter your ISB Student email to send a \nverification email.",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                      fontWeight: FontWeight.normal,
                      letterSpacing: 0.6,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              ButtonTextFormField(
                controller: _emailController,
                labelText: 'XX00-XXX-000@ISBSTUDENT.COMSATS.EDU.PK',
                obscureText: false,
              ),
              const SizedBox(height: 30),
              ButtonElevated(
                onPressed: () {
                  final email = _emailController.text;
                  if (isEmailValid(email)) {
                    sendVerificationEmail(email);
                    createFirestoreIsVerified();
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(12)),
                        ),
                        behavior: SnackBarBehavior.floating,
                        content: Text(
                            'Invalid email format. Use XX00-XXX-000@ISBSTUDENT.COMSATS.EDU.PK'),
                      ),
                    );
                  }
                },
                text: 'Send Verification Email',
              ),

              const SizedBox(height: 30),
              // Already sent verification email then show a button to update firestore
              // A Text like "You have already sent a verification email. Click on the button below to update your verification status."
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  // icon
                  const Icon(
                    Icons.email_outlined,
                    color: Colors.black,
                    size: 35,
                  ),
                  const SizedBox(width: 10),
                  Text(
                    "Already Verified?",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      letterSpacing: 0.6,
                    ),
                  ),
                  const Spacer(),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: Colors.black,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    onPressed: () {
                      updateFirestoreIsVerified();
                    },
                    child: const Text(
                      'UPDATE STATUS',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        letterSpacing: 0.6,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
