import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

Future<User> createUser (String name, String email, String password) async {

  Uri url = Uri.parse("https://unudspeakingtest.com/teacher.php?api=signup");
  var body = {'name': name, 'email': email, 'password': password};
  var header = {'Content-Type': 'application/json'};
  final respons = await http.post(url, body: jsonEncode(body), headers: header);
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  var jsonRespData = jsonDecode(respons.body);

  if (jsonRespData['status']==1){
    sharedPreferences.setString('token', jsonRespData['data']['token'].toString());
    print(jsonRespData['data']['token']);
  }
  // else{
  //   throw Exception('Failed to auth user');
  // }
    return User.fromJson(jsonRespData);
}

class User{
  String? name;
  String? email;
  String? password;

  User({required this.name, required this.email, required this.password});

  factory User.fromJson(Map<String,dynamic>json){
    return User(name: json['name'], email: json['email'], password: json['password']);
  }
}