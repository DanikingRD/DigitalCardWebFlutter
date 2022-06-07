import 'package:digital_card_website/home/side_menu.dart';
import 'package:digital_card_website/responsive.dart';
import 'package:digital_card_website/home/dashboard/dashboard_content.dart';
import 'package:flutter/material.dart';

class HomeScreenLayout extends StatelessWidget {
  const HomeScreenLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Row(
          children: [
            // We want the side menu only for large screens
            if (ResponsiveLayout.isDesktop(context)) ...{
              const Expanded(
                child: SideMenu(),
              ),
            },
            const Expanded(
              flex: 6,
              child: DashboardPageContent(),
            ),
          ],
        ),
      ),
    );
  }
}
