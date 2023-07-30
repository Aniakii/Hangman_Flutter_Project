import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:hangman_flutter_project/game_mechanism/game_brain.dart';
import 'package:hangman_flutter_project/game_mechanism/game_brain_functions.dart';
import 'package:hangman_flutter_project/game_mechanism/custom_letter.dart';
import 'package:hangman_flutter_project/constants/constants_widgets.dart';
import 'package:hangman_flutter_project/constants/constants_alerts_texts.dart';
import 'package:hangman_flutter_project/constants/constants_images.dart';
import 'end_game_alert.dart';

class LetterButton extends StatelessWidget {
  final CustomLetter customLetter;

  LetterButton({required this.customLetter});

  @override
  Widget build(BuildContext context) {
    void onPressedCallback() {
      if (customLetter.state == true) {
        Provider.of<GameBrain>(context, listen: false)
            .toggleLetter(customLetter);
        Provider.of<GameBrain>(context, listen: false)
            .guessLetter(customLetter.letter);
        if (Provider.of<GameBrain>(context, listen: false).gameStatus ==
            GameStatus.win) {
          EndGameAlert(
            title: kWinTitle,
            description: kWinDescription,
            picture: kWinImage,
          ).showAlert(context);
        } else if (Provider.of<GameBrain>(context, listen: false).gameStatus ==
            GameStatus.loose) {
          EndGameAlert(
            title: kLooseTitle,
            description: kLooseDescription,
            picture: kLooseImage,
          ).showAlert(context);
        }
      }
    }

    return TextButton(
        onPressed: onPressedCallback,
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
