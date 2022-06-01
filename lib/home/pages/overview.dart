import 'package:digital_card_website/home/widgets/header_text.dart';
import 'package:digital_card_website/util.dart';
import 'package:flutter/cupertino.dart';

class OverviewPage extends StatelessWidget {
  const OverviewPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 40,
        ),
        HeaderText(
          text: getCurrentDate(DateTime.now()),
        ),
      ],
    );
  }
}
