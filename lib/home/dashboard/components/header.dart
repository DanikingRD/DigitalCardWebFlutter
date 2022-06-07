import 'package:digital_card_website/constants.dart';
import 'package:digital_card_website/home/dashboard/components/today_text.dart';
import 'package:digital_card_website/home/widgets/profile_card.dart';
import 'package:flutter/material.dart';

class DashboardHeader extends StatelessWidget {
  const DashboardHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            const TodayText(),
            const Spacer(),
            const Spacer(
              flex: 3,
            ),
            ProfileCard(
              onLogoutPressed: () {},
            ),
          ],
        ),
        const Divider()
      ],
    );
  }
}
