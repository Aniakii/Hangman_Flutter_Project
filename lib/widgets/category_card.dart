import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:hangman_flutter_project/screens/loading_screen.dart';
import 'package:hangman_flutter_project/game_mechanism/categories.dart';
import 'package:hangman_flutter_project/game_mechanism/game_brain.dart';

class CategoryCard extends StatelessWidget {
  final String picture;
  final String title;
  final Category category;

  CategoryCard({
    required this.title,
    required this.picture,
    required this.category,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Card(
        elevation: 10.0,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image(
                image: AssetImage('assets/images/categories_pictures/$picture'),
                height: 50.0,
                width: 50.0,
              ),
              const SizedBox(
                height: 10.0,
              ),
              FittedBox(
                fit: BoxFit.scaleDown,
                child: Text(
                  title,
                  softWrap: true,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      fontSize: 20.0, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
      ),
      onTap: () {
        Provider.of<GameBrain>(context, listen: false).chooseCategory(category);
        Navigator.pushNamed(context, LoadingScreen.id);
      },
    );
  }
}
