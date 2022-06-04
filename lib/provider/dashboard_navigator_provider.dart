import 'package:flutter/widgets.dart';

class DashboardNavigatorProvider with ChangeNotifier {
  final GlobalKey<NavigatorState> navigationKey = GlobalKey<NavigatorState>();

  dynamic push(String route) {
    navigationKey.currentState!.pushNamed(route);
    notifyListeners();
  }

  void pop() {
    navigationKey.currentState!.pop();
    notifyListeners();
  }
}
