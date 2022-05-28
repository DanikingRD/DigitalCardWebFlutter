import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:digital_card_website/backend/authentication.dart';
import 'package:digital_card_website/colors.dart';
import 'package:digital_card_website/main.dart';
import 'package:digital_card_website/notification_card.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

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
  String? _errorMessage;
  bool _closeCard = false;

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

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final TextStyle style = TextStyle(color: Colors.black);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
        title: Text(
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
      body: Column(
        children: [
          Text(
            'Login',
            style: theme.textTheme.headline3!.copyWith(
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
          if (_errorMessage != null) ...{
            NotificationCard(
              message: _errorMessage!,
              close: () {},
            ),
            const SizedBox(
              height: 25,
            ),
          },
          TextField(
            controller: _emailController,
          ),
          const SizedBox(
            height: 40,
          ),
          TextField(
            controller: _passwordController,
          ),
          const SizedBox(
            height: 40,
          ),
          TextButton(
            onPressed: () async {
              await _authInstance.logIn(
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
            },
            style: ButtonStyle(
              overlayColor: MaterialStateProperty.all(Colors.transparent),
              backgroundColor: MaterialStateProperty.all(kPrimaryColor),
            ),
            child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 60, vertical: 12),
              child: Text(
                'Next',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
