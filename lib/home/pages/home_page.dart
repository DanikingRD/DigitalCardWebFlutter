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
        Row(
          children: const [
            SizedBox(
              height: 200,
              child: InsightCard(icon: Icons.credit_card),
            ),
          ],
        ),
      ],
    );
  }
}
