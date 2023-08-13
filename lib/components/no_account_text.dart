import 'package:eccomerce_app/screens/sign_up/sign_up_screen.dart';
import 'package:flutter/material.dart';
import '../constants.dart';
import '../screens/forgot_password/forgot_password_screen.dart';
import '../size_config.dart';

class NoAccountText extends StatelessWidget {
  const NoAccountText({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Don't have an account ?",
          style: TextStyle(
            fontSize: SizeConfig().getProportionateScreenWidth(30),
          ),
        ),
        GestureDetector(
          onTap: () => Navigator.pushNamed(context, SignUpScreen.routeName),
          child: Text(
            "Sign Up",
            style: TextStyle(
              fontSize: SizeConfig().getProportionateScreenWidth(30),
              color: kPrimaryColor,
            ),
          ),
        ),
      ],
    );
  }
}
