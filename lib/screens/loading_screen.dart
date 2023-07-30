import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:provider/provider.dart';
import 'package:hangman_flutter_project/screens/game_screen.dart';
import 'package:hangman_flutter_project/game_mechanism/game_brain.dart';
import 'package:hangman_flutter_project/constants/constants_widgets.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({super.key});
  static const id = 'loading_screen';

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
    loadGame().then((_) {
      Navigator.pushNamed(context, GameScreen.id);
    }).catchError((e) {
      print(e);
    });
  }

  Future<void> loadGame() async {
    await Provider.of<GameBrain>(context, listen: false).getData();
    Provider.of<GameBrain>(context, listen: false).drawWord();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: DefaultTextStyle(
          style: kAppBarTextStyle,
          child: AnimatedTextKit(
            repeatForever: true,
            animatedTexts: [
              TypewriterAnimatedText('LOADING...'),
            ],
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            DefaultTextStyle(
              style: const TextStyle(
                  fontFamily: 'PressStart2P', color: Colors.black),
              child: AnimatedTextKit(
                repeatForever: true,
                animatedTexts: [
                  ScaleAnimatedText('Loading game...'),
                  ScaleAnimatedText('Wait a moment...'),
                ],
              ),
            ),
            const SizedBox(height: 30.0),
            const SpinKitFadingCircle(
              color: kCardColor,
              size: 100.0,
            ),
          ],
        ),
      ),
    );
  }
}
