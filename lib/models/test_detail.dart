import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class Test {
  String? answer;

  Test ({this.answer});

  factory Test.fromJson(List<dynamic> json){
    return Test(
      answer: json[0]['answer']
    );
  }
}
Future <Test> getAnswer(int id) async {
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  Uri url = Uri.parse('https://unudspeakingtest.com/test.php?api=test_detail&id_test=$id');
  var header = {
    'token' : sharedPreferences.getString('token').toString(),
  };
  final response = await http.get(url, headers: header);
  var jsonData = jsonDecode(response.body);
  if (jsonData['status'] == 1){
    print(jsonData);
    return Test.fromJson(jsonData['data']);
  } else {
    throw Exception(jsonData['message']);
  }
}