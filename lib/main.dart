import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sharebible/component/landing_page.dart';
import 'package:sharebible/firebase_options.dart';
import 'package:sharebible/theme/dark_mode.dart';
import 'package:sharebible/theme/light_mode.dart';
import 'package:sharebible/theme/theme_notifier.dart';

void main() async {
  // Firebase setup
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  // Run app
  runApp(
    ChangeNotifierProvider(
      create: (context) => ThemeNotifier(),
      child: Builder(
        builder: (context) {
          return const MyApp();
        },
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final themeNotifier = Provider.of<ThemeNotifier>(context);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LandingPage(),
      darkTheme: darkMode,
      theme: lightMode,
      themeMode:
          themeNotifier.currentTheme == lightMode
              ? ThemeMode.light
              : ThemeMode.dark,
    );
  }
}
