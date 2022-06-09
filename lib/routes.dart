import 'package:digital_card_website/authentication/login_screen.dart';
import 'package:digital_card_website/home/layout.dart';
import 'package:digital_card_website/home/pages/devices_page.dart';
import 'package:digital_card_website/home/pages/home_page.dart';
import 'package:digital_card_website/home/pages/profiles_page.dart';
import 'package:flutter/material.dart';

class GlobalRoutes {
  static const String loginRoute = "/login";
  static const String userHomeRoute = "/home";
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case loginRoute:
        return _NoTransitionEffectBuilder(
          child: const LoginScreen(),
          settings: settings,
        );
      case userHomeRoute:
        return _NoTransitionEffectBuilder(
          child: const HomeScreenLayout(),
          settings: settings,
        );
      default:
        // TO-DO: Properly implement a 404 screen
        return _NoTransitionEffectBuilder(
          child: const Center(
            child: Text('404 - UNDEFINED ROUTE'),
          ),
          settings: settings,
        );
    }
  }
}

class LocalRoutes {
  static const String insightsDisplayName = "Insights";
  static const String insightsRoute = "/insights";
  static const String devicesPageRoute = "/devices";
  static const String devicesDisplayName = "Devices";
  static const String profilesPageRoute = "/profiles";
  static const String profilesDisplayName = "Profiles";
  static const String appointmentsPageRoute = "/appointments";
  static const String connectionsPageRoute = "/connections";

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case insightsRoute:
        return _NoTransitionEffectBuilder(
          child: const HomePage(),
          settings: settings,
        );
      case devicesPageRoute:
        return _NoTransitionEffectBuilder(
          child: const DevicesPage(),
          settings: settings,
        );
      case profilesPageRoute:
        return _NoTransitionEffectBuilder(
          child: const ProfilesPage(),
          settings: settings,
        );
      default:
        // TO-DO: Properly implement a 404 screen
        return _NoTransitionEffectBuilder(
          child: const Center(
            child: Text('404 - UNDEFINED ROUTE'),
          ),
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
