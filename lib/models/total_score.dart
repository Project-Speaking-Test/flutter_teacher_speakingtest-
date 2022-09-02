import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class TotalScore {
  int id_test;
  int totalScore;

  TotalScore({required this.id_test, required this.totalScore});

  factory TotalScore.fromJson (Map<String, dynamic> json){
    return TotalScore(
      id_test: json['id_test'],
      totalScore: json['total_score']
    );
  }
}

Future<List<TotalScore>> getTotalScore (int id_test) async {
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

  Uri url = Uri.parse("https://unudspeakingtest.com/test.php?api=total_score");
  var header = {
    'token' : sharedPreferences.getString('token').toString()
  };

  final respons = await http.get(url, headers: header);
  var jsonRespData = jsonDecode(respons.body);
  print(jsonRespData);
  List <dynamic> listscore = (jsonRespData as Map<String, dynamic>)['data'];
  List<TotalScore> totalScore = [];

  for (int i = 0 ; i < listscore.length; i++){
    totalScore.add(TotalScore.fromJson(listscore[i]));
  }

  if (jsonRespData['status']==1){
    return totalScore;
  }else{
    throw Exception(jsonRespData['message']);
  }
}