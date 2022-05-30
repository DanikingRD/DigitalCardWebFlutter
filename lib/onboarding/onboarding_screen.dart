import 'package:digital_card_website/colors.dart';
import 'package:digital_card_website/onboarding/steps/personal_details_step.dart';
import 'package:digital_card_website/primary_button.dart';
import 'package:flutter/material.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  int activeState = 0;
  static const _stepslength = 4;

  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context);
    return Scaffold(
      body: Row(
        children: [
          Expanded(
            flex: 2,
            child: Container(
              color: kPrimaryColor,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 46),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    SizedBox(
                      height: 40,
                    ),
                    Text(
                      'Company Logo',
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                    Spacer(),
                    Text(
                      "Let's go!",
                      style: TextStyle(color: Colors.white, fontSize: 40),
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    Text(
                      "Create your digital business card in under 2 minutes and take your networking to the next level",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                      ),
                    ),
                    Spacer(),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(
            width: 70,
          ),
          Expanded(
            flex: 3,
            child: Theme(
              data: ThemeData.from(
                textTheme: textStyle.textTheme,
                colorScheme: textStyle.colorScheme.copyWith(
                  primary: kActiveStepColor,
                  background: Colors.white,
                ),
              ),
              child: Stepper(
                elevation: 0.0,
                type: StepperType.horizontal,
                currentStep: activeState,
                physics: const NeverScrollableScrollPhysics(),
                onStepTapped: null,
                onStepContinue: () {
                  if (activeState != _stepslength) {
                    setState(() {
                      activeState++;
                    });
                  }
                },
                onStepCancel: () {
                  if (activeState != 0) {
                    setState(() {
                      activeState--;
                    });
                  }
                },
                steps: [
                  Step(
                    state: getStateFor(0),
                    isActive: activeState >= 0,
                    title: Text(
                      'Personal Details',
                      style: TextStyle(
                        color: _getColorFor(0),
                      ),
                    ),
                    content: const PersonalDetailsStep(),
                  ),
                  Step(
                    state: getStateFor(1),
                    isActive: activeState >= 1,
                    title: Text(
                      'Customize your card',
                      style: TextStyle(
                        color: _getColorFor(1),
                      ),
                    ),
                    content: const PersonalDetailsStep(),
                  ),
                  Step(
                    state: getStateFor(2),
                    isActive: activeState >= 2,
                    title: Text(
                      'Create an account',
                      style: TextStyle(
                        color: _getColorFor(2),
                      ),
                    ),
                    content: const PersonalDetailsStep(),
                  ),
                  Step(
                    state: getStateFor(3),
                    isActive: activeState >= 3,
                    title: Text(
                      'Get your card',
                      style: TextStyle(
                        color: _getColorFor(3),
                      ),
                    ),
                    content: const PersonalDetailsStep(),
                  ),
                ],
                controlsBuilder: (context, details) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 80),
                    child: Align(
                      alignment: Alignment.topRight,
                      child: SizedBox(
                        width: 240,
                        height: 40,
                        child: PrimaryButton(
                          onClick: details.onStepContinue,
                          text: 'Next',
                          isEnabled: () => true,
                          enabledColor: kPrimaryColor,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
          Expanded(child: Container()),
        ],
      ),
    );
  }

  Color _getColorFor(int i) {
    if (activeState == i || getStateFor(i) == StepState.complete) {
      return kActiveStepColorText;
    } else {
      return kGreyText;
    }
  }

  StepState getStateFor(int i) {
    return activeState > i ? StepState.complete : StepState.disabled;
  }
}
