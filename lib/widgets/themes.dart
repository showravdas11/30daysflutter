import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:velocity_x/velocity_x.dart';

class MyTheme {
  static ThemeData lightTheme(BuildContext context) => ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        fontFamily: GoogleFonts.lato().fontFamily,
        cardColor: Colors.white,
        canvasColor: creamColor,
        floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: darkBluishColor,
        ),
        // buttonTheme: ButtonThemeData(buttonColor: darkBluishColor),
        useMaterial3: true,
        appBarTheme: AppBarTheme(
          color: Colors.white,
          elevation: 0.0,
          iconTheme: IconThemeData(color: Colors.black),
          centerTitle: true
        )
      );


      static ThemeData dartTheme(BuildContext context) => ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromRGBO(103, 58, 183, 1)),
        fontFamily: GoogleFonts.lato().fontFamily,
        cardColor: Colors.black,
        canvasColor: darkCreamColor,
        floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: lightBluishColor,
        ),
        appBarTheme: AppBarTheme(
          color: Colors.white,
          elevation: 0.0,
          iconTheme: IconThemeData(color: Colors.white),
          centerTitle: true
        )
      );

   // colors

   static Color creamColor = Color(0xfff5f5f5);
   static Color darkCreamColor = Vx.gray900;
   static Color darkBluishColor = Color(0xff403b58);
   static Color lightBluishColor = const Color.fromRGBO(99, 102, 241, 1);
}