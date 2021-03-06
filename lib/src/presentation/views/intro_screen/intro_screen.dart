import 'package:codehub/src/data/datasources/local/storage.dart';
import 'package:codehub/src/core/constant/app_colors/app_colors.dart';
import 'package:codehub/src/core/constant/app_strings/app_strings.dart';
import 'package:codehub/src/injector.dart';
import 'package:codehub/src/presentation/views/home_screen/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({Key? key}) : super(key: key);

  @override
  _IntroScreenState createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  List<PageViewModel> pages = [
    PageViewModel(
      title: introTitle1,
      body: introBody1,
      image: Center(
        child: Image.asset(
          "assets/images/open_source.png",
          width: 170,
        ),
      ),
    ),
    PageViewModel(
      title: introTitle2,
      body: introBody2,
      image: Center(
        child: Image.asset(
          "assets/images/support.png",
          width: 170,
        ),
      ),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IntroductionScreen(
        color: primaryColor,
        pages: pages,
        onDone: () {
          getIt<Storage>().writeIntroState();
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => HomeScreen(),
            ),
          );
        },
        dotsDecorator: const DotsDecorator(
          activeColor: primaryColor,
        ),
        showSkipButton: true,
        showNextButton: false,
        skip: const Text(skipBtn),
        done: const Text(doneBtn),
      ),
    );
  }
}
