import 'package:digital_card_website/constants.dart';
import 'package:flutter/material.dart';

class PrimaryButton extends StatefulWidget {
  // onClick handler
  final VoidCallback? onClick;
  final bool Function() isEnabled;
  final String text;

  /// Color when this button is enabled.
  final Color enabledColor;

  /// Color for when this button is disabled.
  final Color? disabledColor;

  /// Optional widget for loading indicator or custom text
  final Widget? content;

  /// A [PrimaryButton] can animate the color changes.
  const PrimaryButton({
    Key? key,
    required this.onClick,
    required this.text,
    required this.isEnabled,
    required this.enabledColor,
    this.disabledColor,
    this.content,
  }) : super(key: key);

  @override
  State<PrimaryButton> createState() => _PrimaryButtonState();
}

class _PrimaryButtonState extends State<PrimaryButton> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    const BorderRadius borderRadius = BorderRadius.all(Radius.circular(8.0));
    return AnimatedTheme(
      duration: const Duration(milliseconds: 300),
      data: Theme.of(context).copyWith(
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
            backgroundColor: getBackgroundColor(),
            shape: RoundedRectangleBorder(
              borderRadius: borderRadius,
              side: BorderSide(
                color: getBorderColor(),
              ),
            ),
          ),
        ),
      ),
      child: MouseRegion(
        onEnter: ((_) => onHoverUpdate(true)),
        onExit: ((_) => onHoverUpdate(false)),
        child: TextButton(
          style: ButtonStyle(
            // No color splash
            overlayColor: MaterialStateProperty.all(Colors.transparent),
          ),
          onPressed: widget.onClick,
          child: widget.content ??
              Text(
                widget.text,
                style: TextStyle(
                  color:
                      widget.isEnabled() ? Colors.white : kOutlineBorderColor,
                ),
              ),
        ),
      ),
    );
  }

  void onHoverUpdate(bool hovering) {
    setState(() {
      _hovered = hovering;
    });
  }

  Color getBorderColor() {
    if (!widget.isEnabled()) {
      return kOutlineBorderColor;
    } else {
      return _hovered
          ? widget.enabledColor.withOpacity(0.20)
          : widget.enabledColor;
    }
  }

  Color getBackgroundColor() {
    if (!widget.isEnabled()) {
      return widget.disabledColor ?? widget.enabledColor;
    } else {
      if (_hovered) {
        return widget.enabledColor.withOpacity(0.77);
      } else {
        return widget.enabledColor;
      }
    }
  }
}
