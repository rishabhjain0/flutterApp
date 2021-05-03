import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

class LogoScreen extends StatefulWidget {
  final bool isProgrssBar;
  final navigationRoute;

  LogoScreen({this.isProgrssBar = false, @required this.navigationRoute});

  @override
  _LogoScreenState createState() => _LogoScreenState();
}

class _LogoScreenState extends State<LogoScreen> {
  var route;

  void showLogoImages() async {
    await Future.delayed(const Duration(milliseconds: 5000));
    Navigator.of(context).pushReplacementNamed(this.widget.navigationRoute);
  }

  @override
  void initState() {
    if (!this.widget.isProgrssBar) {
      showLogoImages();
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.88,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      Stack(
                        alignment: Alignment.center,
                        children: [
                          Image.asset('assets/images/up.png'),
                          Image.asset('assets/images/logo.gif'),
                        ],
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Stack(
                        alignment: Alignment.center,
                        children: [
                          Image.asset('assets/images/down.png'),
                          Image.asset('assets/images/downInside.png'),
                        ],
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Benvenuto ',
                        style: TextStyle(
                            fontSize: 24,
                            color: Color.fromRGBO(39, 190, 46, 1)),
                      ),
                      Text(
                        ' in',
                        style: TextStyle(fontSize: 24),
                      ),
                    ],
                  ),
                  Text(
                    'Quiz Patente Per Tutti',
                    style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'AM - A/B - C/D - CQC',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                  ),
                ],
              ),
            ),
            Divider(
              height: 20,
              color: Colors.black,
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.07,
              decoration: BoxDecoration(),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Powered by ',
                    style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'APNA PATENTE',
                    style: TextStyle(
                      fontSize: 15,
                      color: Color.fromRGBO(39, 190, 46, 1),
                      fontWeight: FontWeight.bold
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
