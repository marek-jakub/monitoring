import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/// Holds application theme definition.
///
/// Two definitions, light and dark mode.
class MonitoRingTheme {
  static TextTheme lightTextTheme = TextTheme(
    displayLarge: GoogleFonts.openSans(
      fontSize: 18,
      fontWeight: FontWeight.bold,
      color: Colors.black,
    ),
    displayMedium: GoogleFonts.openSans(
      fontSize: 16,
      fontWeight: FontWeight.w700,
      color: Colors.black,
    ),
    displaySmall: GoogleFonts.openSans(
      fontSize: 12,
      fontWeight: FontWeight.w600,
      color: Colors.black,
    ),
    headlineLarge: GoogleFonts.openSans(
      fontSize: 18.0,
      fontWeight: FontWeight.bold,
      color: Colors.black,
    ),
    headlineMedium: GoogleFonts.openSans(
      fontSize: 16.0,
      fontWeight: FontWeight.w700,
      color: Colors.black,
    ),
    headlineSmall: GoogleFonts.openSans(
      fontSize: 14.0,
      fontWeight: FontWeight.w600,
      color: Colors.black,
    ),
    titleLarge: GoogleFonts.openSans(
      fontSize: 18.0,
      fontWeight: FontWeight.w600,
      color: Colors.black,
    ),
    titleMedium: GoogleFonts.openSans(
      fontSize: 16.0,
      fontWeight: FontWeight.w600,
      color: Colors.black,
    ),
    titleSmall: GoogleFonts.openSans(
      fontSize: 15.0,
      fontWeight: FontWeight.w600,
      color: Colors.black,
    ),
    labelLarge: GoogleFonts.openSans(
      fontSize: 18,
      fontWeight: FontWeight.normal,
      color: Colors.black,
    ),
    labelMedium: GoogleFonts.openSans(
      fontSize: 14,
      fontWeight: FontWeight.normal,
      color: Colors.black,
    ),
    labelSmall: GoogleFonts.openSans(
      fontSize: 12,
      fontWeight: FontWeight.normal,
      color: Colors.black,
    ),
    bodyLarge: GoogleFonts.openSans(
      fontSize: 16.0,
      fontWeight: FontWeight.w700,
      color: Colors.black,
    ),
    bodyMedium: GoogleFonts.openSans(
      fontSize: 14.0,
      fontWeight: FontWeight.w700,
      color: Colors.black,
    ),
    bodySmall: GoogleFonts.openSans(
      fontSize: 12.0,
      fontWeight: FontWeight.w700,
      color: Colors.black,
    ),
  );

  static TextTheme darkTextTheme = TextTheme(
    displayLarge: GoogleFonts.openSans(
      fontSize: 18,
      fontWeight: FontWeight.bold,
      color: Colors.grey[300],
    ),
    displayMedium: GoogleFonts.openSans(
      fontSize: 16,
      fontWeight: FontWeight.w700,
      color: Colors.grey[300],
    ),
    displaySmall: GoogleFonts.openSans(
      fontSize: 12,
      fontWeight: FontWeight.w600,
      color: Colors.grey[300],
    ),
    headlineLarge: GoogleFonts.openSans(
      fontSize: 18.0,
      fontWeight: FontWeight.bold,
      color: Colors.grey[300],
    ),
    headlineMedium: GoogleFonts.openSans(
      fontSize: 16.0,
      fontWeight: FontWeight.w700,
      color: Colors.grey[300],
    ),
    headlineSmall: GoogleFonts.openSans(
      fontSize: 14.0,
      fontWeight: FontWeight.w600,
      color: Colors.grey[300],
    ),
    titleLarge: GoogleFonts.openSans(
      fontSize: 18.0,
      fontWeight: FontWeight.w600,
      color: Colors.grey[300],
    ),
    titleMedium: GoogleFonts.openSans(
      fontSize: 16.0,
      fontWeight: FontWeight.w600,
      color: Colors.grey[300],
    ),
    titleSmall: GoogleFonts.openSans(
      fontSize: 15.0,
      fontWeight: FontWeight.w600,
      color: Colors.grey[300],
    ),
    labelLarge: GoogleFonts.openSans(
      fontSize: 18,
      fontWeight: FontWeight.normal,
      color: Colors.grey[300],
    ),
    labelMedium: GoogleFonts.openSans(
      fontSize: 14,
      fontWeight: FontWeight.normal,
      color: Colors.grey[300],
    ),
    labelSmall: GoogleFonts.openSans(
      fontSize: 12,
      fontWeight: FontWeight.normal,
      color: Colors.grey[300],
    ),
    bodyLarge: GoogleFonts.openSans(
      fontSize: 16.0,
      fontWeight: FontWeight.w700,
      color: Colors.grey[300],
    ),
    bodyMedium: GoogleFonts.openSans(
      fontSize: 14.0,
      fontWeight: FontWeight.w700,
      color: Colors.grey[300],
    ),
    bodySmall: GoogleFonts.openSans(
      fontSize: 12.0,
      fontWeight: FontWeight.w700,
      color: Colors.grey[300],
    ),
  );

  // Custom color used for dark theme swatch
  static Map<int, Color> colorLightSwatch = {
    50: const Color.fromRGBO(250, 250, 250, 1),
    100: const Color.fromRGBO(250, 250, 250, 0.9),
    200: const Color.fromRGBO(250, 250, 250, 0.8),
    300: const Color.fromRGBO(250, 250, 250, 0.7),
    400: const Color.fromRGBO(250, 250, 250, 0.6),
    500: const Color.fromRGBO(250, 250, 250, 0.5),
    600: const Color.fromRGBO(250, 250, 250, 0.4),
    700: const Color.fromRGBO(250, 250, 250, 0.3),
    800: const Color.fromRGBO(250, 250, 250, 0.2),
    900: const Color.fromRGBO(250, 250, 250, 0.1),
  };

  static MaterialColor customLightSwatch =
      MaterialColor(0xFF90A4AE, colorLightSwatch);

  static ThemeData light() {
    return ThemeData(
      brightness: Brightness.light,
      primarySwatch: customLightSwatch,
      scaffoldBackgroundColor: Colors.grey[200],
      checkboxTheme:
          CheckboxThemeData(fillColor: MaterialStateColor.resolveWith((states) {
        return Colors.black;
      })),
      appBarTheme: AppBarTheme(
        titleTextStyle: const TextStyle(fontSize: 14.0, color: Colors.black),
        centerTitle: true,
        foregroundColor: Colors.grey[800],
        backgroundColor: Colors.white,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
          textStyle: MaterialStateProperty.all(
            const TextStyle(
              fontSize: 14,
            ),
          ),
          minimumSize: MaterialStateProperty.all(
            const Size(100, 40),
          ),
        ),
      ),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        extendedTextStyle: const TextStyle(
          fontSize: 14,
        ),
        foregroundColor: Colors.white,
        backgroundColor: Colors.grey[800],
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        selectedItemColor: Colors.green,
      ),
      inputDecorationTheme: const InputDecorationTheme(
        border: OutlineInputBorder(
          borderSide: BorderSide(
            width: 1.0,
            color: Colors.black,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.green),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.red),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.red),
        ),
      ),
      cardColor: Colors.grey.shade400,
      cardTheme: const CardTheme(
        shape: RoundedRectangleBorder(),
      ),
      expansionTileTheme: ExpansionTileThemeData(
        textColor: Colors.black,
        collapsedBackgroundColor: Colors.grey[300],
        backgroundColor: Colors.grey[350],
      ),
      listTileTheme: const ListTileThemeData(
        style: ListTileStyle.list,
        tileColor: Colors.white,
        textColor: Colors.black,
        titleTextStyle: TextStyle(fontSize: 14.0),
      ),
      dropdownMenuTheme: const DropdownMenuThemeData(
        textStyle: TextStyle(
          fontSize: 14,
        ),
      ),
      textTheme: lightTextTheme,
    );
  }

  // Custom color used for dark theme swatch
  static Map<int, Color> colorDarkSwatch = {
    50: const Color.fromRGBO(250, 250, 250, 0.1),
    100: const Color.fromRGBO(250, 250, 250, 0.2),
    200: const Color.fromRGBO(250, 250, 250, 0.3),
    300: const Color.fromRGBO(250, 250, 250, 0.4),
    400: const Color.fromRGBO(250, 250, 250, 0.5),
    500: const Color.fromRGBO(250, 250, 250, 0.6),
    600: const Color.fromRGBO(250, 250, 250, 0.7),
    700: const Color.fromRGBO(250, 250, 250, 0.8),
    800: const Color.fromRGBO(250, 250, 250, 0.9),
    900: const Color.fromRGBO(250, 250, 250, 1),
  };

  static MaterialColor customDarkSwatch =
      MaterialColor(0x99FFFFFF, colorDarkSwatch);

  static ThemeData dark() {
    return ThemeData(
      brightness: Brightness.dark,
      primarySwatch: customDarkSwatch,
      scaffoldBackgroundColor: Colors.grey[800],
      checkboxTheme:
          CheckboxThemeData(fillColor: MaterialStateColor.resolveWith((states) {
        return Colors.grey;
      })),
      appBarTheme: AppBarTheme(
        titleTextStyle: const TextStyle(fontSize: 14.0, color: Colors.white),
        centerTitle: true,
        foregroundColor: Colors.white,
        backgroundColor: Colors.grey[800],
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
          textStyle: MaterialStateProperty.all(
            const TextStyle(
              fontSize: 14,
            ),
          ),
          minimumSize: MaterialStateProperty.all(
            const Size(100, 40),
          ),
        ),
      ),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        extendedTextStyle: TextStyle(
          fontSize: 14,
        ),
        foregroundColor: Colors.white,
        backgroundColor: Colors.grey,
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        selectedItemColor: Colors.green,
      ),
      inputDecorationTheme: const InputDecorationTheme(
        border: OutlineInputBorder(
          borderSide: BorderSide(
            width: 1.0,
            color: Colors.white,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.green),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.red),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.red),
        ),
      ),
      cardColor: Colors.blueGrey,
      cardTheme: const CardTheme(
        shape: RoundedRectangleBorder(),
      ),
      expansionTileTheme: ExpansionTileThemeData(
        textColor: Colors.white,
        collapsedBackgroundColor: Colors.grey[600],
        backgroundColor: Colors.grey[700],
      ),
      listTileTheme: ListTileThemeData(
        style: ListTileStyle.list,
        tileColor: Colors.grey[800],
        textColor: Colors.white,
        titleTextStyle: const TextStyle(fontSize: 14.0),
      ),
      dropdownMenuTheme: const DropdownMenuThemeData(
        textStyle: TextStyle(
          fontSize: 14,
        ),
      ),
      textTheme: darkTextTheme,
    );
  }
}
