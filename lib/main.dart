import 'package:digital_card_website/authentication/auth_gateway.dart';
import 'package:digital_card_website/backend/authentication.dart';
import 'package:digital_card_website/constants.dart';
import 'package:digital_card_website/home/layout.dart';
import 'package:digital_card_website/provider/dashboard_navigator_provider.dart';
import 'package:digital_card_website/provider/menu_provider.dart';
import 'package:digital_card_website/routes.dart';
import 'package:firebase_auth/firebase_auth.dart';
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
        ChangeNotifierProvider<MenuProvider>(
          create: (_) => MenuProvider(),
        ),
        ChangeNotifierProvider<DashboardNavigatorProvider>(
          create: (_) => DashboardNavigatorProvider(),
        ),
        Provider<FirebaseAuthService>(
          create: (_) => FirebaseAuthService(),
        ),
        StreamProvider<User?>(
          create: (context) => context.read<FirebaseAuthService>().authState(),
          initialData: null,
        ),
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
        textTheme: GoogleFonts.poppinsTextTheme(),
        scaffoldBackgroundColor: kDashBgColor,
      ),
      home: const AuthGateway(),
      onGenerateRoute: GlobalRoutes.generateRoute,
    );
  }
}
