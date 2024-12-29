import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sharebible/theme/dark_mode.dart';
import 'package:sharebible/theme/light_mode.dart';
import 'package:sharebible/theme/theme_notifier.dart';

void main() {
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

      darkTheme: darkMode,
      theme: lightMode,
      themeMode:
          themeNotifier.currentTheme == lightMode
              ? ThemeMode.light
              : ThemeMode.dark,
    );
  }
}
