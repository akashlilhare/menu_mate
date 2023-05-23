import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Color lightBackgroundColor = const Color(0xffF1F5F9);
Color lightSecondaryBgColor = const Color(0xffF0FFFF);
Color lightAppbarColor = Colors.white;
Color lightCardColor = Colors.white;

Color lightPrimaryColor =  Color(0xffff5744);

Color titleTextColor = Colors.black;
Color subTitleTextColor = const Color(0xff212121);
Color captionTextColor = Colors.black54;


var lightTheme = ThemeData(
  primarySwatch: Colors.red,
  backgroundColor: lightBackgroundColor,
  textTheme: lightTextTheme,
  // useMaterial3: true,
  primaryColor: lightPrimaryColor,
  cardColor: lightCardColor,
  scaffoldBackgroundColor: lightSecondaryBgColor,
  brightness: Brightness.light,
  dialogBackgroundColor: lightCardColor,
  dividerColor: Colors.grey.shade200.withOpacity(.8),
  dividerTheme: DividerThemeData(
    thickness: .8,
    color: Colors.grey.shade200.withOpacity(.7),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: lightPrimaryColor,
      )),
  textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: lightPrimaryColor,
      )),
  iconTheme: IconThemeData(
    color: Colors.grey.shade700,
  ),
  appBarTheme:  AppBarTheme(
      backgroundColor: lightPrimaryColor,
      elevation: 0,
      // titleTextStyle: TextStyle(
          // color: Colors.black, fontSize: 18, fontWeight: FontWeight.w500),
      // iconTheme: IconThemeData(color: Colors.black),
      // actionsIconTheme: IconThemeData(color: Colors.black)
  // ),

));

var lightTextTheme = TextTheme(
  headline1: GoogleFonts.lato(
      fontSize: 20,
      fontWeight: FontWeight.w600,
      letterSpacing: -0.5,
      color: titleTextColor),
  headline2: GoogleFonts.lato(
      fontSize: 18,

      fontWeight: FontWeight.w500,

      letterSpacing: 0.0,
      color: titleTextColor),
  headline3: GoogleFonts.lato(fontSize: 16, fontWeight: FontWeight.w500),
  headline4: GoogleFonts.lato(
      fontSize: 14, fontWeight: FontWeight.w400, letterSpacing: 0.25),
  headline5: GoogleFonts.lato(fontSize: 12, fontWeight: FontWeight.w500),
  headline6: GoogleFonts.lato(
      fontSize: 20, fontWeight: FontWeight.w500, letterSpacing: 0.15),
  subtitle1: GoogleFonts.lato(
      fontSize: 16, fontWeight: FontWeight.w400, letterSpacing: 0.15),
  subtitle2: GoogleFonts.lato(
      fontSize: 14, fontWeight: FontWeight.w400, letterSpacing: 0.1),
  bodyText1: GoogleFonts.lato(
      fontSize: 16,
      fontWeight: FontWeight.w400,
      letterSpacing: 0.5,
      color: subTitleTextColor),
  bodyText2: GoogleFonts.lato(
      fontSize: 14,
      fontWeight: FontWeight.w400,
      letterSpacing: 0.25,
      color: subTitleTextColor),
  button: GoogleFonts.lato(
      fontSize: 15, fontWeight: FontWeight.w500, letterSpacing: 1.25),
  caption: GoogleFonts.lato(
      fontSize: 12, fontWeight: FontWeight.w400, letterSpacing: 0.4),
  overline: GoogleFonts.lato(
      fontSize: 10, fontWeight: FontWeight.w400, letterSpacing: 1.5),

);
