import 'package:flutter/material.dart';
import 'pages/game_page.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) => MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'Tic Tac Toe',
    theme: ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(
        seedColor: const Color(0xFF146B60),
        surface: const Color(0xFFFFFCF5),
      ),
      scaffoldBackgroundColor: const Color(0xFFF4F1E8),
      textTheme: ThemeData.light().textTheme.apply(
        bodyColor: const Color(0xFF202D2B),
        displayColor: const Color(0xFF202D2B),
      ),
      filledButtonTheme: FilledButtonThemeData(
        style: FilledButton.styleFrom(minimumSize: const Size(48, 52)),
      ),
    ),
    home: const GamePage(),
  );
}
