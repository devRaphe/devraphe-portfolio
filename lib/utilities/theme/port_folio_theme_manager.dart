import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class PortFolioTheme {
  PortFolioTheme._();

  static ThemeData darkTheme = _themeData(_darkColorScheme);
  static ThemeData lightTheme = _themeData(_lightColorScheme);

  static _themeData(ColorScheme colorScheme) => ThemeData(
        scaffoldBackgroundColor: const Color(0xffea5e39).withOpacity(0.90),
        colorScheme: colorScheme,
        textTheme: GoogleFonts.poppinsTextTheme(_textTheme(colorScheme)),
        appBarTheme: _appBarTheme(colorScheme),
      );

  static final ColorScheme _darkColorScheme = const ColorScheme.dark().copyWith(
    primary: Colors.white,
    secondary: Colors.grey,
    background: const Color(0xffea5e39).withOpacity(0.90),
    surface: Colors.white,
  );

  static final ColorScheme _lightColorScheme = const ColorScheme.light()
      .copyWith(
          primary: const Color(0xffea5e39),
          secondary: Colors.grey,
          background: const Color(0xffea5e39).withOpacity(0.90),
          surface: Colors.white70,
          surfaceVariant: Colors.black54);

  static TextTheme _textTheme(ColorScheme colorScheme) => TextTheme(
        headline1: TextStyle(
          fontSize: 32.sp,
          fontWeight: FontWeight.bold,
          color: colorScheme.surface,
          height: 1.5,
        ),
        headline2: TextStyle(
          fontSize: 24.sp,
          fontWeight: FontWeight.w700,
          color: colorScheme.surface,
          height: 1.5,
        ),
        headline3: TextStyle(
          fontSize: 18.sp,
          fontWeight: FontWeight.w700,
          color: colorScheme.surface,
          height: 1.5,
        ),
        button: TextStyle(
          fontSize: 16.sp,
          fontWeight: FontWeight.w700,
          color: colorScheme.surface,
          height: 1.5,
        ),
        bodyText1: TextStyle(
          fontSize: 16.sp,
          fontWeight: FontWeight.w500,
          color: colorScheme.surface,
          height: 1.5,
        ),
        bodyText2: TextStyle(
          fontSize: 14.sp,
          fontWeight: FontWeight.w500,
          color: colorScheme.surface,
          height: 1.5,
        ),
      );

  static AppBarTheme _appBarTheme(ColorScheme colorScheme) => AppBarTheme(
        backgroundColor: colorScheme.background,
        centerTitle: true,
      );
}
