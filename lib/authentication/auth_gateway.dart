import 'package:digital_card_website/authentication/login_screen.dart';
import 'package:digital_card_website/home/layout.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

import 'package:provider/provider.dart';

class AuthGateway extends StatelessWidget {
  const AuthGateway({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final User? user = context.watch<User?>();
    if (user == null) {
      return const LoginScreen();
    } else {
      return const HomeScreenLayout();
    }
  }
}
