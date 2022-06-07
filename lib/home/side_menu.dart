import 'package:digital_card_website/constants.dart';
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
    final localNav = context.watch<DashboardNavigatorProvider>();
    return Drawer(
      backgroundColor: kSideMenuBgColor,
      child: SingleChildScrollView(
        child: Column(
          children: [
            const DrawerHeader(
              child: Text('Logo'),
            ),
            DrawerListTile(
              onPress: () => localNav.push(
                Routes.homePageRoute,
                Routes.homeDisplayName,
              ),
              icon: Icons.home,
              title: Routes.homeDisplayName,
            ),
            const SizedBox(
              height: 20,
            ),
            DrawerListTile(
              onPress: () => localNav.push(
                Routes.devicesPageRoute,
                Routes.devicesDisplayName,
              ),
              icon: Icons.credit_card,
              title: Routes.devicesDisplayName,
            ),
            const SizedBox(
              height: 20,
            ),
            DrawerListTile(
              onPress: () => localNav.push(
                Routes.profilesPageRoute,
                Routes.profilesDisplayName,
              ),
              icon: Icons.people,
              title: Routes.profilesDisplayName,
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

class DrawerListTile extends StatelessWidget {
  final String title;
  final IconData icon;
  final VoidCallback onPress;
  const DrawerListTile({
    required this.title,
    required this.icon,
    required this.onPress,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final localNav = context.read<DashboardNavigatorProvider>();
    return Row(
      children: [
        Visibility(
          visible: isActive(localNav),
          maintainSize: true,
          maintainAnimation: true,
          maintainState: true,
          child: Container(
            color: kDashDarkColor,
            width: 6,
            height: 40,
          ),
        ),
        Expanded(
          child: ListTile(
            onTap: onPress,
            horizontalTitleGap: 0.0,
            leading: Icon(
              icon,
              color: isActive(localNav) ? Colors.black : Colors.black54,
            ),
            title: Text(
              title,
              style: TextStyle(
                color: isActive(localNav) ? Colors.black : kDashDarkColor,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ],
    );
  }

  bool isActive(DashboardNavigatorProvider provider) {
    return title == provider.activeRoute;
  }
}
