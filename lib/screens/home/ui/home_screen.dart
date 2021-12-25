import 'package:codehub/constant/app_colors/app_colors.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      drawer: customDrawer(),
    );
  }

  Widget customDrawer() {
    var size = MediaQuery.of(context).size;
    return Container(
      decoration: BoxDecoration(
        color: drawerColor,
        borderRadius: BorderRadius.horizontal(left: Radius.circular(30)),
      ),
      width: size.width * .7,
      height: size.height,
      child: Container(),
    );
  }
}
