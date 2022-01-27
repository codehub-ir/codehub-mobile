import 'package:url_launcher/url_launcher.dart';

class CustomUrlLauncher {
  static void launchURL(url) async {
    if (!await launch(url)) throw 'Could not launch $url';
  }
}
