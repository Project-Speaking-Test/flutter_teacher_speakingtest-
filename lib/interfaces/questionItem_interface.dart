import 'package:flutter/material.dart';
import 'package:flutter_teacher_speakingtest/interfaces/homePage_interface.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/question_model.dart';
import '../constants/color.dart';
import '../constants/font.dart';

class QuestionItemPage extends StatefulWidget {
  static const nameRoute = '/questionitempage';
  const QuestionItemPage({Key? key}) : super(key: key);

  @override
  State<QuestionItemPage> createState() => _QuestionItemPageState();
}

class _QuestionItemPageState extends State<QuestionItemPage> {

  final questionController = TextEditingController();
  final timerController = TextEditingController();
  var _counter = 1;



  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Stack(
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
                      "QUESTION",
                      style: headlineMain2,
                    ),
                    SizedBox(
                      height: 0.03 * size.height,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "ID_SOAL $_counter",
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
                              child: TextFormField(
                                textAlign: TextAlign.center,
                                controller: questionController,
                                decoration: InputDecoration(
                                  focusedBorder: InputBorder.none,
                                  enabledBorder: InputBorder.none,
                                  hintText: 'Klik here to change question',
                                  hintStyle: hintText,
                                ),
                              ),
                              // child: FutureBuilder(
                              //   future: getQuestion(),
                              //   builder: (BuildContext context, AsyncSnapshot snapshot){
                              //     if (snapshot.data == null){
                              //       return Container(
                              //         child: Center(
                              //           child: Text("Loading"),
                              //         ),
                              //       );
                              //     }else{
                              //       // questionItem =snapshot.data[_counter-1].question;
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
                          SizedBox(
                            height: 50,
                          ),
                          Text(
                            "Timer (s)",
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
                              controller: timerController,
                              keyboardType: TextInputType.number,
                              textAlign: TextAlign.center,
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: 'Time in seconds',
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
                              updateQuestion(_counter, questionController.text, int.parse(timerController.text));
                              setState(() {
                                
                              });
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
