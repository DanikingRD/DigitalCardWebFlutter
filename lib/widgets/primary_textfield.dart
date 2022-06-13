import 'package:digital_card_website/constants.dart';
import 'package:flutter/material.dart';

class PrimaryTextField extends StatelessWidget {
  final TextEditingController? controller;
  final String? label;
  final FormFieldSetter<String>? onSaved;
  final FormFieldValidator<String>? validator;
  final bool hiddenText;
  final Widget? suffixIcon;
  final ValueChanged<String>? onUpdate;
  final ValueChanged<String>? onFieldSubmitted;
  final String? initialValue;
  final bool autoFocus;
  final TextStyle? labelStyle;
  const PrimaryTextField({
    Key? key,
    this.controller,
    this.onSaved,
    this.validator,
    this.hiddenText = false,
    this.suffixIcon,
    this.label,
    this.onUpdate,
    this.onFieldSubmitted,
    this.initialValue,
    this.autoFocus = true,
    this.labelStyle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const errorBorder = OutlineInputBorder(
      borderSide: BorderSide(
        width: 1.0,
        color: kSecondaryColor,
      ),
    );
    return TextFormField(
      autofocus: autoFocus,
      initialValue: initialValue,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      cursorColor: Colors.black,
      cursorWidth: 1.0,
      onFieldSubmitted: onFieldSubmitted,
      controller: controller,
      validator: validator,
      onChanged: onUpdate,
      onSaved: onSaved,
      keyboardType: TextInputType.none,
      obscureText: hiddenText,
      decoration: InputDecoration(
        suffixIcon: suffixIcon,
        contentPadding: const EdgeInsets.all(12),
        errorMaxLines: 1,
        errorStyle: const TextStyle(
          color: kSecondaryColor,
          fontSize: 12,
        ),
        labelText: label,
        labelStyle: labelStyle ??
            const TextStyle(
              color: kOutlineBorderColor,
              fontSize: 12,
            ),
        errorBorder: errorBorder,
        focusedBorder: errorBorder,
        focusedErrorBorder: errorBorder,
        border: const OutlineInputBorder(
          borderSide: BorderSide(
            width: 1.0,
            color: kOutlineBorderColor,
          ),
        ),
      ),
    );
  }
}
