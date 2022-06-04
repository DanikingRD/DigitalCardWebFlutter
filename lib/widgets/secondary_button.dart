import 'package:digital_card_website/constants.dart';
import 'package:flutter/material.dart';

class SecondaryButton extends StatelessWidget {
  final VoidCallback onClick;
  final String text;
  final Color foregroundColor;
  const SecondaryButton({
    Key? key,
    required this.onClick,
    required this.text,
    this.foregroundColor = kPrimaryColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: ButtonStyle(
        splashFactory: NoSplash.splashFactory,
        overlayColor: MaterialStateProperty.all(Colors.transparent),
        foregroundColor: MaterialStateProperty.resolveWith((states) {
          return states.contains(MaterialState.hovered)
              ? foregroundColor.withOpacity(0.67)
              : foregroundColor;
        }),
      ),
      onPressed: onClick,
      child: Text(
        text,
      ),
    );
  }
}
