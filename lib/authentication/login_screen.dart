import 'package:digital_card_website/authentication/reset_password_body.dart';
import 'package:digital_card_website/backend/authentication.dart';
import 'package:digital_card_website/colors.dart';
import 'package:digital_card_website/notification_card.dart';
import 'package:digital_card_website/primary_button.dart';
import 'package:digital_card_website/primary_textfield.dart';
import 'package:digital_card_website/secondary_button.dart';
import 'package:digital_card_website/three_bounce_loading_indicator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen>
    with SingleTickerProviderStateMixin {
  // Authentication service
  final FirebaseAuthService _authInstance = FirebaseAuthService();
  // Textfield controllers
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  // LoginScreen state
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  String? _errorMessage;
  bool _passwordHidden = true;
  bool _validEmail = false;
  bool _validPassword = false;
  bool _next = false;
  bool _loading = false;
  bool _resetPassword = false;
  // Fade animation
  late AnimationController _fadeController;
  late Animation<double> _opacity;

  @override
  void initState() {
    super.initState();
    _fadeController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 250),
    );
    _opacity = Tween(begin: 0.0, end: 1.0).animate(_fadeController);
    _fadeController.forward();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _fadeController.dispose();
    super.dispose();
  }

  Future<void> logIn() async {
    return _authInstance.logIn(
      email: _emailController.text,
      password: _passwordController.text,
      onSuccess: (UserCredential creds) {
        setState(() {
          _errorMessage = null;
        });
        showDialog(
          context: context,
          builder: (ctx) {
            return const AlertDialog(
              content: Text("Successfully logged in"),
            );
          },
        );
      },
      onError: (String? msg) {
        setState(() {
          _errorMessage = msg;
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            const Spacer(),
            Text(
              'Company Logo',
              style: textTheme.bodyLarge,
            ),
            const Spacer(
              flex: 2,
            ),
            TextButton(
              onPressed: () {},
              style: TextButton.styleFrom(
                primary: Colors.black,
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 6,
                  horizontal: 16,
                ),
                child: Text(
                  "Sign Up",
                  style: textTheme.bodyLarge,
                ),
              ),
            ),
            const Spacer(),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 32, right: 32),
        child: Center(
          child: SizedBox(
            width: 450,
            child: Form(
              key: formKey,
              child: ListView(
                children: [
                  const SizedBox(
                    height: 120,
                  ),
                  Center(
                    child: SelectableText(
                      'Login',
                      style: textTheme.headlineLarge,
                    ),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  // Check with reset password
                  if (_errorMessage != null) ...{
                    NotificationCard(
                      message: _errorMessage!,
                      close: () {
                        setState(() {
                          _errorMessage = null;
                        });
                      },
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                  },
                  if (_resetPassword) ...{
                    FadeTransition(
                      opacity: _opacity,
                      child: ResetPasswordBody(
                        emailController: _emailController,
                        onError: (error) {
                          setState(() {
                            _errorMessage = error;
                          });
                        },
                        onReturn: () {
                          setState(() {
                            _resetPassword = false;
                            _fadeController.forward(from: 0.0);
                          });
                        },
                        authInstance: _authInstance,
                      ),
                    )
                  } else ...{
                    FadeTransition(
                      opacity: _opacity,
                      child: getLoginBody(),
                    )
                  }
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Column getLoginBody() {
    return Column(
      children: [
        PrimaryTextField(
          onUpdate: (val) {
            final bool isValid = isEmailValid(val);
            // Prevent calling setState on every keystroke
            if (_validEmail != isValid) {
              setState(() {
                _validEmail = isValid;
              });
            }
          },
          label: "Email",
          controller: _emailController,
          validator: (val) {
            if (!isEmailValid(val)) {
              return "This email address isn't valid";
            } else {
              return null;
            }
          },
        ),
        if (_next) ...{
          const SizedBox(
            height: 40,
          ),
          PrimaryTextField(
            label: "Password",
            controller: _passwordController,
            hiddenText: _passwordHidden,
            onUpdate: (val) {
              final bool validPassword = isValidPassword(val);
              if (_validPassword != validPassword) {
                setState(() {
                  _validPassword = validPassword;
                });
              }
            },
            validator: (val) {
              if (!isValidPassword(val)) {
                return "Wrong password";
              } else {
                return null;
              }
            },
            suffixIcon: IconButton(
              onPressed: () => setState(
                () => _passwordHidden = !_passwordHidden,
              ),
              icon: _passwordHidden
                  ? const Icon(
                      Icons.visibility_off,
                      color: kOutlineBorderColor,
                    )
                  : const Icon(
                      Icons.visibility,
                      color: kOutlineBorderColor,
                    ),
            ),
          ),
        },
        const SizedBox(
          height: 30,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            if (_next) ...{
              SecondaryButton(
                onClick: () {
                  setState(() {
                    _resetPassword = true;
                    _fadeController.forward(
                      from: 0.0,
                    );
                  });
                },
                text: 'Forgot Password?',
              ),
              const Spacer(),
            },
            SizedBox(
              width: 160,
              height: 40,
              child: PrimaryButton(
                text: _next ? 'Log in' : 'Next',
                enabledColor: kPrimaryColor,
                hoverColor: kPrimaryHoverColor,
                disabledColor: Colors.white,
                content: _loading
                    ? const ThreeBounceLoadingIndicator(
                        color: Colors.white,
                        size: 20.0,
                      )
                    : null,
                isEnabled: () {
                  // First we chick if email is there
                  if (!_next) {
                    return _validEmail;
                  } else {
                    return _validEmail && _validPassword;
                  }
                },
                onClick: () async {
                  if (!_next) {
                    if (_validEmail) {
                      setState(() {
                        _next = true;
                      });
                    }
                  } else {
                    if (_validEmail && _next && _validPassword) {
                      setState(() {
                        _loading = true;
                      });
                      await logIn();
                      setState(() {
                        _loading = false;
                      });
                    }
                  }
                },
              ),
            ),
          ],
        )
      ],
    );
  }

  bool isEmailValid(String? val) {
    return RegExp(
            r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
        .hasMatch(val!);
  }

  bool isValidPassword(String? val) {
    return val!.isNotEmpty && val.length > 5;
  }
}
