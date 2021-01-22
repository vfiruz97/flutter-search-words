import 'package:flutter/material.dart';

InputDecoration get inputDecoration => const InputDecoration(
      hintText: 'search',
      contentPadding: EdgeInsets.symmetric(horizontal: 15.0),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(width: 1.0),
        borderRadius: BorderRadius.zero,
      ),
    );

ThemeData get defaultTheme => ThemeData(
      primarySwatch: Colors.blue,
    );
