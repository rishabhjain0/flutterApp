import 'package:designings/language_screen.dart';
import 'package:designings/providers/auth.dart';
import 'package:designings/signup_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'helper/http_exception.dart';

class SigninScreen extends StatefulWidget {
  static const route = '/signin';
  @override
  _SigninScreenState createState() => _SigninScreenState();
}

class _SigninScreenState extends State<SigninScreen> {
  void navigateToLanguageScreen(ctx) {
    Navigator.pushNamed(context, LanguageScreen.route);
  }

  final GlobalKey<FormState> _formKey = GlobalKey();
  Map<String, String> _authData = {
    'email': '',
    'password': '',
  };
  var _isLoading = false;

  Future<void> _showErrorDialog(String msg) {
    return showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: Text('Error'),
              content: Text(msg),
              actions: [
                TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text('Okay'))
              ],
            ));
  }

  void _submit() async {
    if (!_formKey.currentState.validate()) {
      // Invalid!
      return;
    }
    _formKey.currentState.save();
    setState(() {
      _isLoading = true;
    });
    try {
      // Sign user up
      bool res = await Provider.of<Auth>(context, listen: false)
          .signin(_authData['email'], _authData['password']);
      print(res);
      if (res) {
        Navigator.pushReplacementNamed(context, LanguageScreen.route);
      }
    } on HttpException catch (err) {
      await _showErrorDialog(err.message);
    } catch (err) {
      const msg = "Please try again later";
      await _showErrorDialog(msg);
    }
    setState(() {
      _isLoading = false;
    });
  }

  Widget textStyling1(String label) {
    return Text(
      label,
      style: TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.normal,
      ),
    );
  }

  Widget textFieldStyling1(String label, TextInputType keyboard,
      Function validator, Function onSaved, bool hide) {
    return Container(
      height: 44,
      child: TextFormField(
        keyboardType: keyboard,
        validator: validator,
        onSaved: onSaved,
        obscureText: hide,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.only(left: 30),
          labelText: label,
          filled: true,
          fillColor: Color.fromRGBO(235, 241, 244, 1),
          labelStyle: TextStyle(color: Color.fromRGBO(159, 159, 159, 1)),
          floatingLabelBehavior: FloatingLabelBehavior.never,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(35),
            borderSide: BorderSide(
              width: 0,
              color: Colors.grey,
            ),
          ),
        ),
      ),
    );
  }

  Widget mainWidget(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        color: Colors.white,
        child: Column(
          children: [
            Container(
              height: (MediaQuery.of(context).size.height) * 0.30,
              padding: EdgeInsets.only(top: 0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/mainLog.png',
                    width: 76,
                    height: 85,
                  ),
                  Text(
                    'Quiz Patente',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Text(
                    'Per Tutti',
                    style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
                  )
                ],
              ),
            ),
            Container(
              width: double.infinity,
              padding: EdgeInsets.only(top: 30),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(50),
                      topLeft: Radius.circular(50)),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey,
                        blurRadius: 10,
                        spreadRadius: 10,
                        offset: Offset(2, 17))
                  ]),
              height: (MediaQuery.of(context).size.height) * 0.70,
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    Container(
                      height:
                          ((MediaQuery.of(context).size.height) * 0.70) * 0.85,
                      child: Form(
                        key: _formKey,
                        child: SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'LOGIN  ACCOUNT',
                                style: TextStyle(
                                  fontSize: 25,
                                  fontWeight: FontWeight.w800,
                                  letterSpacing: 0.64,
                                  color: Color.fromRGBO(29, 29, 29, 1),
                                ),
                              ),
                              Text(
                                'Login your account to get started',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Color.fromRGBO(29, 29, 29, 1),
                                ),
                              ),
                              SizedBox(
                                height: 25,
                              ),
                              textStyling1('Email'),
                              SizedBox(
                                height: 10,
                              ),
                              textFieldStyling1(
                                  'ENTER EMAIL', TextInputType.emailAddress,
                                  (value) {
                                if (value.isEmpty || !value.contains('@')) {
                                  return 'Invalid email!';
                                }
                                return null;
                              }, (value) {
                                _authData['email'] = value;
                              }, false),
                              SizedBox(
                                height: 10,
                              ),
                              textStyling1('Password'),
                              SizedBox(
                                height: 10,
                              ),
                              textFieldStyling1(
                                  'ENTER PASSWORD', TextInputType.text,
                                  (value) {
                                if (value.isEmpty || value.length < 5) {
                                  return 'Password is too short!';
                                }
                                return null;
                              }, (value) {
                                _authData['password'] = value;
                              }, true),
                              SizedBox(
                                height: 30,
                              ),
                              _isLoading
                                  ? Center(child: CircularProgressIndicator())
                                  : Container(
                                      width: double.infinity,
                                      height: 48,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(30),
                                      ),
                                      child: ElevatedButton(
                                        onPressed: _submit,
                                        child: Text(
                                          'SIGNUP',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 18),
                                        ),
                                        style: ButtonStyle(
                                            foregroundColor:
                                                MaterialStateProperty.all(
                                                    Colors.black),
                                            backgroundColor:
                                                MaterialStateProperty.all(
                                              Color.fromRGBO(252, 215, 112, 1),
                                            ),
                                            shape: MaterialStateProperty.all(
                                                RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(30.0),
                                            ))),
                                      ),
                                    ),
                              SizedBox(
                                height: 20,
                              ),
                              Container(
                                width: double.infinity,
                                alignment: Alignment.center,
                                child: TextButton(
                                  child: Text("Skip Now",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold)),
                                  onPressed: () =>
                                      navigateToLanguageScreen(context),
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Container(
                      height: ((MediaQuery.of(context).size.height -
                                  MediaQuery.of(context).padding.top) *
                              0.78) *
                          0.07,
                      width: double.infinity,
                      alignment: Alignment.center,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Don't have an account?",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          TextButton(
                              onPressed: () => gotoSignUpPage(context),
                              child: Text(
                                'Signup Now',
                                style: TextStyle(
                                    color: Colors.green,
                                    fontWeight: FontWeight.bold),
                              )),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  void gotoSignUpPage(BuildContext ctx) {
    Navigator.of(ctx).pushReplacementNamed(SignupForm.route);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: mainWidget(context),
      ),
    );
  }
}
