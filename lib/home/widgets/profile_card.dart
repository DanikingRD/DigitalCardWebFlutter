import 'package:digital_card_website/constants.dart';
import 'package:flutter/material.dart';

class ProfileCard extends StatelessWidget {
  final VoidCallback onLogoutPressed;
  const ProfileCard({
    Key? key,
    required this.onLogoutPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListTile(
        contentPadding: const EdgeInsets.all(0),
        leading: const CircleAvatar(
          backgroundImage: AssetImage('assets/images/avatar.png'),
        ),
        title: SelectableText(
          'Luis de la Cruz',
          style: TextStyle(fontSize: 14, color: kFontColorPallets[0]),
        ),
        subtitle: SelectableText(
          'danikingrd@gmail.com',
          style: TextStyle(fontSize: 12, color: kFontColorPallets[2]),
        ),
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
      ),
    );
  }
}
