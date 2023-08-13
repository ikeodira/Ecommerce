import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:eccomerce_app/size_config.dart';

class FormError extends StatelessWidget {
  const FormError({
    super.key,
    required this.errors,
  });

  final List<String> errors;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20),
      child: Column(
        children: List.generate(
          errors.length,
          (index) => formErrorText(error: errors[index]),
        ),
      ),
    );
  }

  Row formErrorText({error}) {
    return Row(
      children: [
        SvgPicture.asset(
          "assets/icons/Error.svg",
          height: SizeConfig().getProportionateScreenWidth(30),
        ),
        SizedBox(
          height: SizeConfig().getProportionateScreenHeight(20),
          width: SizeConfig().getProportionateScreenHeight(20),
        ),
        Text(error),
      ],
    );
  }
}
