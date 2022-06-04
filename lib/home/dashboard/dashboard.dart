import 'package:digital_card_website/constants.dart';
import 'package:digital_card_website/home/dashboard/components/header.dart';
import 'package:digital_card_website/widgets/local_navigator.dart';
import 'package:flutter/material.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ListView(
        padding: const EdgeInsets.all(defaultPadding),
        children: const [
          DashboardHeader(),
        ],
      ),
    );
  }
}
