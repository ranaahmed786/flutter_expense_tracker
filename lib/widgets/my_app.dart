import 'package:flutter/material.dart';
import 'package:flutter_expense_tracker/widgets/expenses.dart';
import 'package:google_fonts/google_fonts.dart';

final kcolorScheme = ColorScheme.fromSeed(
  seedColor: const Color.fromARGB(255, 5, 184, 200),
);
final kdarkColorScheme = ColorScheme.fromSeed(
  seedColor: const Color.fromARGB(255, 63, 3, 109),
  brightness: Brightness.dark,
);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Expense Tracker',
      darkTheme: ThemeData.dark().copyWith(
        colorScheme: kdarkColorScheme,
        appBarTheme: const AppBarTheme().copyWith(
          backgroundColor: kdarkColorScheme.onPrimaryContainer,
          foregroundColor: kdarkColorScheme.primaryContainer,
        ),
        cardTheme: const CardThemeData().copyWith(
          color: kdarkColorScheme.primary,
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: kdarkColorScheme.primaryContainer,
            foregroundColor: kdarkColorScheme.onPrimaryContainer,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5),
            ),
          ),
        ),
        textTheme: ThemeData().textTheme.copyWith(
          titleLarge: GoogleFonts.abrilFatface(
            fontSize: 24,
            color: kdarkColorScheme.onPrimaryContainer,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      theme: ThemeData().copyWith(
        colorScheme: kcolorScheme,
        appBarTheme: const AppBarTheme().copyWith(
          backgroundColor: kcolorScheme.onPrimaryContainer,
          foregroundColor: kcolorScheme.primaryContainer,
        ),
        cardTheme: const CardThemeData().copyWith(
          color: kcolorScheme.secondaryContainer,
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: kcolorScheme.primaryContainer,
            foregroundColor: kcolorScheme.onPrimaryContainer,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5),
            ),
          ),
        ),
        textTheme: ThemeData().textTheme.copyWith(
          titleLarge: GoogleFonts.abrilFatface(
            fontSize: 24,
            color: kcolorScheme.onPrimaryContainer,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      themeMode: ThemeMode.system,
      home: const Expenses(),
    );
  }
}
