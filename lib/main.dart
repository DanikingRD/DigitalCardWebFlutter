import 'package:digital_card_website/constants.dart';
import 'package:digital_card_website/home/layout.dart';
import 'package:digital_card_website/provider/dashboard_navigator_provider.dart';
import 'package:digital_card_website/provider/menu_provider.dart';
import 'package:digital_card_website/routes.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'firebase_options.dart';

void main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => MenuProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => DashboardNavigatorProvider(),
        )
      ],
      child: const App(),
    ),
  );
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.light,
        fontFamily: GoogleFonts.poppins().fontFamily,
      ),
      home: const HomeScreenLayout(),
    );
  }
}
