import 'package:digital_card_website/home/dashboard/components/header.dart';
import 'package:digital_card_website/home/side_menu.dart';
import 'package:digital_card_website/responsive.dart';
import 'package:digital_card_website/widgets/local_navigator.dart';
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
            Expanded(
              flex: 5,
              child: Column(
                children: const [
                  Expanded(child: DashboardHeader()),
                  Expanded(
                    flex: 5,
                    child: LocalNavigator(),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
