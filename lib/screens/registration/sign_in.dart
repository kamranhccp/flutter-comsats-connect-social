import 'package:comsatsconnect/screens/Home/home_pages/main_home_feed.dart';
import 'package:comsatsconnect/screens/registration/sign_up.dart';
import 'package:comsatsconnect/widegts/button_testformfield.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../ViewModels/signin_view_model.dart';
import '../../widegts/button_elevatedbutton.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  bool _isLoading = false; // To manage loading state

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final SigninViewModel _signInViewModel = SigninViewModel();

  void _signIn() async {
    final String? email = _emailController.text.trim();
    final String? password = _passwordController.text.trim();

    if (email!.isNotEmpty && password!.isNotEmpty) {
      setState(() {
        _isLoading = true;
      });
      final User? user = await _signInViewModel.signIn(email, password);
      if (user != null) {
        // Navigate to the home screen
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const MainHomeFeed(),
          ),
        );
      } else {
        setState(() {
          _isLoading = false;
        });
        // Show snackbar if login fails
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(20.0),
              ),
            ),
            behavior: SnackBarBehavior.floating,
            content: Text('Login failed. Please try again.'),
          ),
        );
      }
    } else {
      // email or password is null
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(20.0),
            ),
          ),
          behavior: SnackBarBehavior.floating,
          content: Text('Please enter email and password.'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
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
                      "Sign in to continue",
                      style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.black54,
                      ),
                    ),
                    const SizedBox(height: 40.0),
                    ButtonTextFormField(
                      controller: _emailController,
                      obscureText: false,
                      labelText: "Email or username",
                    ),
                    const SizedBox(height: 13.0),
                    ButtonTextFormField(
                      controller: _passwordController,
                      obscureText: true,
                      labelText: "Password",
                      suffixIcon: Icons.visibility_off,
                    ),
                    // Forgot Password
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        TextButton(
                          onPressed: () {},
                          child: const Text(
                            "Forgot Password?",
                            style: TextStyle(
                              color: Colors.black54,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ],
                    ),
                    // Sign-in Button
                    const SizedBox(height: 10.0),

                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        fixedSize: const Size(360, 55),
                        foregroundColor: Colors.white,
                        backgroundColor: Colors.black,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        elevation: 0,
                      ),
                      onPressed: () {
                        _signIn();
                      },
                      child: _isLoading
                          ? Container(
                              width: 20,
                              height: 20,
                              child: CircularProgressIndicator(
                                backgroundColor: Colors.black,
                                color: Colors.white,
                                strokeWidth: 5.0,
                              ),
                            )
                          : const Text(
                              "SIGN IN",
                              style: TextStyle(
                                fontSize: 17,
                                wordSpacing: 4,
                                letterSpacing: 2,
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                    ),
                    // Sign-up Button
                    const SizedBox(height: 20.0),
                    // or with divider
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          height: 0.8,
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
                          height: 0.8,
                          width: 140.0,
                          color: Colors.black54,
                        ),
                        // SIgn in with Google
                      ],
                    ),
                    const SizedBox(height: 20.0),
                    ButtonElevated(
                      onPressed: () {},
                      text: "SIGN IN WITH GOOGLE",
                    ),
                    // Sign-up Button
                    const SizedBox(height: 20.0),
                  ],
                ),
              ),
              const SizedBox(
                height: 137.0,
              ),
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
                      "Don't have an account?",
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const SignUp(),
                          ),
                        );
                      },
                      child: const Text(
                        "Sign up",
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
      ),
    );
  }
}
