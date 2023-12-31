import 'package:flutter/material.dart';
import 'package:thirty_days_flutter/pages/Login.dart';
import 'package:thirty_days_flutter/pages/home_details_page.dart';
import 'package:thirty_days_flutter/pages/home_page.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:thirty_days_flutter/widgets/themes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      themeMode: ThemeMode.light,
      theme: MyTheme.lightTheme(context),
      routes: {
        "/":(context) => LoginPage(),
        "/home": (context) => HomePage(),
        // "/details":(context) => HomeDetailPage(catalog: catalog)
      },
    );
  }
}

