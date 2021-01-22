import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

class Words extends ChangeNotifier {
  String state = '';
  List<String> _items = [];
  static final Words _words = Words._internal();

  factory Words() {
    return _words;
  }

  Words._internal() {
    parseWords();
  }

  String get getState => state;
  List<String> get getWords => _items;

  Future<String> _loadWords() async {
    return await rootBundle.loadString('assets/files/words.txt');
  }

  Future parseWords() async {
    await _loadWords().then((value) {
      _items = value.toString().split('\n');
      state = "stateLoadedWords";
      notifyListeners();
    });
  }

  Future<List<String>> searchWord(String search) async {
    List<String> _searchList = [];

    for (int i = 0; i < _items.length; i++) {
      if (_items[i].toLowerCase().startsWith(search))
        _searchList.add(_items[i]);
    }

    return _searchList;
  }
}
