import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:hangman_flutter_project/widgets/category_card.dart';
import 'package:hangman_flutter_project/game_mechanism/categories.dart';
import 'package:hangman_flutter_project/constants/constants.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  static const String id = 'categories_screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: DefaultTextStyle(
          style: kAppBarTextStyle,
          child: AnimatedTextKit(
            repeatForever: true,
            animatedTexts: [
              RotateAnimatedText('H A N G M A N', transitionHeight: 25.0),
              RotateAnimatedText('CHOOSE CATEGORY:', transitionHeight: 25.0)
            ],
          ),
        ),
      ),
      body: GridView.count(
        padding: const EdgeInsets.all(10),
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        children: [
          CategoryCard(
            title: 'FRUITS',
            picture: 'strawberry.png',
            category: Category.fruits,
          ),
          CategoryCard(
            title: 'VEGETABLES',
            picture: 'carrot.png',
            category: Category.vegetables,
          ),
          CategoryCard(
            title: 'SCHOOL',
            picture: 'school.png',
            category: Category.school,
          ),
          CategoryCard(
            title: 'COUNTRIES',
            picture: 'countries.png',
            category: Category.countries,
          ),
          CategoryCard(
            title: 'SPORTS',
            picture: 'sport.png',
            category: Category.sports,
          ),
          CategoryCard(
            title: 'MOVIES',
            picture: 'movie.png',
            category: Category.movies,
          ),
          CategoryCard(
            title: 'FAMOUS CHARACTERS',
            picture: 'actor.png',
            category: Category.famousCharacters,
          ),
          CategoryCard(
            title: 'PROFESSIONS',
            picture: 'profession.png',
            category: Category.professions,
          ),
        ],
      ),
    );
  }
}
