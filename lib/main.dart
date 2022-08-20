import 'package:flutter/material.dart';
import 'pages/home_page.dart';
import "pages/login_page.dart";
import "package:google_fonts/google_fonts.dart";

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.light,
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        fontFamily: GoogleFonts.lato().fontFamily,
      ),
      darkTheme: ThemeData(
        primarySwatch: Colors.cyan,
      ),
      initialRoute: "login",
      routes: {
        "home": (context) => HomePage(),
        "login": (context) => LoginPage(),
      },
    );
  }
}
