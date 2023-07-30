import 'custom_letter.dart';
import 'categories.dart';

enum GameStatus {
  win,
  loose,
  playing,
}

mixin GameBrainFunctionality {
  final List<CustomLetter> alphabetList = List.generate(26, (index) {
    return CustomLetter(String.fromCharCode('A'.codeUnitAt(0) + index));
  });

  void chooseCategory(Category category) {}

  Future<void> getData() async {}

  void drawWord() {}

  void guessLetter(String letter) {}

  void toggleLetter(CustomLetter letter) {}

  void resetGame() {}
}
