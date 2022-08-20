import 'package:flutter/material.dart';

import '../utils/routes.dart';

class LoginPage extends StatefulWidget {
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String _name = "";
  bool _changeButton = false;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 20.0,
            ),
            Image.asset(
              "assets/images/login_img.png",
              fit: BoxFit.cover,
            ),
            const SizedBox(
              height: 20.0,
            ),
            Text(
              "Welcome $_name",
              style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 20.0,
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
              child: Column(
                children: [
                  TextFormField(
                    decoration: const InputDecoration(
                      hintText: "Enter the username",
                      labelText: "Username",
                    ),
                    onChanged: (value) {
                      _name = value;
                      setState(() {}); // re-call the build(context) method
                    },
                  ),
                  TextFormField(
                    obscureText: true,
                    decoration: const InputDecoration(
                      hintText: "Enter the password",
                      labelText: "Password",
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20.0,
            ),
            InkWell(
              onTap: () {
                setState(() {
                  if (_changeButton) {
                    _changeButton = false;
                  } else {
                    _changeButton = true;
                  }
                });
                if (_changeButton) {
                  Future.delayed(const Duration(seconds: 1), () {
                    Navigator.pushNamed(context, MyRoutes.homeRoute);
                  });
                }
              },
              child: AnimatedContainer(
                width: _changeButton ? 55 : 150,
                height: _changeButton ? 55 : 50,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Colors.deepPurple,
                  borderRadius: BorderRadius.circular(_changeButton ? 50 : 8),
                ),
                duration: const Duration(seconds: 1),
                child: _changeButton
                    ? const Icon(
                        Icons.done,
                        color: Colors.white,
                      )
                    : const Text(
                        "Login",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 17),
                      ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
