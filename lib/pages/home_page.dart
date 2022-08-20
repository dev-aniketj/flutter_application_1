import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var age = 22;
    var name = "Aniket Jain";

    return Scaffold(
      appBar: AppBar(
        title: Text("Catalog App"),
      ),
      body: Center(
          child: Container(child: Text("My name is $name.\nMy age is $age."))),
      drawer: Drawer(),
    );
  }
}
