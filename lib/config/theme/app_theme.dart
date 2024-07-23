import 'package:flutter/material.dart';

final colorsList = <Color>[Colors.black, Colors.white, Colors.red];

class AppTheme {
  final int selectColor;

  AppTheme({required this.selectColor})
      : assert(selectColor >= 0,
            'Eliga un numero más alto que ${colorsList.length}'),
        assert(selectColor <= colorsList.length,
            'Eliga un numero más bajo que ${colorsList.length - 1}');

  ThemeData getTheme() {
    return ThemeData(
        colorSchemeSeed: colorsList[selectColor],
        appBarTheme: const AppBarTheme(centerTitle: false));
  }
}
