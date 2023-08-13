import 'package:flutter/material.dart';
import 'package:eccomerce_app/constants.dart';
import 'package:eccomerce_app/size_config.dart';

class DefaultButton extends StatelessWidget {
  final String text;
  VoidCallback press;

  DefaultButton({
    super.key,
    required this.press,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(15),
      child: SizedBox(
        width: double.infinity,
        height: SizeConfig().getProportionateScreenWidth(85),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: ElevatedButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(kPrimaryColor),
            ),
            onPressed: press,
            child: Text(
              text,
              style: TextStyle(
                fontSize: SizeConfig().getProportionateScreenWidth(35),
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
