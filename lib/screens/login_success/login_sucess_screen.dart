import "package:flutter/material.dart";

import "components/body.dart";

class LoginSuccessScreen extends StatelessWidget {
  static String routeName = "/login_success";

  const LoginSuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        // leading: SizedBox(),
        title: const Text(
          "Login Success",
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
