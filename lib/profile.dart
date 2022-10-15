import 'profile_widget.dart';
import 'dart:io';
import 'package:path/path.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'mainhome.dart';
import 'login.dart';
import 'menu.dart';

void main() async {

  await Firebase.initializeApp();
  runApp(const ProfilePage());
}

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final _auth = FirebaseAuth.instance;
  late String email;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.grey[300],
        body: Column(
          children: [
            Container(
              child: Stack(
                children: <Widget>[
                  Container(
                    height: 170,
                    decoration: BoxDecoration(
                        color: Color.fromARGB(255, 24, 28, 76),
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(130),
                          bottomRight: Radius.circular(130),
                        )
                    ),
                  ),
                  Center(
                    child: Column(
                      children: [
                        Padding(padding: EdgeInsets.only(top: 80)),
                        Container(
                          height: 130,
                          width: 130,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(color: Colors.white,width: 5),
                            image: DecorationImage(
                               fit: BoxFit.cover,
                                image: AssetImage("assets/images/p1.jpg")),
                          ),
                        ),

                     SizedBox(
                       height: 10,
                     ),
                 Text(_auth.currentUser?.email?? 'No Email',style:TextStyle(color: Colors.grey[700],fontSize: 16),),


                      ],
                    ),
                  ),


                ],
              ),
            ),
            SizedBox(height: 20,),
            // Column(
            //   crossAxisAlignment: CrossAxisAlignment.center,
            //   children: const [
            //
            //     ProfileWidget(
            //       icon: Icons.settings,
            //       title: 'Settings',
            //     ),
            //     ProfileWidget(
            //       icon: Icons.notifications,
            //       title: 'Notifications',
            //     ),
            //
            //   ],
            // ),
            SizedBox(height: 10,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 0,vertical: 0),

                    child:
                        ElevatedButton(

                          child: const Text(
                            'SIGN OUT',
                          ),

                          onPressed: () async {
                            Future<void> _signOut() async {
                              await FirebaseAuth.instance.signOut();
                            }
                            if (_signOut() != null) {
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Login()));
                            }

                          },
                          style: ElevatedButton.styleFrom(
                            primary: Color.fromARGB(255, 24, 28, 76),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ),
                        ),
    ),


           Column(
             children: [
               GestureDetector(
                 child: Container(
                   padding: EdgeInsets.all(40),
                   child:  ElevatedButton(
                  onPressed: (){
        openWhatsapp();
    },


    child: const Text(
    'Help',

    ),
                     style: ElevatedButton.styleFrom(
                       primary: Color.fromARGB(255, 24, 28, 76),
                       shape: RoundedRectangleBorder(
                         borderRadius: BorderRadius.circular(10.0),

                   ),
                 ),
               )
               ),
               ),
  ],




           )



          ],
        ),

    );
  }
  openWhatsapp() async {
    var whatsapp = "+919687460911";
    var whatsappURl_android = "whatsapp://send?phone=" + whatsapp + "&text=hello";
    var whatappURL_ios = "https://wa.me/$whatsapp?text=${Uri.parse("hello")}";
    if (Platform.isIOS) {
      // for iOS phone only
      if (await canLaunch(whatappURL_ios)) {
        await launch(whatappURL_ios, forceSafariVC: false);
      } else {
        ScaffoldMessenger.of(this.context).showSnackBar(
            SnackBar(content: new Text("whatsapp not installed")));
      }
    }
    else{
      // android , web
      if( await canLaunch(whatsappURl_android)){
        await launch(whatsappURl_android);
      }else{
        ScaffoldMessenger.of(this.context).showSnackBar(
            SnackBar(content: new Text("whatsapp no installed")));

      }



    }


  }
}