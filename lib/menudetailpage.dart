import 'package:flutter/material.dart';

// class Menupage extends StatelessWidget {
//   // final image, name, rating, detail;
//   // Menupage({this.image, this.name, this.detail, this.rating});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.white,
//         elevation: 0.0,
//         centerTitle: true,
//         leading: IconButton(
//           icon: Icon(Icons.arrow_back, color: Color(0xFF545D68)),
//           onPressed: () {
//             Navigator.of(context).pop();
//           },
//         ),
//         title: Text('Pickup',
//             style: TextStyle(
//                 // fontFamily: 'Dancing Script',
//                 fontSize: 20.0,
//                 color: Color(0xFF545D68))),
//         actions: <Widget>[
//           IconButton(
//             icon: Icon(Icons.notifications_none, color: Color(0xFF545D68)),
//             onPressed: () {},
//           ),
//         ],
//       ),
//       body: ListView(children: [
//         SizedBox(height: 15.0),
//         Padding(
//           padding: EdgeInsets.only(left: 80.0),
//           child: Text(name,
//               style: TextStyle(
//                   fontFamily: 'Dancing Script',
//                   fontSize: 42.0,
//                   fontWeight: FontWeight.bold,
//                   color: Color(0xFFF17532))),
//         ),
//         SizedBox(height: 15.0),
//         Hero(
//             tag: image,
//             child: Image.asset(
//               image,
//               height: 200.0,
//               width: 150.0,
//             )),
//         SizedBox(height: 20.0),
//         Center(
//           child: Text(rating,
//               style: TextStyle(
//                   // fontFamily: 'mojito',
//                   fontSize: 22.0,
//                   fontWeight: FontWeight.bold,
//                   color: Color(0xFFF17532))),
//         ),
//         Text(detail),

//         SizedBox(height: 20.0),

//         // Center(
//         //     child: Container(
//         //   width: MediaQuery.of(context).size.width - 50.0,
//         //   height: 50.0,
//         //   decoration: BoxDecoration(
//         //       borderRadius: BorderRadius.circular(25.0),
//         //       color: Color(0xFFF17532)),
//         // child: Center(
//         //     child: Text(

//         //   'Add to cart',
//         //   style: TextStyle(
//         //       fontFamily: 'Varela',
//         //       fontSize: 14.0,
//         //       fontWeight: FontWeight.bold,
//         //       color: Colors.white),
//         // ))
//         //   ))
//       ]),
//       // floatingActionButton: FloatingActionButton(
//       //   onPressed: () {},
//       //   backgroundColor: Color(0xFFF17532),
//       //   child: Icon(Icons.fastfood),
//       // ),
//       // floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
//     );
//   }
// }

class ProductDetailPage extends StatefulWidget {
  @override
  _ProductDetailPageState createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
          icon: Icon(
            Icons.chevron_left,
            size: 40.0,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        backgroundColor: Colors.white,
        title: Text(
          "PRODUCT DETAIL",
          style: TextStyle(
            color: Colors.black,
          ),
        ),
      ),
      body: _buildProductDetailsPage(context),
    );
  }

  _buildProductDetailsPage(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;

    return ListView(
      children: <Widget>[
        Container(
          padding: const EdgeInsets.all(4.0),
          child: Card(
            elevation: 4.0,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                _buildProductImagesWidgets(),
                _buildProductTitleWidget(),
                SizedBox(height: 12.0),
              ],
            ),
          ),
        ),
      ],
    );
  }

  _buildDivider(Size screenSize) {
    return Column(
      children: <Widget>[
        Container(
          color: Colors.grey[600],
          width: screenSize.width,
          height: 0.25,
        ),
      ],
    );
  }

  _buildProductImagesWidgets() {
    TabController imagesController = TabController(length: 3, vsync: this);

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        height: 250.0,
        child: Center(
          child: DefaultTabController(
            length: 3,
            child: Stack(
              children: <Widget>[
                TabBarView(
                  controller: imagesController,
                  children: <Widget>[
                    Image.network(
                      "https://media.istockphoto.com/photos/cold-refreshing-summer-lemonade-mojito-picture-id624085356?k=20&m=624085356&s=612x612&w=0&h=9l9U95KW9hrdV-GO02zLVJiqt5U0vGoTAC35PSVdmwo=",
                    ),
                    Image.network(
                      "data:image/jpeg;base64,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",
                    ),
                    Image.network(
                      "https://watermark.lovepik.com/photo/20211124/large/lovepik-summer-ice-cream-mojito-cocktail-picture_500956785.jpg",
                    ),
                  ],
                ),
                Container(
                  alignment: FractionalOffset(0.5, 0.95),
                  child: TabPageSelector(
                    controller: imagesController,
                    selectedColor: Colors.grey,
                    color: Colors.white,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  _buildProductTitleWidget() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      child: Center(
        child: Text(
          //name,
          "mojito",
          style: TextStyle(fontSize: 16.0, color: Colors.black),
        ),
      ),
    );
  }
}
