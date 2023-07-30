import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:hangman_flutter_project/screens/categories_screen.dart';
import 'package:hangman_flutter_project/game_mechanism/game_brain.dart';
import 'package:hangman_flutter_project/constants/constants_widgets.dart';
import 'package:hangman_flutter_project/constants/constants_alerts_texts.dart';

class EndGameAlert extends StatelessWidget {
  final String title;
  final String description;
  final String picture;

  EndGameAlert({
    required this.title,
    required this.description,
    required this.picture,
  });

  void showAlert(BuildContext context) {
    Alert(
      context: context,
      title: title,
      desc: description,
      image: Image.asset('assets/images/end_game_pictures/$picture'),
      buttons: [
        DialogButton(
            color: kAppBarColor,
            child: const Text(
              kPlayText,
              textAlign: TextAlign.center,
            ),
            onPressed: () {
              Provider.of<GameBrain>(context, listen: false).resetGame();
              Navigator.pop(context);
            }),
        DialogButton(
            color: kAppBarColor,
            child: const Text(
              kMenuText,
              textAlign: TextAlign.center,
            ),
            onPressed: () {
              Provider.of<GameBrain>(context, listen: false).resetGame();
              Navigator.popUntil(
                  context, ModalRoute.withName(CategoriesScreen.id));
            }),
      ],
    ).show();
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
