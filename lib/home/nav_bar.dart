import 'package:flutter/material.dart';

AppBar navbar(BuildContext context, GlobalKey<ScaffoldState> key) {
  return AppBar(
    backgroundColor: Colors.blue,
    leading: Row(
      children: [
        IconButton(
          onPressed: () {
            key.currentState!.openDrawer();
          },
          icon: const Icon(Icons.menu),
        )
      ],
    ),
    title: Row(
      children: [
        Visibility(
          child: Text(
            'Dash',
            style: Theme.of(context).textTheme.bodyLarge,
          ),
        )
      ],
    ),
  );
}
