import 'package:flutter/material.dart';

import 'UI/loginPage.dart';


void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "MediHelp",
      theme: ThemeData(
          fontFamily: "Dosis"
      ),
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
    );
  }
}
