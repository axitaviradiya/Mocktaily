import 'package:flutter/material.dart';
import 'mainhome.dart';
import 'menucon.dart';
import 'menudetail.dart';
import 'package:flutter/cupertino.dart';
import 'cart.dart';


class MenuPage extends StatefulWidget {
  const MenuPage({Key? key}) : super(key: key);

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {

  bool toggle = false;
  List<bool> optionselected = [true, false, false, false];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        brightness: Brightness.light,
        elevation: 0,
        leading: Icon(
          Icons.sort,
          color: Colors.black,
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 16),
            child: IconButton(
              onPressed: () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Cart()));
              },
              icon: Icon(Icons.shopping_cart,

                color: Colors.black,
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [


            SizedBox(
              height: 24,
            ),

            Container(
              height: 350,
              child: ListView(
                physics: BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                children: buildRecipes(),
              ),
            ),

            SizedBox(
              height: 16,
            ),


            Container(
              height: 190,
              child: PageView(
                physics: BouncingScrollPhysics(),
                children: buildPopulars(),
              ),
            ),

          ],
        ),
      ),
    );
  }


  List<Widget> buildRecipes() {
    List<Widget> list = [];
    for (var i = 0; i < getRecipes().length; i++) {
      list.add(buildRecipe(getRecipes()[i], i));
    }
    return list;
  }

  Widget buildRecipe(Recipe recipe, int index) {
    return GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Detail(recipe: recipe)),
          );
        },
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(
              Radius.circular(20),
            ),
            // boxShadow: [kBoxShadow],
          ),
          margin: EdgeInsets.only(
              right: 16, left: index == 0 ? 16 : 0, bottom: 16, top: 8),
          padding: EdgeInsets.all(16),
          width: 220,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[

          Expanded(

          child: Hero(

            tag: recipe.image,

            child: Container(
              height: 100,
              width: 100,

              decoration: BoxDecoration(

                borderRadius: BorderRadius.all(Radius.circular(80)),
                image: DecorationImage(

                  image: AssetImage(recipe.image,),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ),

        SizedBox(
          height: 8,
        ),

        buildRecipeTitle(recipe.title),

        buildTextSubTitleVariation2(recipe.description),

        Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [

            buildCalories(recipe.calories.toString() + " Kcal"),

              IconButton(
                icon: toggle ? Icon(Icons.favorite,color: Color.fromARGB(255, 24, 28, 76),) :Icon(Icons.favorite_border,color: Colors.black,) ,
                onPressed: () {
                  setState(() {
                    toggle = !toggle;
                  });
                },

              ),


    ],
    ),

    ],
    ),
    )
    ,
    );
  }

  List<Widget> buildPopulars() {
    List<Widget> list = [];
    for (var i = 0; i < getRecipes().length; i++) {
      list.add(buildPopular(getRecipes()[i]));
    }
    return list;
  }

  Widget buildPopular(Recipe recipe) {
    return Container(
      margin: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(
          Radius.circular(20),
        ),
        // boxShadow:[kBoxShadow],
      ),
      child: Row(
        children: [

          Container(
            margin: EdgeInsets.only(left: 15),
            height: 100,
            width: 100,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(250)),
              image: DecorationImage(

                image: AssetImage(recipe.image),
                fit: BoxFit.cover,
              ),
            ),
          ),

          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                  buildRecipeTitle(recipe.title,
                  ),

                  buildRecipeSubTitle(recipe.description),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [

                      buildCalories(recipe.calories.toString() + " Kcal"),

                      IconButton(
                        icon: toggle ? Icon(Icons.favorite,color: Color.fromARGB(255, 24, 28, 76),) :Icon(Icons.favorite_border,color: Colors.black,) ,
                        onPressed: () {
                          setState(() {
                            toggle = !toggle;
                          });
                        },

                      ),
                    ],
                  ),

                ],
              ),
            ),
          ),

        ],
      ),
    );
  }
}

// Widget option(int index) {
//   var optionselected;
//   return GestureDetector(
//     // onTap: () {
//     //   setState(() {
//     //
//     //     optionselected[index] = !optionselected[index];
//     //   });
//     // },
//     child: Container(
//       height: 40,
//       decoration: BoxDecoration(
//         color: optionselected[index] ? kPrimaryColor :  Colors.grey[500],
//         borderRadius: BorderRadius.all(
//           Radius.circular(10),
//         ),
//         // boxShadow: [kBoxShadow],
//       ),
//       padding: EdgeInsets.symmetric(horizontal: 12),
//       child: Row(
//         children: [
//           Icon(Icons.favorite_border,)
//
//         ],
//       ),
//
//     ),
//
//
//   );
// }
//
//
// Color kPrimaryColor = Color.fromARGB(255, 24, 28, 76);
//
// BoxShadow kBoxShaw = BoxShadow(
//   color: Colors.grey.withOpacity(0.2),
//   spreadRadius: 2,
//   blurRadius: 8,
//   offset: Offset(0, 0),
// );
//
//
//
//



