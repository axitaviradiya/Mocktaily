// import 'package:flutter/material.dart';
//
// class Rcard extends StatelessWidget {
//   final String image;
//
//   final String name;
//   final String rating;
//   final String detail;
//   Rcard({
//     required this.image,
//     required this.name,
//     required this.rating,
//     required this.detail,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: EdgeInsets.only(left: 20, bottom: 20),
//       child: Container(
//         height: 80,
//         width: 150,
//         padding: EdgeInsets.all(20),
//         decoration: BoxDecoration(
//           color: Colors.white,
//           borderRadius: BorderRadius.circular(12),
//         ),
//         child: Column(
//           children: [
//             ClipRRect(
//               borderRadius: BorderRadius.circular(50),
//               child: SizedBox.fromSize(
//                 size: Size.fromRadius(48),
//                 child: Image.asset(
//                   image,
//                   height: 130.0,
//                   // width: 100,
//                   fit: BoxFit.cover,
//                 ),
//               ),
//             ),
//             SizedBox(
//               height: 5,
//             ),
//             Text(
//               name,
//               style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
//             ),
//             Text(
//               detail,
//               style: TextStyle(color: Colors.grey),
//             ),
//             Row(
//               // crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                 Padding(padding: EdgeInsets.only(left: 10, right: 21)),
//                 Icon(
//                   Icons.star,
//                   color: Colors.indigo[800],
//                 ),
//                 Text(
//                   rating,
//                   style: TextStyle(color: Colors.grey),
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
