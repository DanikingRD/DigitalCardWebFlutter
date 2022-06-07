import 'package:digital_card_website/routes.dart';
import 'package:flutter/widgets.dart';

class DashboardNavigatorProvider with ChangeNotifier {
  String activeRoute = Routes.homeDisplayName;
  final GlobalKey<NavigatorState> navigationKey = GlobalKey<NavigatorState>();
  dynamic push(String route, String display) {
    activeRoute = display;
    navigationKey.currentState!.pushReplacementNamed(route);
    notifyListeners();
  }
}
