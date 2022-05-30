import 'package:digital_card_website/authentication/login_screen.dart';
import 'package:digital_card_website/colors.dart';
import 'package:digital_card_website/onboarding/onboarding_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:google_fonts/google_fonts.dart';
import 'firebase_options.dart';

void main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final family = GoogleFonts.merriweather().fontFamily;
    final headlineLarge = TextStyle(
      color: kGreyText,
      fontSize: 44,
      fontFamily: family,
      fontWeight: FontWeight.w600,
    );
    return MaterialApp(
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          color: Colors.transparent,
          elevation: 0.0,
        ),
        brightness: Brightness.light,
        textTheme: GoogleFonts.merriweatherTextTheme().copyWith(
          headlineLarge: TextStyle(
            color: kGreyText,
            fontSize: 44,
            fontFamily: family,
            fontWeight: FontWeight.w600,
          ),
          headlineMedium: const TextStyle(
            color: kGreyText,
            fontSize: 34,
            fontWeight: FontWeight.w600,
          ),
          bodyLarge: TextStyle(
            fontSize: 16,
            fontFamily: family,
            fontWeight: FontWeight.w600,
          ),
        ),
        // Disable default splash effects
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        hoverColor: Colors.transparent,
      ),
      debugShowCheckedModeBanner: false,
      home: const OnboardingScreen(),
    );
  }
}
