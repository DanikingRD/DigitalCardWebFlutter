import 'package:digital_card_website/colors.dart';
import 'package:digital_card_website/primary_button.dart';
import 'package:digital_card_website/primary_textfield.dart';
import 'package:digital_card_website/secondary_button.dart';
import 'package:flutter/material.dart';

class ResetPasswordBody extends StatelessWidget {
  final VoidCallback onReturn;
  final TextEditingController emailController;
  const ResetPasswordBody({
    Key? key,
    required this.onReturn,
    required this.emailController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        PrimaryTextField(
          label: "Email",
          controller: emailController,
        ),
        const SizedBox(
          height: 40,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            SecondaryButton(
              onClick: onReturn,
              text: "Return to sign in",
            ),
            const Spacer(),
            SizedBox(
              width: 160,
              height: 40,
              child: PrimaryButton(
                onClick: () {},
                text: "Send Reset Link",
                isEnabled: () => true,
                enabledColor: kPrimaryColor,
                disabledColor: kPrimaryColor,
              ),
            ),
          ],
        )
      ],
    );
  }
}
