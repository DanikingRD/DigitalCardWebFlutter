import 'package:digital_card_website/home/widgets/header_text.dart';
import 'package:digital_card_website/home/widgets/side_menu.dart';
import 'package:digital_card_website/home/widgets/user_profile.dart';
import 'package:digital_card_website/util.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 3,
            child: SingleChildScrollView(
              child: _buildSideBar(),
            ),
          ),
          Expanded(
            flex: 10,
            child: _buildOverview(),
          ),
          Expanded(
            flex: 4,
            child: SingleChildScrollView(
              child: _buildCalendar(),
            ),
          ),
        ],
      ),
    );
  }
}

Widget _buildOverview() {
  return Column(
    children: [
      const SizedBox(
        height: 40,
      ),
      HeaderText(
        text: getCurrentDate(DateTime.now()),
      ),
    ],
  );
}

Widget _buildSideBar() {
  return Column(
    children: [
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: UserProfile(
          name: "Luis de la Cruz",
          onPressed: () {},
        ),
      ),
      const SizedBox(
        height: 15,
      ),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: SideMenu(
          onSelected: (index, value) {
            //TODO: Navigate on selected
          },
        ),
      ),
      const Divider(
        thickness: 1,
        indent: 20,
        endIndent: 20,
        height: 60,
      ),
    ],
  );
}

Widget _buildCalendar() {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 20),
    child: Column(
      children: [
        const SizedBox(
          height: 20,
        ),
        Row(
          children: [
            const Expanded(
              child: HeaderText(text: 'Calendar'),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.calendar_month),
              tooltip: 'calendar',
            )
          ],
        )
      ],
    ),
  );
}
