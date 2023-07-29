import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'screens/categories_screen.dart';
import 'screens/game_screen.dart';
import 'screens/loading_screen.dart';
import 'constants/constants.dart';
import 'game_mechanism/game_brain.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => GameBrain(),
      child: MaterialApp(
        theme: kHangmanTheme,
        initialRoute: CategoriesScreen.id,
        routes: {
          CategoriesScreen.id: (context) => CategoriesScreen(),
          GameScreen.id: (context) => GameScreen(),
          LoadingScreen.id: (context) => LoadingScreen(),
        },
      ),
    );
  }
}
