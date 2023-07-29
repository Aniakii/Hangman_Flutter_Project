import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:provider/provider.dart';
import 'package:hangman_flutter_project/screens/categories_screen.dart';
import 'package:hangman_flutter_project/game_mechanism/game_brain.dart';
import 'package:hangman_flutter_project/widgets/letter_button.dart';
import 'package:hangman_flutter_project/constants/constants.dart';

class GameScreen extends StatefulWidget {
  const GameScreen({super.key});

  static const String id = 'game_screen';

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  @override
  Widget build(BuildContext context) {
    int mistakes = Provider.of<GameBrain>(context, listen: false).mistakes;

    return WillPopScope(
      onWillPop: () async {
        Provider.of<GameBrain>(context, listen: false).resetGame();
        Navigator.popUntil(context, ModalRoute.withName(CategoriesScreen.id));
        return true;
      },
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: DefaultTextStyle(
            style: kAppBarTextStyle,
            child: AnimatedTextKit(
              repeatForever: true,
              animatedTexts: [
                RotateAnimatedText('H A N G M A N', transitionHeight: 25.0),
              ],
            ),
          ),
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: FittedBox(
                fit: BoxFit.scaleDown,
                child: Text(
                  Provider.of<GameBrain>(context, listen: true).encryptedWord,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 50.0,
                  ),
                ),
              ),
            ),
            Expanded(
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Image(
                    image: AssetImage(
                        'assets/images/hangman_pictures/hangman$mistakes.png'),
                  ),
                ),
              ),
            ),
            Wrap(
              spacing: 10.0,
              children: Provider.of<GameBrain>(context)
                  .alphabetList
                  .map((letter) => LetterButton(customLetter: letter))
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }
}
