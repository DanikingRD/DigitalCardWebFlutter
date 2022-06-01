import 'package:digital_card_website/authentication/login_screen.dart';
import 'package:digital_card_website/colors.dart';
import 'package:digital_card_website/home/home_screen.dart';
import 'package:digital_card_website/provider/menu_provider.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'firebase_options.dart';

void main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(
    ChangeNotifierProvider(
      create: (_) => MenuProvider(),
      child: const App(),
    ),
  );
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final family = GoogleFonts.merriweather().fontFamily;

    return MaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: const AppBarTheme(
          color: Colors.transparent,
          elevation: 0.0,
        ),
        brightness: Brightness.light,
        textTheme: GoogleFonts.mulishTextTheme().apply().copyWith(
              headlineLarge: TextStyle(
                color: kGreyTextColor,
                fontSize: 44,
                fontFamily: family,
                fontWeight: FontWeight.w600,
              ),
              headlineMedium: const TextStyle(
                color: kGreyTextColor,
                fontSize: 34,
                fontWeight: FontWeight.w600,
              ),
              bodyLarge: TextStyle(
                fontSize: 16,
                height: 1.7,
                fontFamily: family,
              ),
            ),
      ),
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}
