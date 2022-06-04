import 'package:digital_card_website/constants.dart';
import 'package:flutter/material.dart';

class NotificationCard extends StatelessWidget {
  final String message;
  final VoidCallback close;
  const NotificationCard({
    Key? key,
    required this.message,
    required this.close,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      // A Notification Card can only have a max width of 500,
      // Which is the default minimum width size for browsers
      // And fits mobile screen
      constraints: const BoxConstraints(maxWidth: 500, minWidth: 400),
      child: Card(
        color: kNotificationCardColor,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            children: [
              Expanded(
                child: SelectableText(
                  message,
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              ),
              IconButton(
                onPressed: close,
                icon: const Icon(Icons.close_sharp, size: 20),
              )
            ],
          ),
        ),
      ),
    );
  }
}
