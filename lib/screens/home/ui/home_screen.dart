import 'package:codehub/constant/app_colors/app_colors.dart';
import 'package:codehub/constant/app_strings/app_strings.dart';
import 'package:codehub/constant/app_styles.dart';
import 'package:codehub/global_widgets/custom_gradient_button/custom_gradient_button.dart';
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
              Icon(
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
                onTap: () {},
                title: loginTitle,
              ),
              drawerRowTile(
                icon: Icons.add,
                onTap: () {},
                title: newSnippetTitle,
              ),
              drawerRowTile(
                icon: Icons.tag,
                onTap: () {},
                title: tagsTitle,
              ),
              drawerRowTile(
                icon: Icons.developer_mode,
                onTap: () {},
                title: developmentTitle,
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
