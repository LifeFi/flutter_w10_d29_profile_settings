import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  static const String routeName = "login";
  static const String routeURL = "/login";

  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text("Log In"),
      ),
    );
  }
}
