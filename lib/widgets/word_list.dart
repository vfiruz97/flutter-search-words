import 'package:flutter/material.dart';

class WordList extends StatelessWidget {
  final List<String> words;

  WordList({this.words});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: words.length,
      itemBuilder: (context, index) {
        return _drawListTile(words[index]);
      },
    );
  }

  Widget _drawListTile(String title) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 15.0,
            vertical: 8.0,
          ),
          child: Text("$title"),
        ),
        Divider()
      ],
    );
  }
}
