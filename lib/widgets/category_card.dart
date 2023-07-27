import 'package:flutter/material.dart';

class CategoryCard extends StatelessWidget {
  final String picture;
  final String title;

  CategoryCard({required this.title, required this.picture});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Card(
        elevation: 10.0,
        // color: kCardColor,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image(
              image: AssetImage('assets/images/$picture'),
              height: 50.0,
              width: 50.0,
            ),
            const SizedBox(
              height: 10.0,
            ),
            Text(
              title,
              textAlign: TextAlign.center,
              style:
                  const TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
