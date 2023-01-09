import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const Color colorsBlack = Color(0xFF000000);
const Color colorsBlackGray = Color.fromARGB(255, 27, 27, 27);
const Color colorPrimary = Color(0xFF2E8EFF);
const Color colorWhite = Color(0xFFFFFFFF);
const Color colorGray = Color(0xFFEFEFEF);
const Color colorTextGray = Color(0xFF585858);
const Color buttonGray = Color(0xFFDEDEDE);
const Color borderGray = Color(0xFFE1E1E1);
const Color textGray = Color(0xFF595959);
const Color darkThemeText = Color.fromARGB(255, 135, 134, 134);

final ligthTheme = ThemeData(
  visualDensity: VisualDensity.adaptivePlatformDensity,
  primaryColor: colorPrimary,
  // primarySwatch: primaryCustomSwatch,
  brightness: Brightness.light,
  fontFamily: GoogleFonts.roboto().fontFamily,
  bottomSheetTheme:
      BottomSheetThemeData(backgroundColor: Colors.black.withOpacity(0)),
  scaffoldBackgroundColor: Colors.white,
  backgroundColor: Colors.white,
  textTheme: const TextTheme(
    bodyText1: TextStyle(),
    bodyText2: TextStyle(),
  ).apply(
    bodyColor: colorsBlack,
    displayColor: colorsBlack,
  ),
  colorScheme: const ColorScheme.light()
      .copyWith(primary: colorPrimary, onPrimary: colorPrimary)
      .copyWith(
        primary: colorPrimary,
        secondary: colorPrimary,
        brightness: Brightness.light,
      ),
  textSelectionTheme: const TextSelectionThemeData(cursorColor: colorPrimary),
);

final darkTheme = ThemeData(
  visualDensity: VisualDensity.adaptivePlatformDensity,
  primaryColor: colorPrimary,
  // primarySwatch: colorPrimary,
  backgroundColor: colorsBlack,
  progressIndicatorTheme: const ProgressIndicatorThemeData(
    color: Colors.white,
  ),
  brightness: Brightness.dark,
  textTheme: const TextTheme(
    bodyText1: TextStyle(),
    bodyText2: TextStyle(),
  ).apply(
    bodyColor: Colors.white,
    displayColor: Colors.white,
  ),
  fontFamily: GoogleFonts.roboto().fontFamily,
  bottomSheetTheme:
      BottomSheetThemeData(backgroundColor: Colors.black.withOpacity(0)),
  scaffoldBackgroundColor: colorsBlack,
  colorScheme: const ColorScheme.dark()
      .copyWith(primary: colorPrimary, onPrimary: colorPrimary)
      .copyWith(
        secondary: colorPrimary,
        brightness: Brightness.dark,
      ),
  textSelectionTheme: const TextSelectionThemeData(cursorColor: colorPrimary),
);
