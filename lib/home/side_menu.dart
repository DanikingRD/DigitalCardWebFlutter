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
    final localNav = context.read<DashboardNavigatorProvider>();
    return Drawer(
      child: SingleChildScrollView(
        child: Column(
          children: [
            const DrawerHeader(
              child: Text('Logo'),
            ),
            DrawerListTile(
              onPress: () => localNav.push(Routes.homePageRoute),
              icon: Icons.home,
              title: 'Home',
            ),
            DrawerListTile(
              onPress: () => localNav.push(Routes.devicesPageRoute),
              icon: Icons.credit_card,
              title: 'Devices',
            ),
            DrawerListTile(
              onPress: () => localNav.push(Routes.profilesPageRoute),
              icon: Icons.people,
              title: 'Profiles',
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
    return ListTile(
      onTap: onPress,
      horizontalTitleGap: 0.0,
      leading: Icon(
        icon,
        color: Colors.black54,
      ),
      title: Text(
        title,
      ),
    );
  }
}
