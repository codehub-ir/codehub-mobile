import 'package:codehub/constant/app_colors/app_colors.dart';
import 'package:codehub/constant/app_strings/app_strings.dart';
import 'package:codehub/constant/app_styles/app_styles.dart';
import 'package:codehub/screens/development/ui/development_screen.dart';
import 'package:codehub/screens/events/ui/event_screen.dart';
import 'package:codehub/screens/login/ui/login_screen.dart';
import 'package:codehub/screens/new_snippet/ui/new_snippet_screen.dart';
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
    );
  }

  Widget sizedBox() {
    return SizedBox(
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
              // drawerRowTile(
              //   icon: Icons.tag,
              //   onTap: () {},
              //   title: tagsTitle,
              // ),
              // drawerRowTile(
              //   icon: Icons.settings,
              //   onTap: () {},
              //   title: settingTitle,
              // ),
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
