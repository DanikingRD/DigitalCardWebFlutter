import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:digital_card_website/backend/authentication.dart';
import 'package:digital_card_website/colors.dart';
import 'package:digital_card_website/main.dart';
import 'package:digital_card_website/notification_card.dart';
import 'package:digital_card_website/primary_button.dart';
import 'package:digital_card_website/primary_textfield.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final FirebaseAuthService _authInstance = FirebaseAuthService();
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  String? _errorMessage;
  bool _passwordHidden = true;
  bool _validEmail = false;

  bool _validPassword = false;
  bool _next = false;

  @override
  void initState() {
    super.initState();
    getUser();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void getUser() async {
    final query = await _firestore.collection('users').snapshots().first;
    for (var doc in query.docs) {
      print(doc.data());
    }
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
              content: Text("Successfully logged in as"),
            );
          },
        );
      },
      onError: (String? msg) {
        setState(() {
          _errorMessage =
              "There is no Blinq account associated with this email address. Click the sign up button to create a new account instead.";
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    const TextStyle style = TextStyle(color: Colors.black);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
        title: const Text(
          'Company Logo',
          style: style,
        ),
        actions: [
          TextButton(
            onPressed: () {},
            style: TextButton.styleFrom(
              primary: Colors.black,
            ),
            child: const Text(
              "Sign Up",
              style: TextStyle(fontSize: 18),
            ),
          ),
        ],
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
                  const Center(
                    child: SelectableText(
                      'Login',
                      style: TextStyle(
                        color: kGreyText,
                        fontWeight: FontWeight.w600,
                        fontSize: 44,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 32,
                  ),
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
                    height: 40,
                  ),
                  Align(
                    alignment: Alignment.topRight,
                    child: SizedBox(
                      width: 160,
                      height: 40,
                      child: PrimaryButton(
                        text: _next ? 'Log in' : 'Next',
                        enabledColor: kPrimaryColor,
                        hoverColor: kPrimaryHoverColor,
                        disabledColor: Colors.white,
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
                              await logIn();
                            }
                          }
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
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
