import 'package:flutter/material.dart';
import 'package:flutter_teacher_speakingtest/models/student_scoring.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../widget/questionCard_widget.dart';
import '../widget/scoringCard_widget.dart';
import '../models/question_model.dart';
import '../constants/color.dart';
import '../constants/font.dart';
import 'dialog_interface.dart';
import 'loginPage_interface.dart';

class HomePage extends StatefulWidget {
  static const nameRoute = '/homepage';

  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  DateTime _dateTime = DateTime.now();
  bool onpress = true;


  late SharedPreferences sharedPreferences;

  @override
  void initState() {
    setState(() {

    });
    super.initState();
    checkLoginStatus();
  }

  checkLoginStatus() async {
    sharedPreferences = await SharedPreferences.getInstance();

    if (sharedPreferences.getString('token') == null) {
      Navigator.of(context).pushReplacementNamed(LoginPage.nameRoute);
    }
  }

  @override
  Widget build(BuildContext context) {
    String formattedDate = DateFormat('d MMM yyyy').format(_dateTime);
    String formatFilterDate = DateFormat('yyyy-MM-d').format(_dateTime);

    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Container(
              decoration: BoxDecoration(gradient: gradientBackgroundColor),
              child: Center(
                child: Column(
                  children: [
                    SizedBox(
                      height: 0.05 * size.height,
                    ),
                    Image.asset(
                      'assets/img/Logo Udayana.png',
                      height: 119.45,
                      width: 104.4,
                    ),
                    SizedBox(
                      height: 0.03 * size.height,
                    ),
                    Text(
                      "SPEAKING TEST",
                      style: headlineMain1,
                    )
                  ],
                ),
              ),
            ),
            Positioned(
              top: 15,
              right: 15,
              child: PopupMenuButton(
                icon: Icon(
                  Icons.person,
                  color: Colors.white,
                ),
                itemBuilder: (context) {
                  return [
                    PopupMenuItem(
                      child: Text('Log Out'),
                      value: 1,
                    )
                  ];
                },
                onSelected: (value) {
                  if (value == 1) {
                    showDialog(
                        context: context,
                        builder: (context) => DialogLogOut(
                              sharedPreferences: sharedPreferences,
                            ));
                  }
                },
              ),
            ),
            onpress
                ? onPressInterfaces(size, formattedDate, formatFilterDate)
                : offPressInterfaces(size),
            Positioned(
                bottom: 15,
                left: 15,
                right: 15,
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 5),
                        width: 150,
                        child: TextButton(
                          onPressed: () {
                            if (!onpress) {
                              setState(() {
                                onpress = true;
                              });
                            }
                          },
                          child: Text(
                            "Scoring",
                            style: onpress ? button1 : button2,
                          ),
                        ),
                        decoration: onpress ? onState() : offState(),
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 5),
                        width: 150,
                        child: TextButton(
                          onPressed: () {
                            if (onpress) {
                              setState(() {
                                onpress = false;
                              });
                            }
                          },
                          child: Text(
                            "Question",
                            style: !onpress ? button1 : button2,
                          ),
                        ),
                        decoration: !onpress ? onState() : offState(),
                      ),
                    ],
                  ),
                )),
          ],
        ),
      ),
    );
  }

  BoxDecoration onState() {
    return BoxDecoration(
      borderRadius: const BorderRadius.all(Radius.circular(100)),
      gradient: gradientBackgroundColor,
    );
  }
  BoxDecoration offState() {
    return BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(100)),
        border: Border.all(
          color: borderColor,
          width: 3,
        ));
  }

  //SCORING PAGE
  onPressInterfaces(Size size, String formattedDate, String formatFilterDate) {

    return Positioned(
      left: 0,
      bottom: 0,
      right: 0,
      child: Container(
        height: 0.62 * size.height,
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(50),
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            SizedBox(
              height: 0.02 * size.height,
            ),
            Text(
              "Scoring",
              style: headlineTitle2,
            ),
            SizedBox(
              height: 0.02 * size.height,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 30),
              width: size.width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Center(
                      child: Text(
                        "Data",
                        style: headlineDatePicker,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 0.03 * size.width,
                  ),
                  Container(
                      width: 0.65 * size.width,
                      height: 42,
                      decoration: BoxDecoration(
                          border: Border.all(color: greyscale, width: 1.5),
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                      child: Row(
                        children: [
                          SizedBox(
                            width: 0.02 * size.width,
                          ),
                          Expanded(
                            child: Text(
                              formattedDate,
                              style: pickerDateFont,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 5),
                            child: Container(
                              width: 1,
                              color: dividerColor,
                            ),
                          ),
                          IconButton(
                            iconSize: 20,
                            onPressed: () {
                              showDatePicker(
                                      context: context,
                                      firstDate: DateTime(2010),
                                      lastDate: DateTime(2099),
                                      initialDate: _dateTime)
                                  .then((date) {
                                setState(() {
                                  _dateTime = date!;
                                });
                              });
                            },
                            icon: Icon(Icons.calendar_month_outlined),
                            alignment: Alignment.center,
                          ),
                          Container(
                            width: 0.15 *size.width,
                            decoration: BoxDecoration(
                                gradient: gradientBackgroundColor,
                                borderRadius: const BorderRadius.only(
                                  topRight: Radius.circular(20),
                                  bottomRight: Radius.circular(20),
                                )),
                            child: TextButton(
                              onPressed: () {},
                              child: Text(
                                "GO",
                                style: headlineDate,
                              ),
                            ),
                          )
                        ],
                      ))
                ],
              ),
            ),
            SizedBox(
              height: 0.02 * size.height,
            ),
            Text(
              "Date : $formattedDate",
              style: headlineName,
            ),
            SizedBox(
              height: 0.01 * size.height,
            ),
            FutureBuilder(
              future: getStudent(formatFilterDate),
              builder: (BuildContext context, AsyncSnapshot snapshot){
                if (snapshot.data == null){
                  return Container(
                    child: Center(
                      child: Text("Loading"),
                    ),
                  );
                }else{
                  return Expanded(
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: snapshot.data.length,
                      itemBuilder: (BuildContext context, int index){
                        return ScoreCard(size: size, formattedDate: DateFormat('d MMM yyyy').format(snapshot.data[index].dateTime), formatTime: DateFormat.Hm().format(snapshot.data[index].dateTime), name: snapshot.data[index].name, score: 0,);
                        // return QuestionCard(size : size, id : index+1, timer : snapshot.data[index].timer);
                      },
                    ),
                  );
                }
              },
            ),
            // Expanded(
            //   child: ListView.builder(
            //     itemCount:5,
            //     itemBuilder: (context, index) {
            //       return ScoreCard(
            //           size : size, name : name[index], formattedDate : formattedDate, formatTime : formatTime, score : 80 + index);
            //     },
            //   ),
            // ),
            SizedBox(
              height: 0.1 * size.height,
            )
          ],
        ),
      ),
    );
  }
  //QUESTION PAGE
  offPressInterfaces(Size size) {
    return Positioned(
      left: 0,
      bottom: 0,
      right: 0,
      child: Container(
        height: 0.62 * size.height,
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(50),
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            const SizedBox(
              height: 20,
            ),
            Text(
              "Question",
              style: headlineTitle2,
            ),
            const SizedBox(
              height: 5,
            ),
            FutureBuilder(
              future: getQuestion(),
              builder: (BuildContext context, AsyncSnapshot snapshot){
                if (snapshot.data == null){
                  return Container(
                    child: Center(
                      child: Text("Loading"),
                    ),
                  );
                }else{
                  return Expanded(
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: snapshot.data.length,
                      itemBuilder: (BuildContext context, int index){
                        return QuestionCard(size : size, id : index+1, timer : snapshot.data[index].timer);
                      },
                    ),
                  );
                }
              },
            ),
            SizedBox(
              height: 0.1 * size.height,
            ),
          ],
        ),
      ),
    );
  }


}
