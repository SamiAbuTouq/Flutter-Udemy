import 'package:favorite_places/screens/places.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:google_fonts/google_fonts.dart';

final colorScheme = ColorScheme.fromSeed(
  brightness: Brightness.dark,
  seedColor: const Color.fromARGB(255, 0, 110, 255),
  surface: const Color.fromARGB(255, 18, 18, 18),
  surfaceTint: const Color.fromARGB(255, 30, 30, 30),
);

final theme = ThemeData(
  colorScheme: colorScheme,
  scaffoldBackgroundColor: colorScheme.surface,
  textTheme: GoogleFonts.rajdhaniTextTheme(ThemeData.dark().textTheme).copyWith(
    titleSmall: GoogleFonts.rajdhani(
      fontWeight: FontWeight.bold,
      color: colorScheme.onSurface,
    ),
    titleMedium: GoogleFonts.rajdhani(
      fontWeight: FontWeight.bold,
      color: colorScheme.onSurface,
    ),
    titleLarge: GoogleFonts.rajdhani(
      fontWeight: FontWeight.bold,
      color: colorScheme.onSurface,
    ),
    bodyLarge: GoogleFonts.rajdhani(
      fontSize: 20,
      color: colorScheme.onSurface,
    ),
  ),
  // Enhance text input theme
  inputDecorationTheme: InputDecorationTheme(
    filled: true,
    fillColor: colorScheme.surfaceVariant,
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: BorderSide.none,
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: BorderSide(color: colorScheme.primary, width: 2),
    ),
    labelStyle: TextStyle(color: colorScheme.onSurfaceVariant),
    hintStyle: TextStyle(color: colorScheme.onSurfaceVariant.withOpacity(0.7)),
  ),
  // Enhance text buttons
  textButtonTheme: TextButtonThemeData(
    style: TextButton.styleFrom(
      foregroundColor: colorScheme.primary,
      textStyle:
          GoogleFonts.rajdhani(fontWeight: FontWeight.bold, fontSize: 16),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
    ).copyWith(
      overlayColor: MaterialStateProperty.resolveWith(
        (states) => states.contains(MaterialState.pressed)
            ? colorScheme.primary.withOpacity(0.1)
            : null,
      ),
    ),
  ),
  // Enhance icon buttons
  iconButtonTheme: IconButtonThemeData(
    style: IconButton.styleFrom(
      foregroundColor: colorScheme.primary,
      backgroundColor: colorScheme.surface,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    ).copyWith(
      overlayColor: MaterialStateProperty.resolveWith(
        (states) => states.contains(MaterialState.pressed)
            ? colorScheme.primary.withOpacity(0.1)
            : null,
      ),
    ),
  ),
);

void main() {
  runApp(
    const ProviderScope(child: MyApp()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: theme,
      home: const PlacesScreen(),
    );
  }
}
