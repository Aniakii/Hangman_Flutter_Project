import 'package:flutter/material.dart';
import 'screens/categories_screen.dart';
import 'constants/constants.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: kHangmanTheme,
      home: CategoriesScreen(),
    );
  }
}
