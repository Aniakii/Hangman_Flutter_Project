import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:hangman_flutter_project/game_mechanism/game_brain.dart';
import 'package:hangman_flutter_project/game_mechanism/custom_letter.dart';
import 'package:hangman_flutter_project/constants/constants.dart';
import 'end_game_alert.dart';

class LetterButton extends StatelessWidget {
  final CustomLetter customLetter;

  LetterButton({required this.customLetter});

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: () {
          if (customLetter.state == true) {
            Provider.of<GameBrain>(context, listen: false)
                .toggleLetter(customLetter);
            Provider.of<GameBrain>(context, listen: false)
                .guessLetter(customLetter.letter);
            if (Provider.of<GameBrain>(context, listen: false).gameStatus ==
                GameStatus.win) {
              EndGameAlert(
                title: "YOU WON!",
                description: "Congrats! Do you want to play again?",
                picture: 'king.png',
              ).showAlert(context);
            } else if (Provider.of<GameBrain>(context, listen: false)
                    .gameStatus ==
                GameStatus.loose) {
              EndGameAlert(
                title: "YOU LOST :(",
                description:
                    "Next time it will be better! Do you want to play again?",
                picture: 'game_over.png',
              ).showAlert(context);
            }
          }
        },
        child: Text(
          customLetter.letter,
          textAlign: TextAlign.center,
          style: TextStyle(
              color: customLetter.state == true
                  ? kActiveLetterColor
                  : kInactiveLetterColor),
        ));
  }
}
