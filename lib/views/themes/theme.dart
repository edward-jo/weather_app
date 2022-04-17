import 'package:flutter/material.dart';

final ThemeData appTheme = ThemeData(
  /// Typically, only the [brightness], [primaryColor], or [primarySwatch] are
  /// specified. That pair of values are used to construct the [colorScheme].
  brightness: Brightness.light,
  primaryColor: Colors.blue,
  primarySwatch: Colors.blue,
  canvasColor: Colors.white,

  /// If TextField's keyboardAppearance is unset, defaults to
  /// primaryColorBrightness.
  primaryColorBrightness: Brightness.light,

  // -- APP BAR --
  /// All AppBarTheme properties are null by default. When null, the AppBar
  /// compute its own default values, typically based on the overall theme's
  /// ThemeData.colorScheme, ThemeData.textTheme, and ThemeData.iconTheme.
  appBarTheme: const AppBarTheme(
    backgroundColor: Colors.blue,
    foregroundColor: Colors.white,
    elevation: 0,
  ),

  // -- TEXT THEME --
  /// If you specify textTheme in ThemeData() constructor, ThemeData merges it
  /// with defaultTextTheme
  textTheme: const TextTheme(
    bodyText1: TextStyle(fontSize: 16.0), // Material spec 16.0
    bodyText2: TextStyle(fontSize: 16.0), // Material spec 14.0
    caption: TextStyle(fontSize: 15.0),
  ),
);
