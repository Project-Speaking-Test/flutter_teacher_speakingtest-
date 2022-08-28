import 'package:flutter/material.dart';

import '../constants/color.dart';
import '../constants/font.dart';
import '../interfaces/scoringItem_interface.dart';

class ScoreCard extends StatelessWidget {
  Size size;
  String name;
  String formattedDate;
  String formatTime;
  int score;

  ScoreCard({Key? key, required this.size, required this.name, required this.formattedDate,
    required this.formatTime, required this.score}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
      height: 70,
      width: size.width,
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(20))),
      child: Row(
        children: [
          SizedBox(
            width: 0.05 * size.width,
          ),
          Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Tanggal',
                    style: headlineMini,
                  ),
                  Row(
                    children: [
                      Text(
                        formattedDate,
                        style: dateFont,
                      ),
                      SizedBox(
                        width: 0.01 * size.width,
                      ),
                      Text(
                        formatTime,
                        style: timeFont,
                      )
                    ],
                  )
                ],
              )),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 15),
            child: Container(
              width: 1,
              color: dividerColor,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Student",
                  style: headlineMini,
                ),
                Text(
                  "$name",
                  style: scoreFont,
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 15),
            child: Container(
              width: 1,
              color: dividerColor,
            ),
          ),
          const SizedBox(
            width: 3,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Score",
                  style: headlineMini,
                ),
                Text(
                  score.toString(),
                  style: scoreFont,
                ),
              ],
            ),
          ),
          SizedBox(
            width: 0.005 * size.width,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 15),
            child: Container(
              width: 1,
              color: dividerColor,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
            child: Container(
              width: 30,
              height: 30,
              decoration:
              BoxDecoration(shape: BoxShape.circle, color: secondaryColor),
              child: IconButton(
                onPressed: () {
                  Navigator.of(context).pushNamed(ScoringItemPage.nameRoute);
                },
                icon: Icon(Icons.create_outlined),
                color: Colors.white,
                padding: const EdgeInsets.all(0),
                iconSize: 20,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
            child: Container(
              width: 30,
              height: 30,
              decoration:
              BoxDecoration(shape: BoxShape.circle, color: Colors.red),
              child: IconButton(
                onPressed: () {},
                icon: Icon(Icons.delete_outline_outlined),
                color: Colors.white,
                padding: const EdgeInsets.all(0),
                iconSize: 20,
              ),
            ),
          )
        ],
      ),
    );
  }
}
