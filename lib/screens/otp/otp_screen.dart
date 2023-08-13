import 'package:flutter/material.dart';
import 'components/body.dart';

class OtpScreen extends StatelessWidget {
  static String routeName = "/otp";

  const OtpScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "OTP Verification",
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
