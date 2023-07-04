

import 'package:flutter/material.dart';

  final colorList = <Color> [
    Colors.green,
    Colors.blue,
    Colors.red,
    Colors.orange,
    Colors.yellow,
    Colors.brown,
    Colors.purple,
    Colors.teal,
  ];

class AppTheme{

  final int selectedColor;

  AppTheme({
    this.selectedColor = 0
  }): assert(selectedColor >= 0, "Selected color must be greater then 0"),
      assert(selectedColor < colorList.length, 
            "Selected color must be less or equal than ${colorList.length}");

  ThemeData getTheme() => ThemeData(
    useMaterial3: true,
    colorSchemeSeed: colorList[selectedColor],
    appBarTheme: const AppBarTheme(
      centerTitle: false
    )
  );

}