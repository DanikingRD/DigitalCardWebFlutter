import 'package:digital_card_website/home/dashboard/calendar_panel.dart';
import 'package:digital_card_website/home/pages/overview.dart';
import 'package:digital_card_website/home/widgets/header_text.dart';
import 'package:digital_card_website/home/dashboard/side_menu.dart';
import 'package:digital_card_website/home/widgets/user_profile.dart';
import 'package:digital_card_website/util.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Expanded(
            flex: 3,
            child: SingleChildScrollView(
              child: SideMenu(),
            ),
          ),
          Expanded(
            flex: 10,
            child: OverviewPage(),
          ),
          Expanded(
            flex: 4,
            child: SingleChildScrollView(
              child: CalendarPanel(),
            ),
          ),
        ],
      ),
    );
  }
}
