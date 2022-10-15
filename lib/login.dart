import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'singuppage.dart';
import 'singinpage.dart';

import 'responsivebutton.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Color.fromARGB(255, 250, 205, 218),
      body: Container(
        child: Stack(
          children: [
            Positioned(
                top: 10,
                left: 20,
                right: 20,
                child: Center(
                  child: Container(
                      height:  400,
                      width: 700,
                      child: Image.asset("assets/images/img.png")),
                )),
            Positioned(
              bottom: 0,
              height:300,
              width: 320,
              child: Container(
                padding: EdgeInsets.only(left: 30, top: 30),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                ),
                child: Column(
                  children: [
                    Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                      // crossAxisAlignment: CrossAxisAlignment.center,

                      children: [
                        Padding(padding: EdgeInsets.only(left: 0,right: 0),),
                        Text("Welcome to Mocktaily",
                            style: TextStyle(
                              fontFamily: 'Dancing Script',
                              fontWeight: FontWeight.bold,
                              fontSize: 35,
                              color: Color.fromARGB(255, 24, 28, 76),
                            ))
                      ],
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,

                      children: [

                       // Padding(padding: EdgeInsets.only(left: 30,right: 2),),
                        Text(
                          "Click below to get started ",
                          style: TextStyle(
                            fontSize: 15,
                            color: Color.fromARGB(255, 24, 28, 76),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              bottom: 80,
              left: 30,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // ResponsiveButton(
                  //   isResponsive: true,
                  // ),
                  FloatingActionButton.extended(
                      label: Text(
                        "Sign in",
                        style: TextStyle(color: Colors.white),
                      ),
                      backgroundColor: Color.fromARGB(255, 24, 28, 76),
                      onPressed: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Singinpage()
                            )
                        );
                      }),
                ],
              ),
            ),
            Positioned(
              bottom: 80,
              right: 30,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // // ResponsiveButton(
                  // //   isResponsive: true,
                  // ),
                  FloatingActionButton.extended(
                      label: Text(
                        "Sign up",
                        style: TextStyle(color: Colors.white),
                      ),
                      backgroundColor: Color.fromARGB(255, 24, 28, 76),
                      onPressed: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SignupPage()));
                      }),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
