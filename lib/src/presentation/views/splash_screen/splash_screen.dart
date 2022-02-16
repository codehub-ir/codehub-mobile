import 'package:codehub/src/presentation/blocs/splash_bloc/splash_bloc.dart';
import 'package:codehub/src/presentation/widgets/custom_indicators.dart';
import 'package:codehub/src/injector.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../home_screen/home_screen.dart';
import '../intro_screen/intro_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late SplashBloc _splashBloc;

  @override
  void initState() {
    _splashBloc = SplashBloc(getIt())..add(SplashPageOpened());
    super.initState();
  }

  @override
  void dispose() {
    _splashBloc.close();
    super.dispose();
  }

  expandedTile(flex) => Expanded(
      flex: flex,
      child: const SizedBox(
        height: 1,
      ));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener(
        bloc: _splashBloc,
        listener: (context, state) {
          if (state is ShowIntroPage) {
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => const IntroScreen(),
                ));
          } else {
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => const HomeScreen(),
                ));
          }
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            expandedTile(2),
            Center(
              child: Image.asset(
                'assets/images/logo.png',
                width: 150,
              ),
            ),
            expandedTile(2),
            const CustomIndicators(),
            expandedTile(1),
          ],
        ),
      ),
    );
  }
}
