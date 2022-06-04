import 'package:digital_card_website/home/pages/devices_page.dart';
import 'package:digital_card_website/home/pages/home_page.dart';
import 'package:digital_card_website/home/pages/profiles_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Routes {
  static const String homePageRoute = "/home";
  static const String devicesPageRoute = "/devices";
  static const String profilesPageRoute = "/profiles";
  static const String appointmentsPageRoute = "/appointments";
  static const String connectionsPageRoute = "/connections";

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case homePageRoute:
        return _createRoute(const HomePage());
      case devicesPageRoute:
        return _createRoute(const DevicesPage());
      default:
        return _createRoute(const ProfilesPage());
    }
  }

  static PageRoute _createRoute(Widget child) {
    return MaterialPageRoute(
      builder: (_) => child,
    );
  }
}
