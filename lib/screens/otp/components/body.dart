import 'package:eccomerce_app/constants.dart';
import 'package:eccomerce_app/size_config.dart';
import 'package:flutter/material.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: SizeConfig().getProportionateScreenWidth(30)),
        child: Column(
          children: [
            Text("OTP Verification", style: headingStyle),
            const Text("We sent your code to +234814117****"),
            buildTimer(),
            SizedBox(
              height: 20,
            ),
            Padding(
                padding: EdgeInsets.only(
                    left: screenWidth * 0.2, right: screenWidth * 0.2),
                child: OtpForm()),
          ],
        ),
      ),
    );
  }

  Row buildTimer() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text("This code will expire in "),
        TweenAnimationBuilder(
          tween: Tween(begin: 30.0, end: 0),
          duration: const Duration(seconds: 30),
          builder: (context, value, child) => Text(
            '00:${value.toInt()}',
            style: const TextStyle(color: kPrimaryColor),
          ),
          onEnd: () {},
        ),
      ],
    );
  }
}

class OtpForm extends StatefulWidget {
  @override
  State<OtpForm> createState() => _OtpFormState();
}

class _OtpFormState extends State<OtpForm> {
  // 22:23
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Form(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            // width: SizeConfig().getProportionateScreenWidth(60),
            width: screenWidth * 0.1,
            child: TextFormField(
              style: const TextStyle(fontSize: 24),
              decoration: otpInputDecoration,
            ),
          ),
          SizedBox(
            // width: SizeConfig().getProportionateScreenWidth(60),
            width: screenWidth * 0.1,
            child: TextFormField(
              style: const TextStyle(fontSize: 24),
              decoration: otpInputDecoration,
            ),
          ),
          SizedBox(
            // width: SizeConfig().getProportionateScreenWidth(60),
            width: screenWidth * 0.1,
            child: TextFormField(
              style: const TextStyle(fontSize: 24),
              decoration: otpInputDecoration,
            ),
          ),
          SizedBox(
            // width: SizeConfig().getProportionateScreenWidth(60),
            width: screenWidth * 0.1,
            child: TextFormField(
              style: const TextStyle(fontSize: 24),
              decoration: otpInputDecoration,
            ),
          )
        ],
      ),
    );
  }
}
