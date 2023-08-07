import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'constants.dart';

final theme = ThemeData(
  brightness: Brightness.dark,
  fontFamily: GoogleFonts.robotoMono().fontFamily,
  useMaterial3: true,
  primaryColor: const Color(0xFF68566D),
  hintColor: const Color(0xFFE6B89C),
  scaffoldBackgroundColor: const Color(0xFF000000),
  buttonTheme: ButtonThemeData(
    buttonColor: const Color(0xFF68566D),
    disabledColor: const Color(0xFFA092A6),
    textTheme: ButtonTextTheme.primary,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(8.0),
      side: const BorderSide(color: Color(0xFF68566D)),
    ),
  ),
  inputDecorationTheme: InputDecorationTheme(
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8.0),
      borderSide: const BorderSide(color: primaryColor),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8.0),
      borderSide: const BorderSide(color: primaryColor),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8.0),
      borderSide: const BorderSide(color: primaryButtonHoverColor),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8.0),
      borderSide: const BorderSide(color: alertColor),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8.0),
      borderSide: const BorderSide(color: alertColor),
    ),
    disabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8.0),
      borderSide: const BorderSide(color: disabledButtonColor),
    ),
    errorStyle: const TextStyle(color: alertColor),
  ),
);
