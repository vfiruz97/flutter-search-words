import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:search_word/common/style.dart';
import 'package:search_word/models/words.dart';
import 'package:search_word/screens/home.dart';
import 'package:search_word/widgets/splash.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => Words(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Search a word',
      theme: defaultTheme,
      home: Scaffold(
        body: SafeArea(
          child: Consumer<Words>(
            builder: (context, words, child) {
              if (words.getState == 'stateLoadedWords') {
                return HomeScreen(
                  model: words,
                );
              }
              return loadingSplash();
            },
          ),
        ),
      ),
    );
  }
}
