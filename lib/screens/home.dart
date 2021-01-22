import 'package:flutter/material.dart';
import 'package:search_word/common/style.dart';
import 'package:search_word/models/words.dart';
import 'package:search_word/widgets/word_list.dart';

class HomeScreen extends StatefulWidget {
  final Words model;

  HomeScreen({this.model});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<String> items;

  @override
  void initState() {
    super.initState();
    items = widget.model.getWords;
  }

  void searchWord(value) {
    setState(() {
      if (value.isEmpty) {
        items = widget.model.getWords;
      } else {
        widget.model.searchWord(value.toLowerCase()).then((searchItems) {
          items = searchItems;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          TextField(
            autofocus: true,
            decoration: inputDecoration,
            onChanged: (value) => searchWord(value),
          ),
          Expanded(
            child: WordList(
              words: items,
            ),
          )
        ],
      ),
    );
  }
}
