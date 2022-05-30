import 'package:digital_card_website/colors.dart';

import 'package:flutter/material.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme;
    return Scaffold(
        appBar: AppBar(
          title: Row(
            children: [
              Container(
                color: kPrimaryColor,
                child: Text(
                  'Company Logo',
                  style: textStyle.bodyLarge,
                ),
              ),
            ],
          ),
        ),
        body: Row(
          children: [
            Expanded(
              child: Container(
                color: kPrimaryColor,
                child: Column(
                  children: const [
                    SelectableText("Let's go!"),
                    SizedBox(
                      height: 20,
                    ),
                    SelectableText(
                      "Create your digital business card in under 2 minutes and take your networking to the next level!.",
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 16),
                    child: Row(
                      children: [
                        Column(
                          children: const [
                            Icon(Icons.one_k),
                            Text('Personal DEtails')
                          ],
                        ),
                      ],
                    ),
                  ),
                  SelectableText(
                    'Create your first card',
                    style: textStyle.headlineMedium,
                  ),
                  const SelectableText(
                    "You can add over 20 fields to your Blinq card including your socials, website, branding and more. First, let's start with your core details.",
                    style: TextStyle(color: kGreyText, fontSize: 18),
                  ),
                  const Spacer(
                    flex: 3,
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}
