import 'package:codehub/constant/app_strings/app_strings.dart';
import 'package:codehub/constant/app_styles/app_styles.dart';
import 'package:codehub/utils/custom_url_launcher/custom_url_launcher.dart';
import 'package:codehub/utils/size_config/size_config.dart';
import 'package:flutter/material.dart';

class DevelopmentScreen extends StatelessWidget {
  const DevelopmentScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(developmentTitle),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                developmentPageTitle,
                style: titleBoldStyle,
              ),
              SizedBox(
                height: SizeConfig.heightMultiplier * 2,
              ),
              Text(
                developmentDescription,
                style: bodyStyle,
              ),
              SizedBox(
                height: SizeConfig.heightMultiplier * 2,
              ),
              documentVersionWidget(
                  1, "https://codehub.pythonanywhere.com/api/v1/docs"),
              documentVersionWidget(
                  2, "https://codehub.pythonanywhere.com/api/v2/docs"),
            ],
          ),
        ),
      ),
    );
  }

  Widget documentVersionWidget(version, url) => GestureDetector(
        onTap: () => CustomUrlLauncher.launchURL(url),
        child: Directionality(
          textDirection: TextDirection.ltr,
          child: Card(
            elevation: 5,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "CodeHub RESTful API Service Documentation",
                    style: bodyBoldStyle,
                  ),
                  Align(
                    child: Text(
                        "Codehub provides users/devs multiple RESTful API services. This RESTful service allows developers to work with CodeHub Web Services on any platform and machine. Make sure you follow the documentation and observe all conditions and requirements."),
                  ),
                  Align(
                    child: Container(
                      child: Text(
                        "ver ${version}",
                        style: underlineBoldStyle,
                      ),
                    ),
                    alignment: Alignment.centerRight,
                  ),
                ],
              ),
            ),
          ),
        ),
      );
}
