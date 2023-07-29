import 'dart:math';

class WordToGuess {
  String word = "";
  String encryptedWord = "";
  String displayedWord = "";

  void getWord(List<String> words) {
    int wordsAmount = words.length;
    int randomWordIndex = Random().nextInt(wordsAmount);
    word = words[randomWordIndex];
    encryptedWord = word.replaceAll(RegExp(r'[a-zA-Z]'), '_');
    displayedWord = encryptedWord.split('').join(' ');
  }

  bool guessLetter(String letter) {
    if (word.contains(letter)) {
      for (int i = 0; i < word.length; i++) {
        if (word[i] == letter) {
          if (i == 0) {
            encryptedWord = letter + encryptedWord.substring(1);
          } else if (i == word.length - 1) {
            encryptedWord = encryptedWord.substring(0, i) + letter;
          } else {
            encryptedWord = encryptedWord.substring(0, i) +
                letter +
                encryptedWord.substring(i + 1);
          }
        }
      }
      displayedWord = encryptedWord.split('').join(' ');
      return true;
    } else {
      return false;
    }
  }
}
