import 'package:codehub/global_widgets/custom_indicator/custom_indicators.dart';
import 'package:codehub/screens/intro/ui/intro_screen.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    navigateToNextPage();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  // todo [mahmoud]: move logic to bloc
  // todo [mahmoud]: add onGeneration navigation to application
  navigateToNextPage() async {
    await Future.delayed(const Duration(seconds: 2));
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const IntroScreen(),
        ));
  }

  expandedTile(flex) => Expanded(
      flex: flex,
      child: const SizedBox(
        height: 1,
      ));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
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
    );
  }
}
