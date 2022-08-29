import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class ScoreItem{
  int? score;

  ScoreItem({this.score});
  factory ScoreItem.fromJson(Map <String, dynamic> json) {
    return ScoreItem(
      score: json['score']
    );
  }
}

Future<ScoreItem> postScoreItem (int id, int score) async {
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

  Uri url = Uri.parse("https://unudspeakingtest.com/test.php?api=update_score");
  var header = {
    'Content-Type': 'application/json',
    'token' : sharedPreferences.getString('token').toString()
  };
  var body = {
    'id_std' : id,
    'score' : score
  };
  final respons = await http.patch(url, headers: header, body: body);
  var jsonRespData = jsonDecode(respons.body);
  print(jsonRespData);

  if (jsonRespData['status']==1){
    return ScoreItem.fromJson(jsonRespData);
  }else{
    throw Exception(jsonRespData['message']);
  }
}
