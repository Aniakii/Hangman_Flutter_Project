import 'package:flutter/services.dart' show rootBundle;
import 'categories.dart';

class GameData {
  late Category chosenCategory;
  late String _fileName;
  List<String> words = [];

  GameData(this.chosenCategory);

  Future<List<String>> getWords() async {
    _getFileName();
    await _loadWords();
    return words;
  }

  Future<void> _loadWords() async {
    try {
      String filePath = 'assets/words_base/$_fileName';
      String fileContent = await rootBundle.loadString(filePath);
      words = fileContent.split('\n');
    } catch (e) {
      print(e);
    }
  }

  void _getFileName() {
    switch (chosenCategory) {
      case Category.countries:
        _fileName = "countries.txt";
        break;
      case Category.famousCharacters:
        _fileName = "famous_characters.txt";
        break;
      case Category.fruits:
        _fileName = "fruits.txt";
        break;
      case Category.vegetables:
        _fileName = "vegetables.txt";
        break;
      case Category.sports:
        _fileName = "sports.txt";
        break;
      case Category.school:
        _fileName = "school.txt";
        break;
      case Category.movies:
        _fileName = "movies.txt";
        break;
      case Category.professions:
        _fileName = "professions.txt";
        break;
      default:
        _fileName = "";
        break;
    }
  }
}
