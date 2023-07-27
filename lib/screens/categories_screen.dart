import 'package:flutter/material.dart';
import 'package:hangman_flutter_project/widgets/category_card.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: DefaultTextStyle(
          style: const TextStyle(
            fontFamily: 'PressStart2P',
          ),
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
          ),
          CategoryCard(
            title: 'VEGETABLES',
            picture: 'carrot.png',
          ),
          CategoryCard(
            title: 'SCHOOL',
            picture: 'school.png',
          ),
          CategoryCard(
            title: 'COUNTRIES',
            picture: 'countries.png',
          ),
          CategoryCard(
            title: 'SPORTS',
            picture: 'sport.png',
          ),
          CategoryCard(
            title: 'MOVIES',
            picture: 'movie.png',
          ),
          CategoryCard(
            title: 'FAMOUS CHARACTERS',
            picture: 'actor.png',
          ),
          CategoryCard(
            title: 'PROFESSIONS',
            picture: 'profession.png',
          ),
        ],
      ),
    );
  }
}

// const Row(
// crossAxisAlignment: CrossAxisAlignment.stretch,
// children: [
// Expanded(
// child: Column(
// children: [
// Expanded(child: CategoryCard()),
// Expanded(child: CategoryCard()),
// ],
// ),
// ),
// Expanded(
// child: Column(
// children: [
// Expanded(child: CategoryCard()),
// Expanded(child: CategoryCard()),
// ],
// ),
// )
// ],
// ),
