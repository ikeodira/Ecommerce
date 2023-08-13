import 'package:flutter/material.dart';

import 'components/body.dart';

class SignInScreen extends StatelessWidget {
  static String routeName = "/sign_in";
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Sign In",
          style: TextStyle(
            color: Color(0XFF8B8B8B),
            fontSize: 20,
          ),
        ),
      ),
      body: Body(),
    );
  }
}
