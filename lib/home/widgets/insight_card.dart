import 'package:digital_card_website/constants.dart';
import 'package:digital_card_website/responsive.dart';
import 'package:flutter/material.dart';

class InsightCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final int count;
  const InsightCard({
    Key? key,
    required this.icon,
    required this.title,
    required this.count,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(minWidth: 200),
      padding: const EdgeInsets.all(32.0),
      margin: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
        color: Colors.white,
        boxShadow: const [
          BoxShadow(
            blurRadius: 5.0,
            spreadRadius: 2.0,
            color: kSideMenuBgColor,
            offset: Offset(0.0, 1.0),
          )
        ],
      ),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(
                icon,
                size: 35,
              ),
              Text(
                title,
                style: const TextStyle(
                  color: kDashDarkColor,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const SizedBox(
            width: 80,
          ),
          Text(
            count.toString(),
            style: const TextStyle(
              color: kGreyTextColor,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
