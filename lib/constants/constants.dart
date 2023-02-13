import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../utils/custom_material_color.dart';

/// routes
const String loginRoute = '/login';
const String homeRoute = '/';
const String welcomeRoute = '/welcome';
const String registerRoute = '/register';

const Color primary = Color(0xffffb100);
const Color secondary = Color(0xff243763);

/// themes
ThemeData lightTheme = ThemeData(
  primarySwatch: CustomMaterialColor(255, 177, 0).mdColor,
  brightness: Brightness.light,
  useMaterial3: true,
  inputDecorationTheme: const InputDecorationTheme(
    contentPadding: EdgeInsets.all(15),
    border: OutlineInputBorder(),
    floatingLabelStyle: TextStyle(
      fontWeight: FontWeight.bold,
      color: Colors.white
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(50)),
      borderSide: BorderSide(
        color: primary
      ),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(50)),
      borderSide: BorderSide(
        width: 2,
        color: primary,
      ),
    ),
    labelStyle: TextStyle(color: Colors.white),
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
  textTheme: GoogleFonts.comfortaaTextTheme(
    const TextTheme(
      subtitle1: TextStyle(
        color: Colors.white,
      )
    ),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ButtonStyle(
      overlayColor: MaterialStateProperty.resolveWith(
        (Set<MaterialState> states) => states.contains(MaterialState.pressed) ? primary : null,
      ),
      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50),
        )
      )
    )
  ),
);

ThemeData darkTheme = ThemeData(
  primarySwatch: CustomMaterialColor(255, 177, 0).mdColor,
  brightness: Brightness.dark,
  useMaterial3: true,
  inputDecorationTheme: const InputDecorationTheme(
    contentPadding: EdgeInsets.all(15),
    isDense: true,
    border: OutlineInputBorder(),
    floatingLabelStyle: TextStyle(
      fontWeight: FontWeight.bold,
      color: Colors.white
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(50)),
      borderSide: BorderSide(
        color: primary
      ),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(50)),
      borderSide: BorderSide(
        width: 2,
        color: primary
      ),
    ),
    focusColor: Color(0xfff7f7f7),
    labelStyle: TextStyle(
      color: Colors.white
    ),
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
        color: Colors.white,
      )
    ),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ButtonStyle(
      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50),
        )
      )
    )
  ),
);

/// svg
const String baseAsset = 'assets';
const String google = '$baseAsset/svg/google.svg';
const String fingerPrint = '$baseAsset/svg/fingerprint.svg';
const String apple = '$baseAsset/svg/apple.svg';

/// riv
const String logoRiv = '$baseAsset/riv/radius.riv';
const String background = '$baseAsset/riv/background.riv';
const String welcomeRiv = '$baseAsset/riv/radius_welcome.riv';

/// mp4
const String backgroundLoginVideo = '$baseAsset/mp4/background.mp4';
