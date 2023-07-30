class WordToGuess {
  String word = "";
  String encryptedWord = "";
  String displayedWord = "";

  void getWord(String word) {
    this.word = word;
    encryptedWord = word.replaceAll(RegExp(r'[a-zA-Z]'), '_');
    displayedWord = encryptedWord.split('').join(' ');
  }

  bool guessLetter(String letter) {
    if (!word.contains(letter)) {
      return false;
    }
    for (int i = 0; i < word.length; i++) {
      if (word[i] != letter) {
        continue;
      }
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
    displayedWord = encryptedWord.split('').join(' ');
    return true;
  }
}
