import 'package:designings/signin_screen.dart';
import 'package:flutter/material.dart';

class SignupForm extends StatelessWidget {
  Widget textStyling1(String label) {
    return Text(
      label,
      style: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget textFieldStyling1(String label) {
    return TextField(
      decoration: InputDecoration(
        contentPadding: EdgeInsets.only(left: 30),
        labelText: label,
        filled: true,
        fillColor: Color.fromRGBO(216, 239, 242, 1),
        labelStyle: TextStyle(
          color: Colors.grey,
        ),
        floatingLabelBehavior: FloatingLabelBehavior.never,
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: BorderSide(
              width: 1,
              color: Colors.grey,
            )),
      ),
    );
  }
 void gotologinPage(BuildContext ctx){
    Navigator.of(ctx).pushNamed('/signin');
 }
  @override
  Widget build(BuildContext context) {
    void navigateToLanguageScreen(ctx){
      Navigator.of(ctx).pushNamed('/languageScreen');
    }
    return SingleChildScrollView(
      child: Container(
        color: Colors.white,
        child: Column(
          children: [
            Container(
              height: (MediaQuery.of(context).size.height -
                      MediaQuery.of(context).padding.top) *
                  0.25,
              padding: EdgeInsets.only(top: 30),
              child: Image.asset('assets/images/logo.webp'),
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
              height: (MediaQuery.of(context).size.height -
                      MediaQuery.of(context).padding.top) *
                  0.78,
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    Container(
                      height: ((MediaQuery.of(context).size.height -
                                  MediaQuery.of(context).padding.top) *
                              0.78) *
                          0.85,
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'SIGN UP ACCOUNT',
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.w900,
                              ),
                            ),
                            Text(
                              'Signup your account to get started',
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.grey,
                              ),
                            ),
                            SizedBox(
                              height: 25,
                            ),
                            textStyling1('Full Name'),
                            SizedBox(
                              height: 10,
                            ),
                            textFieldStyling1('ENTER NAME'),
                            SizedBox(
                              height: 10,
                            ),
                            textStyling1('Email'),
                            SizedBox(
                              height: 10,
                            ),
                            textFieldStyling1('ENTER EMAIL'),
                            SizedBox(
                              height: 10,
                            ),
                            textStyling1('Mobile No'),
                            SizedBox(
                              height: 10,
                            ),
                            textFieldStyling1('ENTER MOBILE NO'),
                            SizedBox(
                              height: 10,
                            ),
                            textStyling1('Password'),
                            SizedBox(
                              height: 10,
                            ),
                            textFieldStyling1('ENTER PASSWORD'),
                            SizedBox(
                              height: 30,
                            ),
                            Container(
                              width: double.infinity,
                              height: 45,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                              ),
                              child: ElevatedButton(
                                child: Text(
                                  'SIGNUP',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold, fontSize: 16),
                                ),
                                style: ButtonStyle(
                                    foregroundColor:
                                        MaterialStateProperty.all(Colors.black),
                                    backgroundColor: MaterialStateProperty.all(
                                      Color.fromRGBO(247, 185, 0, 1),
                                    ),
                                    shape: MaterialStateProperty.all(
                                        RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(30.0),
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
                                child:Text("Skip Now",style: TextStyle(fontWeight: FontWeight.bold)),
                                  onPressed: ()=>navigateToLanguageScreen(context),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                          ],
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
                            "Already Have an Account?",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          TextButton(
                              onPressed: ()=>gotologinPage(context),
                              child: Text(
                                'Login Now',
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
}
