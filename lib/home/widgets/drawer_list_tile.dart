import 'package:digital_card_website/constants.dart';
import 'package:digital_card_website/provider/dashboard_navigator_provider.dart';
import 'package:digital_card_website/responsive.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
    if (isSmallScreen(context)) {
      return getIconButton(localNav);
    } else {
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
              leading: getIcon(localNav),
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
  }

  Widget getIconButton(DashboardNavigatorProvider localNav) {
    return IconButton(
      onPressed: onPress,
      splashColor: Colors.transparent,
      hoverColor: Colors.transparent,
      highlightColor: Colors.transparent,
      icon: getIcon(localNav),
    );
  }

  Widget getIcon(DashboardNavigatorProvider provider) {
    return Icon(
      icon,
      color: isActive(provider) ? Colors.black : Colors.black54,
    );
  }

  bool isSmallScreen(BuildContext context) {
    return !ResponsiveLayout.isDesktop(context);
  }

  bool isActive(DashboardNavigatorProvider provider) {
    return title == provider.activeRoute;
  }
}
