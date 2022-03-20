import 'package:codehub/src/core/constant/api_path/api_path.dart';
import 'package:codehub/src/core/constant/app_colors/app_colors.dart';
import 'package:codehub/src/core/constant/app_strings/app_strings.dart';
import 'package:codehub/src/core/constant/app_styles/app_styles.dart';
import 'package:codehub/src/core/utils/custom_url_launcher/custom_url_launcher.dart';
import 'package:codehub/src/data/models/github_profile_model.dart';
import 'package:codehub/src/injector.dart';
import 'package:codehub/src/presentation/blocs/home_bloc/home_bloc.dart';
import 'package:codehub/src/presentation/views/development_screen/development_screen.dart';
import 'package:codehub/src/presentation/views/event_screen/event_screen.dart';
import 'package:codehub/src/presentation/views/login_screen/login_screen.dart';
import 'package:codehub/src/presentation/views/new_snippet_screen/new_snippet_screen.dart';
import 'package:codehub/src/presentation/widgets/custom_gradient_button.dart';
import 'package:codehub/src/presentation/widgets/custom_indicators.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../widgets/custom_cache_image.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<HomeBloc>(
      create: (context) => HomeBloc(getIt())..add(GetGithubProfiles()),
      child: Scaffold(
        appBar: AppBar(
          title: Text(homeTitle),
          centerTitle: true,
        ),
        drawer: customDrawer(context),
        body: SingleChildScrollView(
          child: Column(
            children: [
              serviceDescription(),
              sizedBox(),
              serviceTechLogo(),
              sizedBox(),
              sizedBox(),
              sizedBox(),
              sizedBox(),
              sizedBox(),
              developersSection(context),
              sizedBox(),
              contributeSection(),
            ],
          ),
        ),
      ),
    );
  }

  Widget serviceDescription() {
    return Padding(
      padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
      child: Column(
        children: [
          Center(
            child: Text(
              homeContentTitle,
              style: titleBoldStyle,
              textAlign: TextAlign.justify,
            ),
          ),
          sizedBox(),
          Text(
            homeContentDescription,
            style: bodyStyle,
          ),
        ],
      ),
    );
  }

  Widget serviceTechLogo() {
    return Column(
      children: [
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
      ],
    );
  }

  Widget contributeSection() {
    return Padding(
      padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
      child: Column(
        children: [
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
        ],
      ),
    );
  }

  Widget profileWidget({required GithubProfileModel item}) {
    return GestureDetector(
      onTap: () {
        CustomUrlLauncher.launchURL(
            gitRedirectUrl.replaceFirst("#", item.username));
      },
      child: Directionality(
        textDirection: TextDirection.ltr,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 0.0),
          child: Card(
            elevation: 3,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            child: Container(
              width: 300,
              height: 250,
              padding: EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: Material(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(100),
                      ),
                      clipBehavior: Clip.hardEdge,
                      child: CustomCacheImage(
                        width: 80,
                        height: 80,
                        url: item.avatarUrl ?? " ",
                      ),
                    ),
                  ),
                  SizedBox(width: 20),
                  Text(
                    item.name,
                    style: bodyStyle.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          item.bio ?? " ",
                          style: underlineStyle,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                        ),
                      ),
                    ],
                  ),
                  Text(
                    "Location : " + (item.location ?? "Global"),
                    style: underlineBoldStyle,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget developersSection(context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        List<GithubProfileModel> profiles = [];
        if (state is ProfilesFetchedLoading) {
          return SizedBox(
              height: 100, child: Center(child: CustomIndicators()));
        } else if (state is ProfilesFetchedFailed) {
          // todo : [mahmoud] create a global try again button
          return Column(
            children: [
              Center(
                child: Text(
                  developersTitle,
                  style: titleBoldStyle,
                ),
              ),
              sizedBox(),
              CustomGradientButton(
                  onPressed: () {},
                  child: Text(tryAgainBtn),
                  width: 300,
                  height: 50,
                  borderRadius: 30,
                  colors: [primaryColor, primaryBlue]),
            ],
          );
        } else if (state is ProfilesFetchedSuccess) {
          profiles = state.profiles;
        }
        return Column(
          children: [
            Text(developersTitle, style: titleBoldStyle),
            SizedBox(
              height: 250,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: profiles.length,
                itemBuilder: (context, index) =>
                    profileWidget(item: profiles[index]),
              ),
            ),
          ],
        );
      },
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

  Widget customDrawer(context) {
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
