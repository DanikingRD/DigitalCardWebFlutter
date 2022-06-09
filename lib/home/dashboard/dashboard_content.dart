import 'package:digital_card_website/constants.dart';
import 'package:digital_card_website/home/dashboard/components/header.dart';
import 'package:digital_card_website/provider/dashboard_navigator_provider.dart';
import 'package:digital_card_website/routes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DashboardPageContent extends StatelessWidget {
  const DashboardPageContent({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final localNav = context.watch<DashboardNavigatorProvider>();
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const DashboardHeader(),
          const SelectableText(
            'Dashboard',
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.w800,
            ),
          ),
          SelectableText(
            _getDesc(localNav),
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w400,
              color: kDashSecondaryColor,
            ),
          ),
          Expanded(
            child: Navigator(
              key: localNav.navigationKey,
              initialRoute: LocalRoutes.insightsRoute,
              onGenerateRoute: LocalRoutes.generateRoute,
            ),
          ),
        ],
      ),
    );
  }

  String _getDesc(DashboardNavigatorProvider provider) {
    switch (provider.activeRoute) {
      case "Home":
        return "Insights updates";
      case "Devices":
        return "Manage your devices";
      case "Profiles":
        return "Manage your profiles";
      default:
        return "";
    }
  }
}
