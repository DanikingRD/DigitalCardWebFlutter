import 'package:digital_card_website/backend/authentication.dart';
import 'package:digital_card_website/constants.dart';
import 'package:digital_card_website/widgets/primary_button.dart';
import 'package:digital_card_website/widgets/primary_textfield.dart';
import 'package:digital_card_website/widgets/secondary_button.dart';
import 'package:digital_card_website/three_bounce_loading_indicator.dart';
import 'package:flutter/material.dart';

class ResetPasswordBody extends StatefulWidget {
  final VoidCallback onReturn;
  final TextEditingController emailController;
  final FirebaseAuthService authInstance;
  final Function(String? message) onError;
  const ResetPasswordBody({
    Key? key,
    required this.onReturn,
    required this.authInstance,
    required this.emailController,
    required this.onError,
  }) : super(key: key);

  @override
  State<ResetPasswordBody> createState() => _ResetPasswordBodyState();
}

class _ResetPasswordBodyState extends State<ResetPasswordBody> {
  bool _resetLinkSent = false;
  bool _sendingLink = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (!_resetLinkSent) ...{
          PrimaryTextField(
            label: "Email",
            controller: widget.emailController,
          ),
          const SizedBox(
            height: 40,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              getReturnButton(),
              const Spacer(),
              SizedBox(
                width: 160,
                height: 40,
                child: PrimaryButton(
                  onClick: () async {
                    setState(() {
                      _sendingLink = true;
                    });
                    await sendResetLink();
                    setState(() {
                      _sendingLink = false;
                    });
                  },
                  text: "Send Reset Link",
                  content: _sendingLink
                      ? const ThreeBounceLoadingIndicator(
                          color: Colors.white,
                          size: 24.0,
                        )
                      : null,
                  isEnabled: () => true,
                  enabledColor: kPrimaryColor,
                ),
              ),
            ],
          )
        } else ...{
          const Text(
            "We've sent a password reset link to your email address.",
            style: TextStyle(color: kOutlineBorderColor),
          ),
          const SizedBox(
            height: 40,
          ),
          getReturnButton(),
        }
      ],
    );
  }

  Widget getReturnButton() {
    return SecondaryButton(
      onClick: widget.onReturn,
      text: "Return to sign in",
    );
  }

  Future<void> sendResetLink() async {
    await widget.authInstance.sendResetPasswordLink(
      email: widget.emailController.text,
      onError: widget.onError,
      onSuccess: () => setState(() => _resetLinkSent = true),
    );
  }
}
