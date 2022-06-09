import 'package:digital_card_website/authentication/login_screen.dart';
import 'package:digital_card_website/backend/authentication.dart';
import 'package:digital_card_website/home/dashboard/components/today_text.dart';
import 'package:digital_card_website/home/widgets/profile_card.dart';
import 'package:digital_card_website/responsive.dart';
import 'package:digital_card_website/routes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
            const Spacer(
              flex: 3,
            ),
            SizedBox(
              width: ResponsiveLayout.isDesktop(context) ? 300 : 100,
              child: ProfileCard(
                onLogoutPressed: () {
                  context.read<FirebaseAuthService>().logOut(
                    onSuccess: () {
                      Navigator.pushReplacementNamed(
                        context,
                        GlobalRoutes.loginRoute,
                      );
                    },
                    onError: (String? msg) {
                      print(msg!);
                    },
                  );
                },
              ),
            ),
          ],
        ),
        const Divider()
      ],
    );
  }
}
