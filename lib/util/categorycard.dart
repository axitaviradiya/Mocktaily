import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:matcher/matcher.dart';

class CategoryCard extends StatelessWidget {
  final iconiamgepath;
  final String categoryname;

  CategoryCard({required this.iconiamgepath, required this.categoryname});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25.0),
      child: Container(
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Color.fromARGB(255, 247, 204, 219),
        ),
        child: Row(
          children: [
            Image.asset(
              iconiamgepath,
              height: 30,
            ),
            SizedBox(width: 10),
            Text(categoryname),
          ],
        ),
      ),
    );
  }
}

