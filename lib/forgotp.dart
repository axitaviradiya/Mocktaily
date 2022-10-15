import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'login.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();  //here we initialize our Firebase App
  runApp(const Forgotp());
}

class Forgotp extends StatefulWidget {
  const Forgotp({Key? key}) : super(key: key);

  @override
  State<Forgotp> createState() => _ForgotpState();
}

class _ForgotpState extends State<Forgotp> {
  final _auth = FirebaseAuth.instance;
  late String email;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.maxFinite,
        height: double.maxFinite,

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
                          'Forgot,\nPassword?',
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
            top: 190,
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
                    height: 30,
                  ),
                  Container(
                      height: 50,
                      width: 300,
                      //   padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                      child: ElevatedButton(
                        child: const Text(
                          'Forgot Password',
                        ),
                    onPressed: () async {

                          try{
                            await _auth.sendPasswordResetEmail(email: email);
                            const snackBar = SnackBar(
                              content: Text('Reset Link Sent'),
                            );


                            ScaffoldMessenger.of(context).showSnackBar(snackBar);

                          }catch(e){
                            print(e);
                          }
                    },


                        style: ElevatedButton.styleFrom(
                          primary: Color.fromARGB(255, 24, 28, 76),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                      )),

                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.center,
                  //   children: [
                  //     Padding(padding: EdgeInsets.only(left: 20)),
                  //     Text(
                  //       "Back to Login",
                  //       style: TextStyle(
                  //
                  //         fontWeight: FontWeight.bold,
                  //         color: Color.fromARGB(255, 24, 28, 76),
                  //
                  //       ),
                  //
                  //     ),
                  //     new GestureDetector(
                  //       onTap: () {
                  //         Navigator.pushReplacement(
                  //             context,
                  //             MaterialPageRoute(
                  //                 builder: (context) => SignupPage()
                  //             )
                  //         );
                  //       },
                  //     ),
                  //     // Text(
                  //     //   "Reset",
                  //     //   style: TextStyle(
                  //     //     fontWeight: FontWeight.bold,
                  //     //     color: Color.fromARGB(255, 24, 28, 76),
                  //     //   ),
                  //     // )
                  //   ],
                  // ),
                  // Container(
                  //   child: Text(
                  //     "Login With",
                  //     style: TextStyle(
                  //       color: Colors.grey[600],
                  //     ),
                  //   ),
                  // ),
                  // SizedBox(
                  //   height: 5,
                  // ),
                  // Container(
                  //     child: Row(
                  //   children: [
                  //     IconButton(
                  //       iconSize: 100,
                  //       icon: Image.asset(
                  //         "assets/icon/google.png",
                  //       ),
                  //       onPressed: null,
                  //     ),
                  //     IconButton(
                  //       iconSize: 100,
                  //       icon: Image.asset("assets/icon/facebook.png"),
                  //       onPressed: null,
                  //     ),
                  //     // IconButton(
                  //     //   iconSize: 100,
                  //     //   icon: Image.asset("assets/icon/gmail.png"),
                  //     //   onPressed: null,
                  //     // ),
                  //     // IconButton(
                  //     //   iconSize: 100,
                  //     //   icon: Image.asset("assets/icon/twitter.png"),
                  //     //   onPressed: null,
                  //     // ),
                  //   ],
                  // )),
                  // SizedBox(
                  //   height: 5,
                  // ),
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.center,
                  //   children: [
                  //     Padding(padding: EdgeInsets.only(left: 20)),
                  //     Text(
                  //       "Already have an account?",
                  //       style: TextStyle(
                  //         color: Colors.grey[500],
                  //       ),
                  //
                  //     ),

                      // Text(
                      //   "SingIn ",
                      //   style: TextStyle(
                      //     fontWeight: FontWeight.bold,
                      //     color: Color.fromARGB(255, 24, 28, 76),
                      //   ),
                      // )
                      // new GestureDetector(
                      //   onTap: () {
                      //     Navigator.pushReplacement(
                      //         context,
                      //         MaterialPageRoute(
                      //             builder: (context) => Singinpage()
                      //         )
                      //     );
                      //   },
                      //   child: new Text("Sign In",
                      //     style: TextStyle(
                      //       fontWeight: FontWeight.bold,
                      //       color: Color.fromARGB(255, 24, 28, 76),
                      //     ),
                      //   ),
                      // ),
                    ],
                  ),

              ),
            ),

        ]),
      ),

    );
  }
}

class AuthenticationService {
  final _auth = FirebaseAuth.instance;
//...
}
