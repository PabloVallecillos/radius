import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../utils/custom_material_color.dart';

/// routes
const String loginRoute = '/login';
const String homeRoute = '/';

const Color primary = Color(0xffffb100);
const Color secondary = Color(0xff243763);

/// themes
ThemeData lightTheme = ThemeData(
  primarySwatch: CustomMaterialColor(255, 177, 0).mdColor,
  brightness: Brightness.light,
  useMaterial3: true,
  inputDecorationTheme: const InputDecorationTheme(
    border: OutlineInputBorder(),
    floatingLabelStyle: TextStyle(fontWeight: FontWeight.bold),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(10)),
      borderSide: BorderSide(
        color: primary
      ),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(10)),
      borderSide: BorderSide(
        width: 2,
        color: primary,
      ),
    ),
  ),
  colorScheme: const ColorScheme(
    error: Color(0xffDC3535),
    onError: Color(0xffDC3535),
    brightness: Brightness.light,
    primary: primary,
    secondary: secondary,
    onPrimary: primary,
    onSecondary: secondary,
    background: Color(0xfff7f7f7),
    onBackground: Color(0xfff7f7f7),
    surface: Color(0xfff7f7f7),
    onSurface: Color(0xfff7f7f7),
  ),
  textTheme: GoogleFonts.comfortaaTextTheme()
);

ThemeData darkTheme = ThemeData(
  primarySwatch: CustomMaterialColor(255, 177, 0).mdColor,
  brightness: Brightness.dark,
  useMaterial3: true,
  inputDecorationTheme: const InputDecorationTheme(
    isDense: true,
    border: OutlineInputBorder(),
    floatingLabelStyle: TextStyle(fontWeight: FontWeight.bold),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(10)),
      borderSide: BorderSide(
        color: primary
      ),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(10)),
      borderSide: BorderSide(
        width: 2,
        color: primary
      ),
    ),
    focusColor: Color(0xfff7f7f7),
    hintStyle: TextStyle(color: Color(0xfff7f7f7))
  ),
  colorScheme: const ColorScheme(
    error: Color(0xffDC3535),
    onError: Color(0xffDC3535),
    brightness: Brightness.dark,
    primary: primary,
    secondary: secondary,
    onPrimary: primary,
    onSecondary: secondary,
    background: Color(0xfff7f7f7),
    onBackground: Color(0xfff7f7f7),
    surface: Color(0xfff7f7f7),
    onSurface: Color(0xfff7f7f7),
  ),
  textTheme: GoogleFonts.comfortaaTextTheme(
    const TextTheme(
      subtitle1: TextStyle(
        color: Color(0xfff7f7f7),
      )
    ),
  )
);
