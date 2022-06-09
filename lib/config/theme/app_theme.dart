import 'package:flutter/material.dart';
import 'package:rental_travel_app/core/constants/FontSizeConst.dart';
import 'package:rental_travel_app/core/constants/colorConst.dart';

class AppTheme {
  static get light => ThemeData(
      useMaterial3: true,
      fontFamily: 'Circular Std',
      textTheme:  const TextTheme(
        headline1: TextStyle(color: ColorConst.kPrimaryColor),
        headline3: TextStyle(color: ColorConst.kPrimaryColor),
        headline6: TextStyle(color: ColorConst.black),
        headline5: TextStyle(color: ColorConst.white),
        headline2: TextStyle(
          color: ColorConst.black,
        ),
      ),
      splashColor: ColorConst.kPrimaryColor,
      colorScheme: const ColorScheme.light(
          primary: ColorConst.kPrimaryColor, brightness: Brightness.light));
}
