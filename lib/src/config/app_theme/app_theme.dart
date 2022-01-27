import 'package:codehub/src/core/constant/app_colors/app_colors.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static final theme = ThemeData(
    primaryColor: primaryColor,
    appBarTheme: AppBarTheme(color: primaryColor, centerTitle: true),
    fontFamily: "vazir",
    snackBarTheme: SnackBarThemeData(
      contentTextStyle: TextStyle(fontFamily: "vazir"),
    ),
  );
}
