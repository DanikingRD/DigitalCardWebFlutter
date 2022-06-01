import 'package:digital_card_website/home/widgets/header_text.dart';
import 'package:flutter/material.dart';

class CalendarPanel extends StatelessWidget {
  const CalendarPanel({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          Row(
            children: [
              const Expanded(
                child: HeaderText(text: 'Calendar'),
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.calendar_month),
                tooltip: 'calendar',
              )
            ],
          )
        ],
      ),
    );
  }
}
