

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:carousel_slider/carousel_controller.dart';
import 'package:carousel_slider/carousel_options.dart';

import 'package:getwidget/getwidget.dart';



import 'home.dart';

class MainHome extends StatefulWidget {
  const MainHome({Key? key}) : super(key: key);

  @override
  State<MainHome> createState() => _MainHomeState();
}

class _MainHomeState extends State<MainHome> {


  List<bool> optionselected = [true, false, false, false];
  @override
  Widget build(BuildContext context) {


    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: ListView(
        children: [

            Container(
               padding: EdgeInsets.only(left: 20,top: 40),
              height: 150,
              decoration: BoxDecoration(
                  color: Color.fromARGB(255, 24, 28, 76),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(40),
                    bottomRight: Radius.circular(40),
                  )
              ),
              child: Row(

                children: <Widget>[
                  Text("Easy To Cook Menu!",style: Theme.of(context).textTheme.headline5?.copyWith(
                      color: Colors.white,fontWeight: FontWeight.bold
                  ),
                  ),

                ],
              ),

            ),
          SizedBox(height: 10,),


            Positioned(

              child: Container(

                 padding:  EdgeInsets.only(left: 22, right: 22,  ),
                height: 54,

                child: TextField(
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide.none,
                    ),
                    hintText: "Search",
                    contentPadding: const EdgeInsets.only(
                        left: 14.0, bottom: 8.0, top: 8.0),
                    prefixIcon: IconButton(
                      icon: Image.asset(
                        "assets/icon/search.png",
                        height: 25,
                      ),
                      onPressed: (){

                      },
                      color: Colors.black,
                    ),

                  ),

                ),


              ),
              

            ),

            SizedBox(height: 10,),

            Container(
               padding: EdgeInsets.only(left: 24),
              child: Row(
                children: [
                  Text('Category',
                    style:TextStyle(fontSize: 14,fontWeight: FontWeight.bold,color: Colors.grey[700]),

                  ),
                ],
              ),

            ),
           Container(
               padding: EdgeInsets.only(left: 6),
               child: SingleChildScrollView(


                scrollDirection: Axis.horizontal,
                padding: EdgeInsets.all(12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    option('Mojito', 'assets/icon/m1.png', 0),
                    SizedBox(
                      width: 8,
                    ),
                    option('Fruit Mocktail', 'assets/icon/m2.png', 1),
                    SizedBox(
                      width: 8,
                    ),
                    option('Alcoholic', 'assets/icon/m3.png', 2),
                    SizedBox(
                      width: 8,
                    ),
                    option('Non Alcoholic', 'assets/icon/m4.png', 3),
                  ],
                ),
              ),
            ),
          Container(
            padding: EdgeInsets.only(left: 24),
            child: Row(
              children: [
                Text('Popular',
                  style:TextStyle(fontSize: 16,fontWeight: FontWeight.bold,color: Colors.black),

                ),
              ],
            ),

          ),
          SizedBox(height: 10,),
          CarouselSlider(
            items: [

              //1st Image of Slider
              Container(
                margin: EdgeInsets.all(6.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  image: DecorationImage(
                    image: AssetImage("assets/images/a1.jpg",),
                    fit: BoxFit.cover,
                  ),
                ),
              ),

              //2nd Image of Slider
              Container(
                margin: EdgeInsets.all(6.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  image: DecorationImage(
                    image: AssetImage("assets/images/a2.jpg",),
                    fit: BoxFit.cover,
                  ),
                ),
              ),

              //3rd Image of Slider
              Container(
                margin: EdgeInsets.all(6.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  image: DecorationImage(
                    image: AssetImage( "assets/images/a3.jpg",),
                    fit: BoxFit.cover,
                  ),
                ),
              ),

              //4th Image of Slider
              Container(
                margin: EdgeInsets.all(6.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  image: DecorationImage(
                    image: AssetImage( "assets/images/a4.jpg",),
                    fit: BoxFit.cover,
                  ),
                ),
              ),

              //5th Image of Slider


            ],

            //Slider Container properties
            options: CarouselOptions(
              height: 180.0,
              enlargeCenterPage: true,
              autoPlay: true,
              aspectRatio: 16 / 9,
              autoPlayCurve: Curves.fastOutSlowIn,
              enableInfiniteScroll: true,
              autoPlayAnimationDuration: Duration(milliseconds: 800),
              viewportFraction: 0.8,
            ),
          ),



        ],



      ),
    );

    }
  Widget option(String text, String image, int index) {
    return GestureDetector(
      onTap: () {
        setState(() {

          optionselected[index] = !optionselected[index];
        });
      },
      child: Container(
        height: 40,
        decoration: BoxDecoration(
          color: optionselected[index] ? kPrimaryColor :  Colors.grey[500],
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
          boxShadow: [kBoxShadow],
        ),
        padding: EdgeInsets.symmetric(horizontal: 12),
        child: Row(
          children: [
            SizedBox(
              // height: 32,
              // width: 32,
              child: Image.asset(
                image,
                height: 25,
              ),
            ),
            SizedBox(
              width: 8,
            ),
            Text(
              text,
              style: TextStyle(
                  color:optionselected[index]
                      ? Colors.white
                      : Colors.black,
                  fontSize: 14,
                  fontWeight: FontWeight.bold),
            )
          ],
        ),

      ),


    );
  }
}


Color kPrimaryColor = Color.fromARGB(255, 24, 28, 76);

BoxShadow kBoxShadow = BoxShadow(
  color: Colors.grey.withOpacity(0.2),
  spreadRadius: 2,
  blurRadius: 8,
  offset: Offset(0, 0),
);




