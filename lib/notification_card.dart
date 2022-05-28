import 'package:digital_card_website/colors.dart';
import 'package:flutter/material.dart';

class NotificationCard extends StatelessWidget {
  final String message;
  VoidCallback close;
  NotificationCard({
    Key? key,
    required this.message,
    required this.close,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(
        maxHeight: 200,
        maxWidth: 400,
      ),
      child: Card(
        color: kNotificationCardColor,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  message,
                  style: const TextStyle(
                    fontSize: 18,
                    wordSpacing: 2.0,
                  ),
                ),
              ),
              IconButton(
                onPressed: close,
                icon: const Icon(Icons.close),
              )
            ],
          ),
        ),
      ),
    );
  }
}
