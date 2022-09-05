import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class Test {
  int? id_std;
  int? id_test;
  int? id_soal;
  String? question;
  String? answer;
  int? score;

  Test({this.id_std, this.id_test, this.id_soal, this.question, this.answer, this.score});

  factory Test.fromJson (Map<String, dynamic> json){
    return Test(
        id_test: json['id_test'],
        id_soal: json['id_soal'],
        id_std: json['id_std'],
        question: json['question'],
        answer: json['answer'],
        score: json['score']
    );
  }
}
Future <List<Test>> getAnswer(int id) async {
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  Uri url = Uri.parse('https://unudspeakingtest.com/test.php?api=test_detail&id_test=$id');
  var header = {
    'token' : sharedPreferences.getString('token').toString(),
  };
  final response = await http.get(url, headers: header);
  var jsonData = jsonDecode(response.body);
  List <dynamic> listQuestionDetail = (jsonData as Map<String, dynamic>)['data'];
  List<Test> testDetail = [];
  print(listQuestionDetail[0]);

  for (int i = 0 ; i < listQuestionDetail.length; i++){
    testDetail.add(Test.fromJson(listQuestionDetail[i]));
  }
  return testDetail;
}

Future<void> deleteTest (int id) async {
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  Uri url = Uri.parse('https://unudspeakingtest.com/test.php?api=delete');

  var header = {
    'Content-Type' : 'application/json',
    'token' : sharedPreferences.getString('token').toString()
  };
  var body = {
    'id_test' : id
  };
  final response = await http.delete(url, headers: header, body: jsonEncode(body));
  var jsonData = jsonDecode(response.body);
  if (jsonData['status'] == 1){
    print(jsonData);
  } else {
    throw Exception(jsonData['message']);
  }

}
