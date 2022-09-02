import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'homePage_interface.dart';
import '../models/user_auth.dart';
import '../constants/color.dart';
import '../constants/font.dart';


class RegisterPage extends StatefulWidget {
  static const nameRoute = '/registerpage';
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {

  bool isLoading = false;

  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
          body :Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                    gradient: gradientBackgroundColor
                ),
                child: Center(
                  child: Column(
                    children: [
                      SizedBox(
                        height: 0.05 * size.height,
                      ),
                      Image.asset('assets/img/Logo Udayana.png', height: 119.45, width: 104.4,),
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
                left: 0,
                right: 0,
                bottom: 0,
                child: Container(
                  height: 0.62 * size.height,
                  decoration: BoxDecoration(
                      color: backgroundColor,
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(50),
                      )
                  ),
                  // child:  Column(
                  child : isLoading ? Center(child : CircularProgressIndicator()) : Column(
                  children: [
                      SizedBox(
                        height: 0.03 * size.height,
                      ),
                      Text(
                        "Register",
                        style: headlineTitle2,
                      ),
                      SizedBox(
                        height: 0.03 * size.height,
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 27),
                        padding: const EdgeInsets.only(left: 25, right: 25,top: 15, bottom: 5),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Nama Teacher",
                              style: headlineHint,
                            ),
                            TextFormField(
                              controller: nameController,
                              decoration: InputDecoration(
                                focusedBorder: InputBorder.none,
                                enabledBorder: InputBorder.none,
                                hintText: 'John Doe',
                                hintStyle: hintText,
                              ),
                            )
                          ],
                        ),
                        decoration: BoxDecoration(
                            borderRadius: const BorderRadius.all(Radius.circular(20)),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.2),
                                spreadRadius: 0,
                                blurRadius: 1,
                              )
                            ]
                        ),
                      ),
                      SizedBox(
                        height: 0.015 * size.height,
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 27),
                        padding: const EdgeInsets.only(left: 25, right: 25,top: 15, bottom: 5),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Username",
                              style: headlineHint,
                            ),
                            TextFormField(
                              controller: emailController,
                              decoration: InputDecoration(
                                focusedBorder: InputBorder.none,
                                enabledBorder: InputBorder.none,
                                hintText: 'userspeak@mail.com',
                                hintStyle: hintText,
                              ),
                            )
                          ],
                        ),
                        decoration: BoxDecoration(
                            borderRadius: const BorderRadius.all(Radius.circular(20)),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.2),
                                spreadRadius: 0,
                                blurRadius: 1,
                              )
                            ]
                        ),

                      ),
                      SizedBox(
                        height: 0.015 * size.height,
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 27),
                        padding: const EdgeInsets.only(left: 25, right: 25,top: 15, bottom: 5),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Password",
                              style: headlineHint,
                            ),
                            TextFormField(
                              controller: passController,
                              obscureText: true,
                              decoration: InputDecoration(
                                focusedBorder: InputBorder.none,
                                enabledBorder: InputBorder.none,
                                hintText: '* * * * * * * * * * * ',
                                hintStyle: hintText,
                              ),
                            )
                          ],
                        ),
                        decoration: BoxDecoration(
                            borderRadius: const BorderRadius.all(Radius.circular(20)),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.2),
                                spreadRadius: 0,
                                blurRadius: 1,
                              )
                            ]
                        ),
                      ),
                      SizedBox(
                        height: 0.015 * size.height,
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 27),
                        width: size.width,
                        child: TextButton(
                          onPressed: () async {
                            isLoading = true;
                            await createUser(nameController.text, emailController.text, passController.text);
                            SharedPreferences sharedpreferences = await SharedPreferences.getInstance();
                            if(sharedpreferences.getString('token') != null){
                              isLoading = false;
                              Navigator.of(context).pushReplacementNamed(HomePage.nameRoute);
                            }
                          },
                          child: Text(
                            "REGISTER",
                            style: button1,
                          ),
                        ),
                        decoration: BoxDecoration(
                          borderRadius : const BorderRadius.all(Radius.circular(100)),
                          gradient: gradientBackgroundColor,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Already have account?",
                            style: bodyLoginQuestion,
                          ),
                          TextButton(
                            onPressed: (){
                              Navigator.of(context).pop();
                            },
                            child: Text(
                              "LOGIN",
                              style: buttonLoginQuestion,
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              )
            ],
          )
      ),
    );
  }
}
