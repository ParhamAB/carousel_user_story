import 'package:carousel_user_story/configs/color_palette.dart';
import 'package:flutter/material.dart';
import 'package:carousel_user_story/configs/gen/fonts.gen.dart';

ThemeData myTheme(BuildContext context) {
  return ThemeData(
    colorScheme: ColorScheme.fromSeed(seedColor: ColorPalette.primary),
    useMaterial3: true,
    scaffoldBackgroundColor: ColorPalette.background,
    fontFamily: FontFamily.iranianSans,
    appBarTheme: const AppBarTheme(backgroundColor: ColorPalette.background),
    elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
            foregroundColor:
                WidgetStateProperty.resolveWith((Set<WidgetState> states) {
              if (states.contains(WidgetState.disabled)) {
                return ColorPalette.font2;
              }
              return Colors.white;
            }),
            backgroundColor:
                WidgetStateProperty.resolveWith((Set<WidgetState> states) {
              return ColorPalette.secondary;
            }),
            shape: WidgetStateProperty.all(RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            )),
            textStyle:
                WidgetStateProperty.resolveWith((Set<WidgetState> states) {
              if (states.contains(WidgetState.disabled)) {
                return const TextStyle(
                    fontSize: 16,
                    fontFamily: FontFamily.iranianSans,
                    color: ColorPalette.font2,
                    fontWeight: FontWeight.bold);
              }
              return const TextStyle(
                  fontSize: 16,
                  fontFamily: FontFamily.iranianSans,
                  color: ColorPalette.font1,
                  fontWeight: FontWeight.bold);
            }),
            minimumSize: WidgetStateProperty.all(const Size(300, 44)))),
    inputDecorationTheme: InputDecorationTheme(
        fillColor: ColorPalette.greyColor,
        filled: true,
        isDense: true,
        labelStyle: TextStyle(
            letterSpacing: 0,
            wordSpacing: 1,
            color: Colors.grey.shade400,
            fontFamily: FontFamily.iranianSans,
            fontSize: 14,
            fontWeight: FontWeight.normal),
        hintStyle: TextStyle(
            letterSpacing: 0,
            wordSpacing: 1,
            fontSize: 14,
            fontFamily: FontFamily.iranianSans,
            color: Colors.grey.shade400),
        focusedBorder: _border(),
        border: _border(),
        enabledBorder: _border(),
        errorBorder: _border(),
        disabledBorder: _border(),
        focusedErrorBorder: _border(),
        errorStyle: const TextStyle(fontSize: 10, height: .5),
        contentPadding: const EdgeInsets.fromLTRB(10, 10, 10, 10)),
    textTheme: const TextTheme(
      bodySmall: TextStyle(
          fontFamily: FontFamily.iranianSans,
          color: ColorPalette.font1,
          fontSize: 12),
      bodyMedium: TextStyle(
          fontFamily: FontFamily.iranianSans,
          color: ColorPalette.font1,
          fontSize: 14),
      bodyLarge: TextStyle(
          fontFamily: FontFamily.iranianSans,
          color: ColorPalette.font1,
          fontSize: 16,
          fontWeight: FontWeight.bold),
    ),
  );
}

OutlineInputBorder _border() {
  return OutlineInputBorder(
      borderRadius: BorderRadius.circular(10), borderSide: BorderSide.none);
}
