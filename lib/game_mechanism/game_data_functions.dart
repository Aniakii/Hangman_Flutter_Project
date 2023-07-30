abstract class GameData {
  Future<List<String>> getWords();
  Future<void> loadWords();
}
