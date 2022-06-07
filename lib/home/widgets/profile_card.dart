import 'package:digital_card_website/constants.dart';
import 'package:digital_card_website/responsive.dart';
import 'package:flutter/material.dart';

class ProfileCard extends StatelessWidget {
  final VoidCallback onLogoutPressed;
  const ProfileCard({
    Key? key,
    required this.onLogoutPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.all(0),
      leading: const CircleAvatar(
        backgroundImage: AssetImage('assets/images/avatar.png'),
      ),
      title: ResponsiveLayout.isDesktop(context)
          ? SelectableText(
              'Luis de la Cruz',
              style: TextStyle(
                fontSize: 14,
                color: kFontColorPallets[0],
              ),
              maxLines: 1,
            )
          : null,
      subtitle: ResponsiveLayout.isDesktop(context)
          ? SelectableText(
              'danikingrd@gmail.com',
              style: TextStyle(
                fontSize: 12,
                color: kFontColorPallets[2],
              ),
              maxLines: 1,
            )
          : null,
      trailing: IconButton(
        hoverColor: Colors.transparent,
        splashColor: Colors.transparent,
        focusColor: Colors.transparent,
        highlightColor: Colors.transparent,
        onPressed: onLogoutPressed,
        icon: const Icon(
          Icons.logout,
          color: kDashDarkColor,
        ),
        tooltip: "Log Out",
      ),
    );
  }
}
