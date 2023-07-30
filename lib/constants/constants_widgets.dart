import 'package:flutter/material.dart';

const Color kAppBarColor = Color(0xFF03c8f4);
const Color kPrimaryColor = Color(0xFF03A9F4);
const Color kCardColor = Color(0xFFCDDC39);
const Color kActiveLetterColor = Color(0xFF606812);
const Color kInactiveLetterColor = Color(0xFFCDDC39);

ThemeData kHangmanTheme = ThemeData.light().copyWith(
  appBarTheme: const AppBarTheme(
    backgroundColor: kAppBarColor,
  ),
  cardColor: kCardColor,
  primaryColor: kPrimaryColor,
);

const TextStyle kAppBarTextStyle = TextStyle(
fontFamily: 'PressStart2P',
);
