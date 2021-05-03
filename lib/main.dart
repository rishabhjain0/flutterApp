import 'package:designings/language_screen.dart';
import 'package:designings/logo_screen.dart';
import 'package:designings/signin_screen.dart';

import './signup_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
          body: LogoScreen(navigationRoute: '/signupRoute'),
      ),
      initialRoute: '/',
      routes: {
        '/signin':(context)=>SigninScreen(),
        '/signupRoute': (context)=>SignupForm(),
        '/languageScreen':(context)=>LanguageScreen(),
      },
    );
  }
}
