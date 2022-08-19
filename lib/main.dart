import 'package:flutter/material.dart';
import 'pages/home_page.dart';
import "pages/login_page.dart";

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.dark,
      darkTheme: ThemeData(primarySwatch: Colors.deepPurple),
      initialRoute: "login",
      routes: {
        "home": (context) => HomePage(),
        "login": (context) => LoginPage(),
      },
    );
  }
}
