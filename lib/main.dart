import 'package:designings/language_screen.dart';
import 'package:designings/logo_screen.dart';
import 'package:designings/providers/auth.dart';
import 'package:designings/signin_screen.dart';
import 'package:provider/provider.dart';

import './signup_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => Auth(),
        ),
      ],
      child: Consumer<Auth>(
        builder: (context, authData, child) => MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          routes: {
            '/': (context) => authData.isAuth
                ? LogoScreen(navigationRoute: LanguageScreen.route)
                : FutureBuilder(
                    future: authData.tryAutoLogin(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.done) {
                        print(snapshot.data);
                        if (snapshot.data == true) {
                          return LogoScreen(
                              navigationRoute: LanguageScreen.route);
                        } else {
                          return LogoScreen(navigationRoute: SignupForm.route);
                        }
                      }
                      print("object");
                      return LogoScreen(navigationRoute: SignupForm.route);
                    }),
            SigninScreen.route: (context) => SigninScreen(),
            SignupForm.route: (context) => SignupForm(),
            LanguageScreen.route: (context) => LanguageScreen(),
          },
        ),
      ),
    );
  }
}
