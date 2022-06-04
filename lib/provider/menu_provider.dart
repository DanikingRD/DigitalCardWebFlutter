import 'package:digital_card_website/constants.dart';
import 'package:digital_card_website/routes.dart';
import 'package:flutter/material.dart';

class MenuProvider with ChangeNotifier {
  String _activeRoute = Routes.homePageRoute;
  String? _hoveredRoute;

  void setActiveRoute(String route) {
    _activeRoute = route;
    notifyListeners();
  }

  void onHover(String route) {
    if (!isActive(route)) {
      _hoveredRoute = route;
      notifyListeners();
    }
  }

  bool isActive(String route) => _activeRoute == route;
  bool isHovered(String route) => _hoveredRoute == route;

  Widget getIconFor(String route) {
    switch (route) {
      case Routes.homePageRoute:
        return _icon(Icons.trending_up, route);
      case Routes.devicesPageRoute:
        return _icon(Icons.trending_up, route);
      case Routes.profilesPageRoute:
        return _icon(Icons.trending_up, route);
      case Routes.appointmentsPageRoute:
        return _icon(Icons.trending_up, route);
      case Routes.connectionsPageRoute:
        return _icon(Icons.trending_up, route);
    }
    return Container();
  }

  Widget _icon(IconData icon, String route) {
    if (isActive(route)) {
      return Icon(
        icon,
        size: 22,
        color: kGreyTextColor,
      );
    } else {
      return Icon(
        icon,
        color: isHovered(route) ? kGreyTextColor : kOutlineBorderColor,
      );
    }
  }
}
