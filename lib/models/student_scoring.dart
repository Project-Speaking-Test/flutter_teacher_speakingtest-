import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class Student {
  int? id_test;
  DateTime? dateTime;
  int? id_student;
  String? student_name;

  Student ({this.id_test, this.dateTime, this.id_student, this.student_name});
  factory Student.fromJson(Map <String, dynamic> json) {
    return Student(
      id_test: json['id_test'], dateTime: json['dateTime'], id_student: json['id_student'], student_name: json['student_name']
    );
  }
}

Future<List<Student>> getStudent(String date) async {
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  print('Token Local : ${sharedPreferences.getString('token').toString()}');
  Uri url = Uri.parse('https://unudspeakingtest.com/test.php?api=read_test&date=$date');
  var header = {
    'token' : sharedPreferences.getString('token').toString()
  };
  final response = await http.get(url, headers: header);
  var jsonData = json.decode(response.body);

  List <dynamic> liststudent = (jsonData as Map<String, dynamic>)['data'];
  List<Student> student = [];

  for (int i = 0 ; i < liststudent.length; i++){
    student.add(Student.fromJson(liststudent[i]));
  }
  return student;
}