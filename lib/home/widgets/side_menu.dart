import 'package:digital_card_website/home/widgets/selection_button.dart';
import 'package:flutter/material.dart';

class SideMenu extends StatelessWidget {
  final Function(int index, SelectionButtonData value) onSelected;

  const SideMenu({Key? key, required this.onSelected}) : super(key: key);

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
