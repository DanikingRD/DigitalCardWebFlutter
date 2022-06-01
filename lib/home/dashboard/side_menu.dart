import 'package:digital_card_website/home/widgets/selection_button.dart';
import 'package:digital_card_website/home/widgets/user_profile.dart';
import 'package:flutter/material.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
          child: _SideMenuButtons(
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
}

class _SideMenuButtons extends StatelessWidget {
  final Function(int index, SelectionButtonData value) onSelected;

  const _SideMenuButtons({
    Key? key,
    required this.onSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SelectionButton(
      initialSelection: 0,
      data: const [
        SelectionButtonData(
          activeIcon: Icons.home,
          icon: Icons.home_outlined,
          label: "Home",
          totalNotif: 100,
        ),
        SelectionButtonData(
          activeIcon: Icons.credit_card,
          icon: Icons.credit_card_outlined,
          label: "Devices",
        ),
        SelectionButtonData(
          activeIcon: Icons.people,
          icon: Icons.people_outlined,
          label: "Profiles",
        ),
      ],
      onSelected: onSelected,
    );
  }
}
