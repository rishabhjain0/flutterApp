import 'package:designings/dummy_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'providers/auth.dart';

class LanguageScreen extends StatefulWidget {
  static const route = '/languageScreen';
  @override
  _LanguageScreenState createState() => _LanguageScreenState();
}

class _LanguageScreenState extends State<LanguageScreen> {
  List countryList = [];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          backgroundColor: Color.fromRGBO(231, 233, 244, 1),
          body: Column(
            children: [
              Container(
                padding: EdgeInsets.only(left: 20),
                width: double.infinity,
                alignment: Alignment.topLeft,
                height: (MediaQuery.of(context).size.height) * 0.20,
                decoration: BoxDecoration(
                  color: Colors.white,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Select Your',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'InterFace Language',
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.green,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              Container(
                height: (MediaQuery.of(context).size.height) * 0.7,
                child: GridView(
                  padding: EdgeInsets.all(30),
                  children: languageData.map((country) {
                    return Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(18)),
                      child: Card(
                        elevation: 4,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18)),
                        child: Container(
                          padding:
                              EdgeInsets.symmetric(vertical: 15, horizontal: 3),
                          child: Column(
                            children: [
                              Container(
                                child: Image.asset(
                                  country.flag,
                                  width: 40,
                                  height: 26,
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Text(
                                country.countryName,
                                style: TextStyle(
                                    fontSize: 13, fontWeight: FontWeight.bold),
                              ),
                              Text(country.langName),
                            ],
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                  gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                    mainAxisSpacing: 20,
                    maxCrossAxisExtent: 200,
                    crossAxisSpacing: 15,
                    childAspectRatio: 1.2,
                  ),
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.1,
                color: Colors.white,
                width: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: 100, vertical: 15),
                child: ElevatedButton(
                  onPressed: () {
                    Provider.of<Auth>(context, listen: false).logout();
                    Navigator.pushNamedAndRemoveUntil(
                        context, '/', (route) => false);
                  },
                  child: Text('Continue'),
                  style: ButtonStyle(
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30)))),
                ),
              )
            ],
          )),
    );
  }
}
