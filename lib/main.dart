import 'package:comsatsconnect/firebase_options.dart';
import 'package:comsatsconnect/screens/Home/home_pages/main_home_feed.dart';
import 'package:comsatsconnect/screens/registration/sign_in.dart';
import 'package:comsatsconnect/services/is_user_loggedin.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final bool isLogin = isUserLoggedIn();
  MyApp({Key? key}) : super(key: key);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Comsats Connect',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: isLogin ? const MainHomeFeed() : const SignIn(),
      ),
    );
  }
}
