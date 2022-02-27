import 'package:codehub/src/core/constant/app_colors/app_colors.dart';
import 'package:codehub/src/core/constant/app_strings/app_strings.dart';
import 'package:codehub/src/core/constant/app_styles/app_styles.dart';
import 'package:codehub/src/core/utils/custom_url_launcher/custom_url_launcher.dart';
import 'package:codehub/src/presentation/views/development_screen/development_screen.dart';
import 'package:codehub/src/presentation/views/event_screen/event_screen.dart';
import 'package:codehub/src/presentation/views/login_screen/login_screen.dart';
import 'package:codehub/src/presentation/views/new_snippet_screen/new_snippet_screen.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(homeTitle),
        centerTitle: true,
      ),
      drawer: customDrawer(),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 20.0),
          child: Column(
            children: [
              Center(
                child: Text(
                  homeContentTitle,
                  style: titleBoldStyle,
                ),
              ),
              sizedBox(),
              Text(
                homeContentDescription,
                style: bodyStyle,
              ),
              sizedBox(),
              Image.asset(
                'assets/images/django.png',
                width: 110,
              ),
              Center(
                child: Text(
                  "+",
                  style: titleBoldStyle,
                ),
              ),
              sizedBox(),
              Image.asset(
                'assets/images/flutter.png',
                width: 90,
              ),
              sizedBox(),
              Center(
                child: Text(
                  "=",
                  style: titleBoldStyle,
                ),
              ),
              sizedBox(),
              Image.asset(
                'assets/images/logo.png',
                width: 90,
              ),
              sizedBox(),
              sizedBox(),
              sizedBox(),
              sizedBox(),
              sizedBox(),
              Center(
                child: Text(
                  homeContributeTitle,
                  style: titleBoldStyle,
                ),
              ),
              sizedBox(),
              Text(
                homeContributeDescription,
                style: bodyStyle,
              ),
              sizedBox(),
              GestureDetector(
                onTap: () {
                  CustomUrlLauncher.launchURL(
                      "https://github.com/codehub-ir/codehub");
                },
                child: Image.asset(
                  'assets/images/git.png',
                  width: 90,
                ),
              ),
              Text(
                repoDescription,
                style: bodyStyle.copyWith(color: Colors.grey),
              ),
              const SizedBox(
                height: 40,
              ),
              developersSection(),
              const SizedBox(
                height: 40,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget developersSection() {
    return Column(
      children: [
        Center(
          child: Text(
            developersTitle,
            style: titleBoldStyle,
          ),
        ),
      ],
    );
  }

  Widget sizedBox() {
    return const SizedBox(
      height: 10,
    );
  }

  Widget drawerRowTile({title, onTap, icon}) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        splashColor: primaryColor.withOpacity(.1),
        hoverColor: primaryColor.withOpacity(.2),
        highlightColor: primaryColor.withOpacity(.05),
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              FaIcon(
                icon,
                color: primaryColor,
              ),
              SizedBox(
                width: 50,
              ),
              Text(
                title,
                style: underlineStyle,
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget customDrawer() {
    var size = MediaQuery.of(context).size;
    return Container(
      decoration: BoxDecoration(
        color: drawerColor,
        borderRadius: BorderRadius.horizontal(left: Radius.circular(20)),
      ),
      width: size.width * .7,
      height: size.height,
      child: Container(
        child: SafeArea(
          child: Column(
            children: [
              sizedBox(),
              Image.asset(
                "assets/images/user.png",
                width: 100,
              ),
              sizedBox(),
              Material(
                color: Colors.transparent,
                child: RichText(
                  text: TextSpan(
                    style: TextStyle(fontFamily: "vazir"),
                    children: <TextSpan>[
                      TextSpan(
                        text: helloTitle,
                        style: bodyStyle,
                      ),
                      TextSpan(
                        text: " " + "کاربر" + " ",
                        style: bodyBoldStyle.copyWith(color: primaryColor),
                      ),
                      TextSpan(
                        text: welcomeTitle,
                        style: bodyStyle,
                      ),
                    ],
                  ),
                ),
              ),
              sizedBox(),
              Divider(
                height: 20,
                thickness: 1,
              ),
              drawerRowTile(
                icon: Icons.account_circle_outlined,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => LoginPage(),
                    ),
                  );
                },
                title: loginTitle,
              ),
              drawerRowTile(
                icon: Icons.add,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => NewSnippetScreen(),
                    ),
                  );
                },
                title: newSnippetTitle,
              ),
              drawerRowTile(
                icon: Icons.developer_mode,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DevelopmentScreen(),
                    ),
                  );
                },
                title: developmentTitle,
              ),
              drawerRowTile(
                icon: Icons.event,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => EventScreen(),
                    ),
                  );
                },
                title: eventsTitle,
              ),
              Divider(
                height: 20,
                thickness: 1,
              ),
              Expanded(child: sizedBox()),
              Text(
                appVersion,
                style: underlineStyle,
              ),
              sizedBox(),
            ],
          ),
        ),
      ),
    );
  }
}
