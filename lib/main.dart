import 'package:flutter/material.dart';

import 'interfaces/scoringItem_interface.dart';
import 'interfaces/loginPage_interface.dart';
import 'interfaces/questionItem_interface.dart';
import 'interfaces/registerPage_interface.dart';
import 'interfaces/homePage_interface.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/loginpage',
      routes: {
        LoginPage.nameRoute : (context) => const LoginPage(),
        RegisterPage.nameRoute : (context) => const RegisterPage(),
        HomePage.nameRoute : (context) => HomePage(),
        ScoringItemPage.nameRoute : (context) => const ScoringItemPage(),
        QuestionItemPage.nameRoute : (context) => QuestionItemPage()
      },
      home: LoginPage()
    );
  }
}