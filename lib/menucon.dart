import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'menudetail.dart';
import 'menu.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MenuPage());
}

class Detail extends StatefulWidget {
  final Recipe recipe;

  Detail({required this.recipe});

  @override
  State<Detail> createState() => _DetailState();
}

class _DetailState extends State<Detail> {
  bool toggle = false;

  Future addtocart() async {
    final FirebaseAuth _auth = FirebaseAuth.instance;
    var currentUser = _auth.currentUser;
    CollectionReference _collectionRef = FirebaseFirestore.instance.collection(
        "users-cart-items");
    return _collectionRef.doc(currentUser!.email).collection("items").doc().set(
        {
          "title": widget.recipe.title,
          "description": widget.recipe.description,
          "image": widget.recipe.image,
        }).then((value) => print("Added to cart"));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        brightness: Brightness.light,
        elevation: 0,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: IconButton(
            onPressed: () {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => MenuPage()));
            }, icon: Icon(Icons.arrow_back_ios),
            color: Colors.black,

          ),

        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 16),
            child: IconButton(
              icon: toggle ? Icon(Icons.favorite,color: Color.fromARGB(255, 24, 28, 76),) :Icon(Icons.favorite_border,color: Colors.black,) ,
              onPressed: () {
                setState(() {
                  toggle = !toggle;
                });
              },

            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  buildTextTitleVariation1(widget.recipe.title),
                  SizedBox(height: 10,),
                  buildTextSubTitleVariation1(widget.recipe.description,),

                ],
              ),
            ),


            Container(
              height: 310,
              padding: EdgeInsets.only(left: 16),
              child: Stack(
                children: [


                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [

                      buildTextTitleVariation2('Nutritions', false),

                      // SizedBox(
                      //   height: 16,
                      // ),

                      buildNutrition(widget.recipe.calories, "Calories", "Kcal"),

                      SizedBox(
                        height: 16,
                      ),

                      buildNutrition(widget.recipe.carbo, "Carbo", "g"),

                      SizedBox(
                        height: 16,
                      ),

                      buildNutrition(widget.recipe.protein, "Protein", "g"),

                    ],
                  ),

                  Positioned(
                    top: 65,
                    right: -50,
                    child: Hero(
                      tag: widget.recipe.image,
                      child: Container(
                        height: 210,
                        width: 210,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(100)),
                          image: DecorationImage(
                            image: AssetImage(widget.recipe.image),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ),

                ],
              ),
            ),


            Padding(
              padding: EdgeInsets.only(left: 16, right: 16, bottom: 80),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  buildTextTitleVariation2('Ingredients', false),

                  buildTextSubTitleVariation1("2 Frozen strawberries, divided"),
                  buildTextSubTitleVariation1(
                      "1 tablespoon simple syrup, melted"),
                  buildTextSubTitleVariation1(
                      "1/4 teaspoon ginger beer, plus more"),
                  buildTextSubTitleVariation1(
                      "3 tablespoons fresh lemon juice"),
                  buildTextSubTitleVariation1(
                      "2 tablespoons cherry cocktail syrup"),
                  buildTextSubTitleVariation1("3 ounces tonic water"),

                  SizedBox(height: 16,),

                  buildTextTitleVariation2('Recipe preparation', false),

                  buildTextSubTitleVariation1("STEP 1"),
                  buildTextSubTitleVariation1(
                      "Place mint leaves and lime juice in a glass and muddle them together. Muddling = mushing them up and crushing the leaves to release the flavor and oils the mint. Use a muddler or the handle of a wooden spoon. Or a set of brass knuckles. To each their own. "),

                  buildTextSubTitleVariation1("STEP 2"),
                  buildTextSubTitleVariation1(
                      "Muddle cucumber and honey syrup in the bottom of a cocktail shaker. Add the mango puree and lime juice and shake with ice vigorously. Strain into a copper mug. Top with ginger beer and stir."),

                  buildTextSubTitleVariation1("STEP 3"),
                  buildTextSubTitleVariation1(
                      "Combine Seedlip and cordial in a champagne flute and top with chilled sparkling water."),

                ],
              ),
            ),

          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton.extended(
          onPressed: () => addtocart(),
          backgroundColor: Color.fromARGB(255, 24, 28, 76),
          icon: Icon(
            Icons.shopping_cart,
          ),
          label: Text(
              'Add To Cart',
              style: TextStyle(
                color: Colors.white,
              )
          )),
    );
  }

  Widget buildNutrition(int value, String title, String subTitle) {
    return Container(
      height: 60,
      width: 140,
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.grey[50],
        borderRadius: BorderRadius.all(
          Radius.circular(50),
        ),
        boxShadow: [kBoxShadow],
      ),
      child: Row(
        children: [

          Container(
            height: 44,
            width: 44,
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
              boxShadow: [kBoxShadow],
            ),
            child: Center(
              child: Text(
                value.toString(),
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.pink,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),

          SizedBox(
            width: 20,
          ),

          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              Text(
                title,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),

              Text(
                subTitle,
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey[500],
                ),
              ),

            ],
          ),

        ],
      ),
    );
  }
}