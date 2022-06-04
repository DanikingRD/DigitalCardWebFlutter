import 'package:digital_card_website/provider/dashboard_navigator_provider.dart';
import 'package:digital_card_website/routes.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class LocalNavigator extends StatelessWidget {
  const LocalNavigator({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: context.read<DashboardNavigatorProvider>().navigationKey,
      initialRoute: Routes.homePageRoute,
      onGenerateRoute: Routes.generateRoute,
    );
  }
}
