import 'package:digital_card_website/colors.dart';
import 'package:digital_card_website/home/layout/large_dashboard_layout.dart';
import 'package:digital_card_website/home/layout/medium_dashboard_layout.dart';
import 'package:digital_card_website/home/nav_bar.dart';
import 'package:digital_card_website/responsive.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: navbar(context, scaffoldKey),
      drawer: const Drawer(),
      body: const ResponsiveLayout(
        largeScreen: LargeDashboardLayout(),
        mediumScreen: MediumDashboardLayout(),
      ),
    );
  }
}
