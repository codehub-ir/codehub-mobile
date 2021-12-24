import 'package:codehub/constant/app_strings/app_strings.dart';
import 'package:codehub/constant/app_theme/app_theme.dart';
import 'package:codehub/screens/splash/ui/splash_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: appTitle,
      theme: AppTheme.theme,
      home: const SplashScreen(),
    );
  }
}
