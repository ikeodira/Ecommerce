import 'package:flutter/material.dart';
import 'package:eccomerce_app/size_config.dart';
import 'package:eccomerce_app/constants.dart';

class SplashContent extends StatelessWidget {
  String text, image;
  SplashContent({
    super.key,
    required this.text,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Spacer(),
        Text(
          "TOKOTO",
          style: TextStyle(
            fontSize: SizeConfig().getProportionateScreenHeight(36),
            color: kPrimaryColor,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          text,
          textAlign: TextAlign.center,
        ),
        const Spacer(flex: 2),
        Image.asset(
          image,
          height: SizeConfig().getProportionateScreenHeight(300),
          width: SizeConfig().getProportionateScreenWidth(400),
        ),
      ],
    );
  }
}
