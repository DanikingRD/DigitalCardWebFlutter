import 'package:flutter/widgets.dart';

class ResponsiveLayout extends StatelessWidget {
  // Mobile layout
  final Widget mobile;
  // Table layout which sometimes may not exist
  final Widget? tablet;
  // Desktop layout
  final Widget desktop;

  const ResponsiveLayout({
    Key? key,
    required this.mobile,
    required this.tablet,
    required this.desktop,
  }) : super(key: key);

  // Checks whether this is a mobile, tablet or desktop
  // which comes in handy.
  static bool isMobile(BuildContext context) =>
      MediaQuery.of(context).size.width < 850;

  static bool isTablet(BuildContext context) =>
      MediaQuery.of(context).size.width < 1100 &&
      MediaQuery.of(context).size.width >= 850;

  static bool isDesktop(BuildContext context) =>
      MediaQuery.of(context).size.width >= 1100;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    // We consider desktop anything above 1100
    if (size.width >= 1100) {
      return desktop;
    } else if (size.width >= 850 && tablet != null) {
      // If is not desktop, a width above 850 will be considered tablet
      return tablet!;
    } else {
      // Otherwise this is mobile
      return mobile;
    }
  }
}
