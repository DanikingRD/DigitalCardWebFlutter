import 'package:digital_card_website/home/pages/devices_page.dart';
import 'package:digital_card_website/home/pages/home_page.dart';
import 'package:digital_card_website/home/pages/profiles_page.dart';
import 'package:flutter/material.dart';

class Routes {
  static const String homeDisplayName = "Home";
  static const String homePageRoute = "/home";
  static const String devicesPageRoute = "/devices";
  static const String devicesDisplayName = "Devices";
  static const String profilesPageRoute = "/profiles";
  static const String profilesDisplayName = "Profiles";
  static const String appointmentsPageRoute = "/appointments";
  static const String connectionsPageRoute = "/connections";

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case homePageRoute:
        return _NoTransitionEffectBuilder(
          child: const HomePage(),
          settings: settings,
        );
      case devicesPageRoute:
        return _NoTransitionEffectBuilder(
          child: const DevicesPage(),
          settings: settings,
        );
      default:
        return _NoTransitionEffectBuilder(
          child: const ProfilesPage(),
          settings: settings,
        );
    }
  }
}

class _NoTransitionEffectBuilder extends PageRouteBuilder {
  final Widget child;
  _NoTransitionEffectBuilder({
    required this.child,
    required RouteSettings settings,
  }) : super(
          settings: settings,
          pageBuilder: (_, __, ___) => child,
          transitionDuration: Duration.zero,
          reverseTransitionDuration: Duration.zero,
        );
  // No transition effect
  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) {
    return child;
  }
}
