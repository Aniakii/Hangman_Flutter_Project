import 'package:flutter/services.dart' show rootBundle;
import 'package:hangman_flutter_project/constants/constants_files.dart';
import 'categories.dart';
import 'game_data_functions.dart';

class GameDataFromAssets extends GameData {
  late Category chosenCategory;
  late String _fileName;
  List<String> words = [];

  GameDataFromAssets(this.chosenCategory);

  @override
  Future<List<String>> getWords() async {
    _getFileName();
    await loadWords();
    return words;
  }

  @override
  Future<void> loadWords() async {
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
        _fileName = kCountriesBase;
        break;
      case Category.famousCharacters:
        _fileName = kFamousCharactersBase;
        break;
      case Category.fruits:
        _fileName = kFruitsBase;
        break;
      case Category.vegetables:
        _fileName = kVegetablesBase;
        break;
      case Category.sports:
        _fileName = kSportBase;
        break;
      case Category.school:
        _fileName = kSchoolBase;
        break;
      case Category.movies:
        _fileName = kMoviesBase;
        break;
      case Category.professions:
        _fileName = kProfessionsBase;
        break;
      default:
        _fileName = "";
        break;
    }
  }
}
