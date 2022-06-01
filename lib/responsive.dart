import 'package:flutter/material.dart';

class ResponsiveLayout extends StatelessWidget {
  final Widget largeScreen;
  final Widget mediumScreen;

  const ResponsiveLayout({
    Key? key,
    required this.largeScreen,
    required this.mediumScreen,
  }) : super(key: key);

  static bool isSmallScreen(BuildContext context) {
    return MediaQuery.of(context).size.width < 1200;
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: ((context, constraints) {
        final width = constraints.maxWidth;
        if (width >= 1200) {
          return largeScreen;
        } else {
          return mediumScreen;
        }
      }),
    );
  }
}
