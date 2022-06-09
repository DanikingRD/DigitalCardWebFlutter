import 'package:digital_card_website/constants.dart';
import 'package:digital_card_website/home/widgets/drawer_list_tile.dart';
import 'package:digital_card_website/provider/dashboard_navigator_provider.dart';
import 'package:digital_card_website/routes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: kSideMenuBgColor,
      child: SingleChildScrollView(
        child: Column(
          children: [
            DrawerHeader(
              child: Image.asset("assets/images/flutter_logo.png"),
            ),
            const SideMenuButton(
              route: LocalRoutes.insightsRoute,
              display: LocalRoutes.insightsDisplayName,
              icon: Icons.home,
            ),
            const SizedBox(
              height: 20,
            ),
            const SideMenuButton(
              route: LocalRoutes.devicesPageRoute,
              display: LocalRoutes.devicesDisplayName,
              icon: Icons.credit_card,
            ),
            const SizedBox(
              height: 20,
            ),
            const SideMenuButton(
              route: LocalRoutes.profilesPageRoute,
              display: LocalRoutes.profilesDisplayName,
              icon: Icons.people,
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}

class SideMenuButton extends StatelessWidget {
  final String route;
  final String display;
  final IconData icon;

  const SideMenuButton({
    Key? key,
    required this.route,
    required this.display,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final localNav = context.watch<DashboardNavigatorProvider>();

    return DrawerListTile(
      title: display,
      icon: icon,
      onPress: () => localNav.push(route, display),
    );
  }
}
