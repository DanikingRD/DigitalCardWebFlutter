import 'package:digital_card_website/colors.dart';
import 'package:digital_card_website/primary_textfield.dart';
import 'package:digital_card_website/util.dart';
import 'package:flutter/material.dart';

class PersonalDetailsStep extends StatefulWidget {
  const PersonalDetailsStep({
    Key? key,
  }) : super(key: key);

  @override
  State<PersonalDetailsStep> createState() => _PersonalDetailsStepState();
}

class _PersonalDetailsStepState extends State<PersonalDetailsStep> {
  final TextEditingController _firstName = TextEditingController();
  final TextEditingController _lastName = TextEditingController();
  final TextEditingController _jobTitle = TextEditingController();
  final TextEditingController _phoneNumber = TextEditingController();
  final TextEditingController _companyName = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final GlobalKey<FormState> _userDetails = GlobalKey<FormState>();

  @override
  void dispose() {
    _firstName.dispose();
    _lastName.dispose();
    _jobTitle.dispose();
    _phoneNumber.dispose();
    _companyName.dispose();
    _email.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme;
    return Form(
      key: _userDetails,
      child: Align(
        alignment: Alignment.topLeft,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SelectableText(
              'Create your first card',
              style: textStyle.headlineMedium,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8),
              child: SizedBox(
                width: 580,
                child: SelectableText(
                  "You can add over 20 fields to your [Company] card including your socials, website, branding and more. First, let's start with your core details.",
                  style: textStyle.bodyLarge,
                ),
              ),
            ),
            const _FieldHeader(
              title: "Name",
              icon: Icons.account_circle_outlined,
            ),
            _fieldRow(
              first: PrimaryTextField(
                label: 'First Name',
                validator: (String? text) {
                  if (text!.isEmpty) {
                    return 'First name is required';
                  } else {
                    return null;
                  }
                },
              ),
              second: const PrimaryTextField(
                label: 'Last Name',
              ),
            ),
            const _FieldHeader(
              title: "Job title",
              icon: Icons.work,
            ),
            _fieldRow(
              first: const PrimaryTextField(label: 'Job Title'),
              second: const PrimaryTextField(label: 'Phone Number'),
            ),
            const _FieldHeader(
              title: "Company Name",
              icon: Icons.apartment,
            ),
            const PrimaryTextField(label: 'Company Name'),
            const _FieldHeader(
              title: "Email",
              icon: Icons.email,
            ),
            PrimaryTextField(
              label: 'Email',
              validator: (String? text) {
                if (text!.isEmpty) {
                  return 'Email is required';
                } else if (!isEmailValid(text)) {
                  return "This email address isn't valid";
                } else {
                  return null;
                }
              },
            ),
            const SizedBox(
              height: 26,
            ),
            const Center(
              child: SelectableText.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: 'By continuing, you agree to our ',
                    ),
                    TextSpan(
                      text: 'Privacy Policy ',
                      style: TextStyle(color: kActiveStepColorText),
                    ),
                    TextSpan(text: 'and '),
                    TextSpan(
                      text: 'Terms of Service',
                      style: TextStyle(color: kActiveStepColorText),
                    )
                  ],
                ),
              ),
            ),
            // Leave space for the button
            const SizedBox(
              height: 32,
            ),
          ],
        ),
      ),
    );
  }

  Widget _fieldRow({
    required Widget first,
    required Widget second,
  }) {
    return Row(
      children: [
        Expanded(
          child: first,
        ),
        const SizedBox(
          width: 32,
        ),
        Expanded(
          child: second,
        ),
      ],
    );
  }
}

class _FieldHeader extends StatelessWidget {
  final String title;
  final IconData icon;
  const _FieldHeader({
    required this.title,
    required this.icon,
  });
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 24, bottom: 8),
      child: Row(
        children: [
          Icon(
            icon,
            size: 24,
            color: kGreyText,
          ),
          const SizedBox(
            width: 8,
          ),
          Text(title),
        ],
      ),
    );
  }
}
