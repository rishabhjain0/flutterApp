import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:country_provider/country_provider.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LanguageScreen extends StatefulWidget {
  @override
  _LanguageScreenState createState() => _LanguageScreenState();
}

class _LanguageScreenState extends State<LanguageScreen> {
  List countryList;

  Future<Void> getAllCountries() async {
    List countryLis = await CountryProvider.getAllCountries();
    setState(() {
      countryList = countryLis;
    });
  }

  @override
  void initState() {
    getAllCountries();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Color.fromRGBO(231, 233, 244, 1),
        body: countryList != null
            ? Column(
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
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
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
                      children: countryList.map((country) {
                        print(country.languages[0].name);
                        return Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20)),
                          child: Card(
                            elevation: 4,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(18)),
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                  vertical: 20, horizontal: 3),
                              child: Column(
                                children: [
                                  Container(
                                    decoration:
                                        BoxDecoration(border: Border.all()),
                                    child: SvgPicture.network(
                                      country.flag,
                                      width: 25,
                                      height: 25,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  FittedBox(
                                      child: Text(
                                    country.name,
                                    style: TextStyle(
                                        fontSize: 17,
                                        fontWeight: FontWeight.bold),
                                  )),
                                  Text(country.languages[0].name),
                                ],
                              ),
                            ),
                          ),
                        );
                      }).toList(),
                      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                        mainAxisSpacing: 15,
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
                    padding:
                        EdgeInsets.symmetric(horizontal: 100, vertical: 15),
                    child: ElevatedButton(
                      child: Text('Continue'),
                      style: ButtonStyle(
                          shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30)))),
                    ),
                  )
                ],
              )
            : Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height,
                      child: Image.asset('assets/images/progress.jpg',height: MediaQuery.of(context).size.height,),
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}
