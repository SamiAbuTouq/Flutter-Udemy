import 'package:flutter/material.dart';
import 'package:expense_tracker/widget/expenses.dart';
import 'themes/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _isLightMode = true;

  void toggleTheme() {
    setState(() {
      _isLightMode = !_isLightMode;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      darkTheme: darkTheme,
      theme: lightTheme,
      themeMode: _isLightMode ? ThemeMode.light : ThemeMode.dark,
      home: Expenses(toggleTheme: toggleTheme),
    );
  }
}
