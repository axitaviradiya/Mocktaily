import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'login.dart';
import 'mainhome.dart';
import 'singuppage.dart';
import 'package:lottie/lottie.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  void initState() {
    super.initState();
    Timer(
        Duration(seconds: 5
         ),
        () => Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => Login())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Stack(
          children: [
            Positioned(
                child: Center(
              child: Container(
                height: 200,
                width: 170,
                decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 247, 255, 171),
                  shape: BoxShape.circle,
                ),
              ),
            )),
            Positioned(
              height: 180,
              left: 50,
              right: 50,
              top: 200,
              child: Container(
                  child: Lottie.asset("assets/images/86401-cocktail-mix.json")),
            ),
            Positioned(
                top: 420,
                left: 70,
                right: 50,
                child: Container(
                  child: Text(
                    "Mocktaily",
                    style: TextStyle(
                        color: Color.fromARGB(255, 24, 28, 76),
                        fontFamily: 'Dancing Script',
                        fontWeight: FontWeight.bold,
                        fontSize: 50),
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
