import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:meals_app/screens/tabs.dart';

final theme = ThemeData(
  useMaterial3: true,
  colorScheme: ColorScheme.fromSeed(
    brightness: Brightness.dark,
    seedColor: const Color.fromARGB(255, 82, 182, 255),
    secondary: const Color.fromARGB(255, 82, 182, 255),
  ),
  textTheme: GoogleFonts.latoTextTheme().copyWith(
    displayLarge: GoogleFonts.lato(
      fontSize: 32,
      fontWeight: FontWeight.bold,
      letterSpacing: -0.5,
    ),
    titleLarge: GoogleFonts.lato(
      fontSize: 22,
      fontWeight: FontWeight.w600,
      letterSpacing: 0.15,
    ),
    bodyLarge: GoogleFonts.lato(
      fontSize: 16,
      letterSpacing: 0.5,
    ),
  ),
  iconButtonTheme: IconButtonThemeData(
    style: ElevatedButton.styleFrom(
      iconColor: const Color.fromARGB(255, 82, 182, 255),
    ),
  ),
);

void main() {
  runApp(
    const ProviderScope(
      child: App(),
    ),
  );
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: theme,
      home: const TabsScreen(),
    );
  }
}
