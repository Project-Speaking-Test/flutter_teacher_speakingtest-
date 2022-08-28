import 'package:flutter/material.dart';
import 'package:flutter_teacher_speakingtest/interfaces/homePage_interface.dart';
import '../interfaces/loginPage_interface.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/question_model.dart';

class DialogLogOut extends StatelessWidget {
  SharedPreferences sharedPreferences;

  DialogLogOut({Key? key, required this.sharedPreferences}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('LOG OUT'),
      content: Text('Are you sure wanna log out ?'),
      actions: [
        TextButton(
          child: Text('Yes'),
          onPressed: () {
            sharedPreferences.clear();
            print(sharedPreferences.getString('token'));
            Navigator.of(context).pushReplacementNamed(LoginPage.nameRoute);
          },
        ),
        TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text('No'))
      ],
    );
  }
}
class DialogHapus extends StatelessWidget {
  int id;

  DialogHapus({Key? key, required this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Delete Question'),
      content: Text('Are you sure wanna delete this ?'),
      actions: [
        TextButton(
          child: Text('Yes'),
          onPressed: () {
            updateQuestion(id, '', 0);
            Navigator.of(context).pushReplacementNamed(HomePage.nameRoute);
          },
        ),
        TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text('No'))
      ],
    );
  }
}
