import 'package:digital_card_website/home/dashboard/components/side_menu.dart';
import 'package:digital_card_website/responsive.dart';
import 'package:digital_card_website/home/dashboard/dashboard_content.dart';
import 'package:flutter/material.dart';

class HomeScreenLayout extends StatelessWidget {
  const HomeScreenLayout({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Row(
          children: const [
            Expanded(
              child: SideMenu(),
            ),
            Expanded(
              flex: 6,
              child: DashboardPageContent(),
            ),
          ],
        ),
      ),
    );
  }

  int getContentExpandSize(BuildContext context) {
    return ResponsiveLayout.isDesktop(context) ? 6 : 9;
  }
}
