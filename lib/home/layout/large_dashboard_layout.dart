import 'package:digital_card_website/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LargeDashboardLayout extends StatelessWidget {
  const LargeDashboardLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(color: Colors.white),
        ),
        Expanded(
          flex: 5,
          child: Container(
            color: dashboardBg,
          ),
        )
      ],
    );
  }
}
