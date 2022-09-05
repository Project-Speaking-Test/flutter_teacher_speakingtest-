import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_teacher_speakingtest/models/score.dart';
import 'package:flutter_teacher_speakingtest/models/test_detail.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../constants/color.dart';
import '../constants/font.dart';
import 'homePage_interface.dart';

class ScoringItemPage extends StatefulWidget {
  static const nameRoute = '/scoringitempage';
  const ScoringItemPage({Key? key}) : super(key: key);

  @override
  State<ScoringItemPage> createState() => _ScoringItemPageState();
}

class _ScoringItemPageState extends State<ScoringItemPage> {

  final scoreController = TextEditingController();

  // Test audio  = Test();
  List<Test>? test;
  AudioPlayer audioPlayer = AudioPlayer();

  var _counter = 1;
  String? formatDate;
  String? formatTime;
  int? id;
  String? question;
  int? score;
  bool isLoading = true;
  int? std;

  getData ()async{
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

    formatDate =sharedPreferences.getString('formatDate');
    print(formatDate);
    formatTime =sharedPreferences.getString('formatTime');
    print(formatTime);
    id = sharedPreferences.getInt('id_test');
    test = await getAnswer(id!);
    print('dah dsni');
    // testDetail = await getTestDetail(1);
    if (test != null){
      score = test?[_counter-1].score ?? 0;
      question = test?[_counter-1].question;
      std = test?[_counter-1].id_std;
    }else{
      score =0;
      question = 'No Question';
    }
    isLoading = false;
    setState(() {

    });

    // if (id != null){
    //   testDetail = await getTestDetail(id);
    // }
    // // testDetail = await getTestDetail(1);
    //
    //
    // if (testDetail != null){
    //   setState(() {
    //     score = testDetail?[_counter-1].score;
    //     question = testDetail?[_counter-1].question;
    //   });
    // }else{
    //   score =0;
    //   question = 'No Question';
    // }
  }

  // Future <void> getData () async {
  //   audio = await getAnswer(_counter);
  //   print(audio.answer);
  // }
  @override
  void initState() {
    getData();
    setState(() {

    });
    super.initState();
  }



  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body:isLoading ? Center(child: CircularProgressIndicator(),) : Stack(
          children: [
            Container(
              padding: EdgeInsets.all(0.03 * size.height),
              decoration: BoxDecoration(gradient: gradientBackgroundColor),
              child: Center(
                child: Column(
                  children: [
                    const SizedBox(
                      height: 11.98,
                    ),
                    Text(
                      "TEST RESULT",
                      style: headlineMain2,
                    ),
                    SizedBox(
                      height: 0.03 * size.height,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          formatDate!,
                          style: headlineDate,
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        Text(
                          formatTime!,
                          style: headlineDate,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 0.02 * size.height,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              border: Border.all(color: dividerColor),
                              borderRadius:
                              BorderRadius.all(Radius.circular(20))),
                          height: 50,
                          width: 0.15 * size.width,
                          padding: EdgeInsets.all(0),
                          child: IconButton(
                            padding: EdgeInsets.all(0),
                            onPressed: () {
                              setState(() {
                                if(_counter !=1){
                                  _counter--;
                                }
                                question = test?[_counter-1].question;
                                std = test?[_counter-1].id_std;
                                print(std);
                              });
                            },
                            icon: Icon(Icons.keyboard_arrow_left_sharp),
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(
                          width: 0.03 * size.width,
                        ),
                        Container(
                            decoration: BoxDecoration(
                                border: Border.all(color: dividerColor),
                                borderRadius:
                                BorderRadius.all(Radius.circular(20))),
                            height: 50,
                            alignment: Alignment.center,
                            width: 0.5 * size.width,
                            child: Text(
                              '$_counter / 10',
                              style: headlineMainNumberQuestion,
                            )),
                        SizedBox(
                          width: 0.03 * size.width,
                        ),
                        Container(
                          decoration: BoxDecoration(
                              border: Border.all(color: dividerColor),
                              borderRadius:
                              BorderRadius.all(Radius.circular(20))),
                          height: 50,
                          width: 0.15 * size.width,
                          padding: EdgeInsets.all(0),
                          child: IconButton(
                            padding: EdgeInsets.all(0),
                            onPressed: () {
                              setState(() {
                                if (_counter != 10){
                                  _counter++;
                                }
                                question = test?[_counter-1].question;
                                std = test?[_counter-1].id_std;
                                print(std);
                              });
                            },
                            icon: Icon(Icons.keyboard_arrow_right_sharp),
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 0.06 * size.height,
                    ),
                    Container(
                      width: size.width - (2 * 0.03 * size.width),
                      height: 0.45 * size.height,
                      decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(25)),
                          color: Colors.white),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: 300,
                            height: 100,
                            child: Center(
                              child: Text(
                                question!,
                                // '123',
                                style: headlineResultQuestion,
                                textAlign: TextAlign.center,
                              ),
                              // child: FutureBuilder(
                              //   future: getQuestion(),
                              //   builder: (context, AsyncSnapshot snapshot){
                              //     if (snapshot.data == null){
                              //       return Container(
                              //         child: Center(
                              //           child: Text("Loading"),
                              //         ),
                              //       );
                              //     }else{
                              //       return Text(
                              //         snapshot.data[_counter-1].question,
                              //         style: headlineResultQuestion,
                              //         textAlign: TextAlign.center,
                              //       );
                              //     }
                              //   },
                              // ),
                            ),
                          ),
                          Center(
                              child: Container(
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle, color: Colors.green),
                                child: IconButton(
                                  icon: Icon(Icons.play_arrow_outlined),
                                  onPressed: ()  async {
                                    Source audioUrl;
                                    var answer = test?[_counter-1].answer;
                                    if (answer!=null){
                                      audioUrl = UrlSource(answer);
                                      audioPlayer.play(audioUrl);
                                    }
                                    // audioUrl =
                                    // if (audio != null){
                                    //   audioUrl = UrlSource(audio.answer.toString());
                                    //   audioPlayer.play(audioUrl);
                                    //   print(audio.answer);
                                    // }
                                  },
                                  color: Colors.white,
                                  iconSize: 50,
                                ),
                              )),
                          SizedBox(
                            height: 50,
                          ),
                          Text(
                            "Score",
                            style: dateFont,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            width: 300,
                            height: 60,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                border:
                                Border.all(color: dividerColor, width: 2),
                                borderRadius:
                                BorderRadius.all(Radius.circular(30))),
                            child: TextFormField(
                              controller: scoreController,
                              keyboardType: TextInputType.number,
                              // validator: (text){
                              //   if(text == null || text.isEmpty){
                              //     return "Can't be empty";
                              //   }
                              //   if (int.parse(text) >10){
                              //     return "Score can't be higher than 10";
                              //   }
                              //   return null;
                              // },
                              // onChanged: (text){
                              //   setState(() {
                              //     score = text;
                              //   });
                              // },
                              textAlign: TextAlign.center,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: 'Max Score 10',
                                hintStyle: headlineHint
                              ),
                            ),
                            // child: Text(
                            //   '10',
                            //   style: headlineTitle2,
                            // ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 0.05 * size.height,
                    ),
                    Container(
                      width: size.width - (2 * 0.03 * size.width),
                      height: 50,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(30))
                      ),
                      child: Center(
                        child: InkWell(
                          onTap: () {

                            postScoreItem(std!, int.parse(scoreController.text));
                            Navigator.of(context).pushReplacementNamed(HomePage.nameRoute);
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.create_outlined, color: borderColor,),
                              SizedBox(
                                width: 15,
                              ),
                              Text(
                                'UPDATE',
                                style: button2,
                              )
                            ],
                          ),
                        )
                      ),
                    ),
                    // InkWell(
                    //   onTap: () {
                    //     Navigator.of(context).pop();
                    //   },
                    //   child: Row(
                    //     mainAxisAlignment: MainAxisAlignment.center,
                    //     children: [
                    //       Icon(Icons.keyboard_arrow_left_sharp,
                    //           color: Colors.white),
                    //       Text(
                    //         'BACK TO RESULTS',
                    //         style: bodyQuestionAtributes,
                    //       )
                    //     ],
                    //   ),
                    // )
                  ],
                ),
              ),
            ),
            Positioned(
              top: 0.03 * size.height,
              left: 0.03 * size.height,
              child: Image.asset(
                'assets/img/Logo Udayana (Tanpa Nama).png',
                height: 47.96,
                width: 48.03,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
