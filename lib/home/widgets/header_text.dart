import 'package:flutter/cupertino.dart';

class HeaderText extends StatelessWidget {
  final String text;
  const HeaderText({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w800),
    );
  }
}
