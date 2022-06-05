import 'package:digital_card_website/constants.dart';
import 'package:digital_card_website/home/widgets/profile_card.dart';
import 'package:flutter/material.dart';

class DashboardHeader extends StatelessWidget {
  const DashboardHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
      child: Row(
        children: [
          Text('Dashboard', style: Theme.of(context).textTheme.headline6),
          const Spacer(),
          const ProfileCard()
        ],
      ),
    );
  }
}
