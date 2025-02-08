import 'package:flutter/material.dart';
import 'package:shopping_list_app/widgets/grocery_list.dart';

void main() {
  runApp(const MyApp());
}

ThemeData theme = ThemeData.dark().copyWith(
  colorScheme: ColorScheme.fromSeed(
    seedColor: const Color.fromARGB(255, 147, 229, 250),
    brightness: Brightness.dark,
    surface: const Color.fromARGB(255, 42, 51, 59),
    secondary: const Color.fromARGB(255, 168, 237, 255),
    tertiary: const Color.fromARGB(255, 147, 202, 250),
  ),
  scaffoldBackgroundColor: const Color.fromARGB(255, 50, 58, 60),
  textTheme: const TextTheme(
    headlineLarge: TextStyle(
      fontSize: 28,
      fontWeight: FontWeight.bold,
      letterSpacing: 0.5,
    ),
    bodyLarge: TextStyle(
      fontSize: 16,
      letterSpacing: 0.25,
    ),
    bodyMedium: TextStyle(
      fontSize: 14,
      letterSpacing: 0.25,
    ),
  ),
  textButtonTheme: TextButtonThemeData(
    style: TextButton.styleFrom(
      foregroundColor: const Color.fromARGB(255, 147, 229, 250),
      textStyle: const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w500,
        letterSpacing: 0.5,
      ),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
    ),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      foregroundColor: Colors.black87,
      backgroundColor: const Color.fromARGB(255, 147, 229, 250),
      elevation: 4,
      textStyle: const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w500,
        letterSpacing: 0.5,
      ),
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
    ),
  ),
  inputDecorationTheme: InputDecorationTheme(
    filled: true,
    fillColor: const Color.fromARGB(255, 42, 51, 59),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: const BorderSide(
        color: Color.fromARGB(255, 147, 229, 250),
      ),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: const BorderSide(
        color: Color.fromARGB(255, 147, 229, 250),
        width: 1.0,
      ),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: const BorderSide(
        color: Color.fromARGB(255, 168, 237, 255),
        width: 2.0,
      ),
    ),
    labelStyle: const TextStyle(
      color: Color.fromARGB(255, 147, 229, 250),
    ),
    contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
  ),
);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: theme,
      home: const GroceryList(),
    );
  }
}
