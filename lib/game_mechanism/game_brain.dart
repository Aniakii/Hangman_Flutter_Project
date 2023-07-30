import 'package:flutter/material.dart';
import 'dart:math';
import 'categories.dart';
import 'word_to_guess.dart';
import 'game_data_from_assets.dart';
import 'custom_letter.dart';
import 'game_brain_functions.dart';

class GameBrain extends ChangeNotifier with GameBrainFunctionality {
  int _mistakes = 0;
  GameStatus _gameStatus = GameStatus.playing;
  List<String> _words = [];
  final WordToGuess _wordToGuess = WordToGuess();
  late Category _chosenCategory;
  late GameDataFromAssets _gameData;

  String get encryptedWord {
    return _wordToGuess.displayedWord;
  }

  int get mistakes {
    return _mistakes;
  }

  GameStatus get gameStatus {
    return _gameStatus;
  }

  Category get category {
    return _chosenCategory;
  }

  @override
  void chooseCategory(Category category) {
    _chosenCategory = category;
  }

  @override
  Future<void> getData() async {
    _mistakes = 0;
    _gameStatus = GameStatus.playing;
    _gameData = GameDataFromAssets(_chosenCategory);
    _words = await _gameData.getWords();
    notifyListeners();
  }

  @override
  void drawWord() {
    int wordsAmount = _words.length;
    int randomWordIndex = Random().nextInt(wordsAmount);
    _wordToGuess.getWord(_words[randomWordIndex]);
  }

  @override
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

  @override
  void toggleLetter(CustomLetter letter) {
    letter.updateState();
    notifyListeners();
  }

  @override
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
