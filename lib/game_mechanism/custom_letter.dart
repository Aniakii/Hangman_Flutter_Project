class CustomLetter {
  late final String letter;
  bool _state = true;

  CustomLetter(this.letter);

  bool get state {
    return _state;
  }

  void updateState() {
    _state = !_state;
  }
}
