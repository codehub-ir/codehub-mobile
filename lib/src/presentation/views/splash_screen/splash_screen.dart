import 'package:codehub/src/presentation/blocs/splash_bloc/splash_bloc.dart';
import 'package:codehub/src/presentation/views/home_screen/home_screen.dart';
import 'package:codehub/src/presentation/views/intro_screen/intro_screen.dart';
import 'package:codehub/src/presentation/widgets/custom_indicators.dart';
import 'package:codehub/src/data/datasources/local/storage.dart';
import 'package:codehub/src/injector.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  expandedTile(flex) => Expanded(
      flex: flex,
      child: const SizedBox(
        height: 1,
      ));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => SplashBloc(getIt())..add(SplashPageOpened()),
        child: BlocListener<SplashBloc, SplashState>(
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
      ),
    );
  }
}
