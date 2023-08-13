import 'package:eccomerce_app/components/default_button.dart';
import 'package:eccomerce_app/size_config.dart';
import 'package:flutter/material.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: SizeConfig.screenWidth * 0.04,
        ),
        Image.asset(
          "assets/images/success.png",
          height: SizeConfig.screenHeight * 0.4,
        ),
        SizedBox(
          height: SizeConfig.screenWidth * 0.04,
        ),
        Text(
          "Login Success",
          style: TextStyle(
            fontSize: SizeConfig().getProportionateScreenWidth(60),
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        const Spacer(),
        SizedBox(
          width: SizeConfig.screenWidth * 0.6,
          child: DefaultButton(
            press: () {},
            text: "Back to home",
          ),
        ),
        const Spacer(),
      ],
    );
  }
}
