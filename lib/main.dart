import 'package:codehub/src/config/app_theme/app_theme.dart';
import 'package:codehub/src/core/utils/size_config/size_config.dart';
import 'package:codehub/src/presentation/views/register_screen/splash_screen.dart';
import 'package:codehub/src/injector.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'src/core/constant/app_strings/app_strings.dart';

void main() async {
  serviceLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) => OrientationBuilder(
        builder: (context, orientation) {
          SizeConfig().init(constraints, orientation);
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: appTitle,
            theme: AppTheme.theme,
            localizationsDelegates: const [
              GlobalCupertinoLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
            ],
            supportedLocales: const [
              Locale("fa", "IR"),
              // OR Locale('ar', 'AE') OR Other RTL locales
            ],
            locale: const Locale("fa", "IR"),
            home: const SplashScreen(),
          );
        },
      ),
    );
  }
}
