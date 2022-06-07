import 'package:digital_card_website/responsive.dart';
import 'package:flutter/material.dart';

class InsightCard extends StatelessWidget {
  final IconData icon;
  const InsightCard({
    Key? key,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Container(
      constraints: BoxConstraints(
        minWidth:
            ResponsiveLayout.isDesktop(context) ? 200 : size.width / 2 - 40,
      ),
      padding: EdgeInsets.only(
        top: 20,
        bottom: 20,
        left: 20,
        right: ResponsiveLayout.isMobile(context) ? 20 : 40,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
        color: Colors.white,
      ),
      child: Column(
        children: [
          Icon(
            icon,
            size: 35,
          ),
          const SizedBox(
            height: 30,
          ),
        ],
      ),
    );
  }
}
