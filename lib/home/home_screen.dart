import 'package:digital_card_website/home/widgets/side_menu.dart';
import 'package:digital_card_website/home/widgets/user_profile.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          Expanded(
            flex: 3,
            child: SingleChildScrollView(
              child: _buildSideBar(),
            ),
          ),
          const Expanded(
            flex: 10,
            child: SingleChildScrollView(),
          ),
          const Expanded(
            flex: 4,
            child: SingleChildScrollView(),
          ),
        ],
      ),
    );
  }
}

Widget _buildSideBar() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
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
