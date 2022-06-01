import 'package:digital_card_website/assets_path.dart';
import 'package:digital_card_website/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class UserProfile extends StatelessWidget {
  final String name;
  final VoidCallback onPressed;

  const UserProfile({
    required this.name,
    required this.onPressed,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: InkWell(
        onTap: onPressed,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            children: [
              _buildImage(),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _buildName(),
                    Text('My Job'),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildName() {
    return Text(
      name,
      style: TextStyle(
        fontWeight: FontWeight.bold,
        color: kFontColorPallets[0],
      ),
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
    );
  }

  Widget _buildImage() {
    return const CircleAvatar(
      radius: 25,
      backgroundImage: AssetImage(
        AssetsPath.avatar,
      ),
    );
  }
}
