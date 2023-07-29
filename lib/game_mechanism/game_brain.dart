import 'package:flutter/material.dart';
import 'categories.dart';
import 'word_to_guess.dart';
import 'game_data.dart';
import 'custom_letter.dart';

enum GameStatus {
  win,
  loose,
  playing,
}

class GameBrain extends ChangeNotifier {
  final List<CustomLetter> alphabetList = List.generate(26, (index) {
    return CustomLetter(String.fromCharCode('A'.codeUnitAt(0) + index));
  });

  int _mistakes = 0;
  GameStatus _gameStatus = GameStatus.playing;
  List<String> _words = [];
  final WordToGuess _wordToGuess = WordToGuess();
  late Category chosenCategory;
  late GameData _gameData;

  String get encryptedWord {
    return _wordToGuess.displayedWord;
  }

  int get mistakes {
    return _mistakes;
  }

  GameStatus get gameStatus {
    return _gameStatus;
  }

  void chooseCategory(Category category) {
    chosenCategory = category;
  }

  Future<void> getData() async {
    _mistakes = 0;
    _gameStatus = GameStatus.playing;
    _gameData = GameData(chosenCategory);
    _words = await _gameData.getWords();
    notifyListeners();
  }

  void drawWord() {
    _wordToGuess.getWord(_words);
  }

  void guessLetter(String letter) {
    if (_gameStatus == GameStatus.playing) {
      if (_wordToGuess.guessLetter(letter)) {
        if (_wordToGuess.word == _wordToGuess.encryptedWord) {
          _gameStatus = GameStatus.win;
        }
      } else {
        _mistakes++;
        if (_mistakes >= 13) {
          _gameStatus = GameStatus.loose;
        }
      }
      notifyListeners();
    }
  }

  void toggleLetter(CustomLetter letter) {
    letter.updateState();
    notifyListeners();
  }

  void resetGame() {
    _mistakes = 0;
    _gameStatus = GameStatus.playing;
    for (CustomLetter letter in alphabetList) {
      if (letter.state == false) {
        letter.updateState();
      }
    }
    drawWord();
    notifyListeners();
  }
}
