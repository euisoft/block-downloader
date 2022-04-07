import 'package:block_downloader/styles/colors.dart';
import 'package:flutter/material.dart';

const defaultSpacing = 8.0;

double spacing([double times = 1]) => times * defaultSpacing;

ThemeData createTheme(Brightness brightness) {
  ThemeData currentThemeData = ThemeData(brightness: brightness);

  return currentThemeData.copyWith(
    colorScheme: currentThemeData.colorScheme.copyWith(
      primary: red,
      secondary: red,
    ),
  );
}
