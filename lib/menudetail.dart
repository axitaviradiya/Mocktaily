import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

buildTextTitleVariation1(String text){
  return Padding(
    padding: EdgeInsets.only(bottom: 8),
    child: Text(
      text,
      style: GoogleFonts.breeSerif(
        fontSize: 36,
        fontWeight: FontWeight.w900,
        color: Colors.black,
      ),
    ),
  );
}

buildTextTitleVariation2(String text, bool opacity){
  return Padding(
    padding: EdgeInsets.only(bottom: 16),
    child: Text(
      text,
      style: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.bold,
        color: opacity ? Colors.grey[400] : Colors.black,
      ),
    ),
  );
}

buildTextSubTitleVariation1(String text){
  return Padding(
    padding: EdgeInsets.only(bottom: 8),
    child: Text(
      text,
      style: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
        color: Colors.grey[600],
      ),
    ),
  );
}

buildTextSubTitleVariation2(String text){
  return Padding(
    padding: EdgeInsets.only(bottom: 8),
    child: Text(
      text,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(
        fontSize: 16,
        color: Colors.grey[600],
      ),
    ),
  );
}

buildRecipeTitle(String text){
  return Padding(
    padding: EdgeInsets.only(bottom: 8),
    child: Text(
      text,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(
        fontSize: 22,
        fontWeight: FontWeight.bold,
      ),
    ),
  );
}

buildRecipeSubTitle(String text){
  return Padding(
    padding: EdgeInsets.only(bottom: 16),
    child: Text(
      text,
      style: TextStyle(
        fontSize: 16,
        color: Colors.grey[600],
        fontWeight: FontWeight.bold,
      ),
    ),
  );
}

buildCalories(String text){
  return Text(
    text,
    style: TextStyle(
      fontSize: 16,
      color: Colors.black,
      fontWeight: FontWeight.bold,
    ),
  );
}




class Recipe {

  String title;
  String description;

  String image;
  int calories;
  int carbo;
  int protein;

  Recipe(this.title, this.description, this.image, this.calories, this.carbo, this.protein);

}

List<Recipe> getRecipes(){
  return <Recipe>[
    Recipe("Virgin Mojito","Price: 150", "assets/images/j6.jpg", 250, 35, 6),
    Recipe("Shirly Temple","Price: 180","assets/images/j2.jpg" , 200, 45, 10),
    Recipe("Alcoholic Mimosa", "Price: 160", "assets/images/j3.jpg", 150, 30, 8),
    Recipe("Non Alcoholic Sangria","Price: 140","assets/images/j4.jpg", 190, 35, 12),
    Recipe("Virgin Margarita","Price: 120","assets/images/j5.jpg", 250, 55, 20),
  ];
}
Color kPrimaryColor = Color(0xFF27AE60);

BoxShadow kBoxShadow = BoxShadow(
  color: Colors.grey.withOpacity(0.2),
  spreadRadius: 2,
  blurRadius: 8,
  offset: Offset(0, 0),
);