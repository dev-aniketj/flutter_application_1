import 'package:flutter/material.dart';

import '../utils/routes.dart';

class LoginPage extends StatefulWidget {
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String _name = "";
  bool _changeButton = false;

  final _formKey = GlobalKey<FormState>();

  _moveToHome(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      setState(() {
        Future.delayed(const Duration(seconds: 1), () async {
          await Navigator.pushNamed(context, MyRoutes.homeRoute);
          setState(() {
            _changeButton = false;
          });
        });
        _changeButton = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              const SizedBox(
                height: 20.0,
              ),
              Image.asset(
                "assets/images/hey_img.png",
                fit: BoxFit.cover,
              ),
              const SizedBox(
                height: 20.0,
              ),
              Text(
                "Welcome $_name",
                style:
                    const TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 20.0,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: 12.0, horizontal: 16.0),
                child: Column(
                  children: [
                    TextFormField(
                      decoration: const InputDecoration(
                        hintText: "Enter the username",
                        labelText: "Username",
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Username can not be Empty";
                        }
                        return null;
                      },
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
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Password can not be Empty";
                        } else if (value.length < 6) {
                          return "Password length should be atleast 6";
                        }
                        return null;
                      },
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              Material(
                color: Colors.deepPurple,
                borderRadius: BorderRadius.circular(_changeButton ? 50 : 8),
                child: InkWell(
                  onTap: () => _moveToHome(context),
                  child: AnimatedContainer(
                    width: _changeButton ? 55 : 150,
                    height: _changeButton ? 55 : 50,
                    alignment: Alignment.center,
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
