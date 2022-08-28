import 'package:flutter/material.dart';

import '../constants/color.dart';
import '../constants/font.dart';
import '../interfaces/dialog_interface.dart';
import '../interfaces/questionItem_interface.dart';

class QuestionCard extends StatelessWidget {
  Size size;
  int id;
  int timer;
  QuestionCard({Key? key, required this.size, required this.id, required this.timer }) : super(key: key);

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
          const SizedBox(
            width: 15,
          ),
          Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'ID_SOAL',
                    style: headlineMini,
                  ),
                  Text(
                    "$id",
                    style: dateFont,
                  ),
                ],
              )),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 15),
            child: Container(
              width: 1,
              color: dividerColor,
            ),
          ),
          SizedBox(
            width: 0.04 * size.width,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Timer",
                  style: headlineMini,
                ),
                Text(
                  "$timer",
                  style: scoreFont,
                ),
              ],
            ),
          ),
          SizedBox(
            width: 0.04 * size.width,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 15),
            child: Container(
              width: 1,
              color: dividerColor,
            ),
          ),
          SizedBox(
            width: 0.05 * size.width,
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
                  print(id);
                  Navigator.of(context).pushReplacementNamed(QuestionItemPage.nameRoute);
                },
                icon: Icon(Icons.create_outlined),
                color: Colors.white,
                padding: const EdgeInsets.all(0),
                iconSize: 20,
              ),
            ),
          ),
          SizedBox(
            width: 0.01 * size.width,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
            child: Container(
              width: 30,
              height: 30,
              decoration:
              BoxDecoration(shape: BoxShape.circle, color: Colors.red),
              child: IconButton(
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (context) => DialogHapus(
                        id: id,
                      ));
                },
                icon: Icon(Icons.delete_outline_outlined),
                color: Colors.white,
                padding: const EdgeInsets.all(0),
                iconSize: 20,
              ),
            ),
          ),
          SizedBox(
            width: 0.02 * size.width,
          ),
        ],
      ),
    );
  }
}
