import 'package:digital_card_website/home/widgets/insight_card.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 30,
        ),
        Wrap(
          // TODO: fix wrap not working as a row
          children: const [
            InsightCard(
              icon: Icons.people,
              title: "Profiles",
              count: 1,
            ),
            InsightCard(
              icon: Icons.credit_card,
              title: "Devices",
              count: 5,
            ),
          ],
        ),
      ],
    );
  }
}
