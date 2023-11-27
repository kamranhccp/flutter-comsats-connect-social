import 'package:comsatsconnect/ViewModels/user_signup_view_model.dart';
import 'package:comsatsconnect/screens/registration/sign_in.dart';
import 'package:comsatsconnect/screens/registration/username_reg_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../widegts/button_elevatedbutton.dart';
import '../../widegts/button_testformfield.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  final SignUpViewModel _signUpViewModel = SignUpViewModel();

  void _signUp() async {
    final String? name = _nameController.text.trim();
    final String? email = _emailController.text.trim();
    final String? password = _passwordController.text.trim();
    final String? confirmPassword = _confirmPasswordController.text.trim();

    if (name != null &&
        email != null &&
        password != null &&
        confirmPassword != null) {
      if (password == confirmPassword) {
        final User? user = await _signUpViewModel.signUp(name, email, password);
        if (user != null) {
          // Navigate to the home screen
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => const UsernameEnter(),
              ));
        }
      } else if (password != confirmPassword) {
        // Show snackbar if passwords do not match
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(10.0),
              ),
            ),
            behavior: SnackBarBehavior.floating,
            content: Text('Passwords do not match'),
          ),
        );
      }
    } else if (name == null ||
        email == null ||
        password == null ||
        confirmPassword == null) {
      // Show snackbar if any of the fields are empty
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(10.0),
            ),
          ),
          behavior: SnackBarBehavior.floating,
          content: Text('Please fill all fields'),
        ),
      );
    } else {
      // Show snackbar if any other error occurred
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(10.0),
            ),
          ),
          behavior: SnackBarBehavior.floating,
          content: Text('Problem from our side. Please try again later'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(25.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
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
                    "Sign up to continue",
                    style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.black54,
                    ),
                  ),
                  const SizedBox(height: 40.0),
                  ButtonTextFormField(
                    controller: _nameController,
                    obscureText: false,
                    labelText: "Name",
                  ),
                  const SizedBox(height: 13.0),
                  ButtonTextFormField(
                    controller: _emailController,
                    obscureText: false,
                    labelText: "Email",
                  ),
                  const SizedBox(height: 13.0),
                  ButtonTextFormField(
                    controller: _passwordController,
                    obscureText: true,
                    labelText: "Password",
                    suffixIcon: Icons.visibility_off,
                  ),
                  const SizedBox(height: 13.0),
                  ButtonTextFormField(
                    controller: _confirmPasswordController,
                    obscureText: true,
                    labelText: "Confirm Password",
                    suffixIcon: Icons.visibility_off,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      const Text(
                        "By signing up you agree to our",
                        style: TextStyle(
                          fontSize: 14.0,
                          color: Colors.black54,
                        ),
                      ),
                      TextButton(
                        onPressed: () {},
                        child: const Text(
                          "Terms and Conditions",
                          style: TextStyle(
                            fontSize: 14.0,
                            color: Colors.black,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                      ),
                    ],
                  ),

                  // Sign-in Button
                  const SizedBox(height: 20.0),
                  ButtonElevated(
                    onPressed: _signUp,
                    text: "SIGN UP",
                  ),
                  // Sign-up Button
                  const SizedBox(height: 20.0),
                  // or with divider
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        height: 0.5,
                        width: 140,
                        color: Colors.black54,
                      ),
                      const SizedBox(width: 10.0),
                      const Text(
                        "OR",
                        style: TextStyle(
                          color: Colors.black54,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(width: 10.0),
                      Container(
                        height: 0.5,
                        width: 140.0,
                        color: Colors.black54,
                      ),
                      // SIgn in with Google
                    ],
                  ),
                  const SizedBox(height: 20.0),
                  ButtonElevated(
                    onPressed: () {},
                    text: "CONTINUE WITH GOOGLE",
                  ),
                  // Sign-up Button
                  const SizedBox(height: 20.0),
                ],
              ),
            ),
            const SizedBox(
              height: 15.0,
            ),
            // Agree to terms and conditions
            Container(
              decoration: const BoxDecoration(
                color: Colors.black12,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30.0),
                  topRight: Radius.circular(30.0),
                ),
              ),
              height: 50,
              width: double.infinity,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Text(
                    "Already have an account?",
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const SignIn(),
                        ),
                      );
                    },
                    child: const Text(
                      "Sign in",
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
