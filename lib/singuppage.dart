import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:mocktailapp/forgotp.dart';
import 'package:mocktailapp/login.dart';
import 'package:mocktailapp/mainhome.dart';
import 'package:mocktailapp/singinpage.dart';
import 'package:mocktailapp/util/fire_auth.dart';


import 'package:firebase_auth/firebase_auth.dart';

import 'login.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(const SignupPage());
}
class SignupPage extends StatefulWidget {

  const SignupPage({Key? key}) : super(key: key);

  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {

  final _auth = FirebaseAuth.instance;
  late String email;
  late String password;
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Container(
          width: double.infinity,
          height: double.infinity,
         
          child: Stack(children: [
            Positioned(
              child: Positioned(
                child: Container(
                  width: 500,
                  height: 250,
                  color: Color.fromARGB(255, 248, 226, 233),
                  child: Column(
                    children: [
                      Padding(padding: EdgeInsets.only(top: 20)),
                      Row(

                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          IconButton(
                              onPressed: () {
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Login()));
                              }, icon: Icon(Icons.arrow_back)),
                        ],
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(padding: EdgeInsets.only(left: 20)),
                          Text(
                            'Hey,\nWelcome!',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 30,
                              color: Color.fromARGB(255, 24, 28, 76),
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 5,
                      ),

                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              top: 180,

              child: Container(
                height: 400,
                width: 320,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    )),
                child: Column(
                  children: <Widget>[
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 20, right: 20, top: 15),
                      child: new TextField(
                        onChanged: (value){
                          email = value;
                        },
                        controller: null,
                        autofocus: false,
                        style: new TextStyle(
                            fontSize: 13,
                            color: Colors.black,
                            // fontWeight: FontWeight.bold
                        ),
                        decoration: new InputDecoration(
                          filled: true,
                          fillColor: Colors.grey[200],
                          hintText: 'Email',

                          contentPadding: const EdgeInsets.only(
                              left: 14.0, bottom: 8.0, top: 8.0),
                          focusedBorder: OutlineInputBorder(
                            borderSide: new BorderSide(color: Colors.indigo),
                            borderRadius: new BorderRadius.circular(10),
                          ),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: new BorderSide(color: Colors.indigo),
                            borderRadius: new BorderRadius.circular(10),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 20, right: 20, top: 15),
                      child: new TextField(
                        onChanged: (value){
                          password =value;
                        },
                        controller: null,
                        autofocus: false,
                        obscureText: true,
                        style: new TextStyle(
                            fontSize: 13,

                            color: Colors.black,
                            // fontWeight: FontWeight.bold
                        ),
                        decoration: new InputDecoration(
                          filled: true,
                          fillColor: Colors.grey[200],
                          hintText: 'Password ',

                          contentPadding: const EdgeInsets.only(
                              left: 14.0, bottom: 8.0, top: 8.0),
                          focusedBorder: OutlineInputBorder(
                            borderSide: new BorderSide(color: Colors.indigo),
                            borderRadius: new BorderRadius.circular(10),
                          ),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: new BorderSide(color: Colors.indigo),
                            borderRadius: new BorderRadius.circular(10),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 20, right: 20, top: 15),
                      child: new TextField(
                        controller: null,
                        autofocus: false,
                        obscureText: true,
                        style: new TextStyle(
                            fontSize: 13,
                            color: Colors.black,
                            // fontWeight: FontWeight.bold
                           ),
                        decoration: new InputDecoration(
                          filled: true,
                          fillColor: Colors.grey[200],
                          hintText: 'Confirm Password ',
                          contentPadding: const EdgeInsets.only(
                              left: 14.0, bottom: 8.0, top: 8.0),
                          focusedBorder: OutlineInputBorder(
                            borderSide: new BorderSide(color: Colors.indigo),
                            borderRadius: new BorderRadius.circular(10),
                          ),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: new BorderSide(color: Colors.indigo),
                            borderRadius: new BorderRadius.circular(10),
                          ),
                        ),
                      ),
                    ),


                    SizedBox(
                      height: 30,
                    ),
                    Container(
                        height: 50,
                        width: 300,
                        //   padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                        child: ElevatedButton(
                          child: const Text(
                            'Sign Up',
                          ),
                          onPressed: () async {
                            User? user = await FireAuth.registerUsingEmailPassword(email: email, password: password);

                             if(user != null){
                               Navigator.pushReplacement(
                                   context,
                                    MaterialPageRoute(
                                        builder: (context) => Singinpage()));
                              }

                           },
                          style: ElevatedButton.styleFrom(
                            primary: Color.fromARGB(255, 24, 28, 76),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ),
                        )),
                    SizedBox(
                      height: 20,
                    ),
                   Expanded(child: Container(
                     child: Column(
                       children:[
                         FloatingActionButton(
                         child:   Text("Forgot Password?",style: TextStyle(fontWeight: FontWeight.bold,color: Color.fromARGB(255, 24, 28, 76),),),
                         onPressed: (){
                           Navigator.pushReplacement(
                               context,
                               MaterialPageRoute(
                                 builder: (context) => Forgotp(),
                               )
                           );
                         },
                       ),
                         Row(
                           mainAxisAlignment: MainAxisAlignment.center,
                           children: [
                             Padding(padding: EdgeInsets.only(left: 20)),
                             Text(
                               "Already have an account?",
                               style: TextStyle(
                                 color: Colors.grey[500],
                               ),

                             ),

                             new GestureDetector(
                               onTap: () {
                                 Navigator.pushReplacement(
                                     context,
                                     MaterialPageRoute(
                                         builder: (context) => Singinpage()
                                     )
                                 );
                               },
                               child: new Text("Sign In",
                                 style: TextStyle(
                                   fontWeight: FontWeight.bold,
                                   color: Color.fromARGB(255, 24, 28, 76),
                                 ),
                               ),
                             ),
                           ],
                         ),
                       ],




                   ))


),
    ],
              ),
),
            ),
],
    ),
      ),
    );
  }
}
