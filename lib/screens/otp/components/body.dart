import 'package:eccomerce_app/components/default_button.dart';
import 'package:eccomerce_app/constants.dart';
import 'package:eccomerce_app/size_config.dart';
import 'package:flutter/material.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: SizeConfig().getProportionateScreenWidth(30)),
        child: Column(
          children: [
            SizedBox(
              height: SizeConfig.screenHeight * 0.05,
            ),
            Text("OTP Verification", style: headingStyle),
            const Text("We sent your code to +234814117****"),
            buildTimer(),
            SizedBox(
              height: SizeConfig.screenHeight * 0.1,
            ),
            OtpForm(),
            SizedBox(
              height: SizeConfig.screenHeight * 0.1,
            ),
            const Text(
              "Resend OTP Code",
              style: TextStyle(decoration: TextDecoration.underline),
            ),
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
  late FocusNode pin2FocusNode;
  late FocusNode pin3FocusNode;
  late FocusNode pin4FocusNode;

  @override
  void initState() {
    super.initState();
    pin2FocusNode = FocusNode();
    pin3FocusNode = FocusNode();
    pin4FocusNode = FocusNode();
  }

  @override
  void dispose() {
    super.dispose();
    pin2FocusNode.dispose();
    pin3FocusNode.dispose();
    pin4FocusNode.dispose();
  }

  void nextField({required String value, required FocusNode focusNode}) {
    if (value.length == 1) {
      focusNode.requestFocus();
    }
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Form(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(
                  left: screenWidth * 0.2, right: screenWidth * 0.2),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    // width: SizeConfig().getProportionateScreenWidth(60),
                    width: screenWidth * 0.1,
                    child: TextFormField(
                      autofocus: true,
                      obscureText: true,
                      keyboardType: TextInputType.number,
                      style: const TextStyle(fontSize: 24),
                      textAlign: TextAlign.center,
                      decoration: otpInputDecoration,
                      onChanged: (value) {
                        nextField(value: value, focusNode: pin2FocusNode);
                      },
                    ),
                  ),
                  SizedBox(
                    // width: SizeConfig().getProportionateScreenWidth(60),
                    width: screenWidth * 0.1,
                    child: TextFormField(
                      focusNode: pin2FocusNode,
                      obscureText: true,
                      keyboardType: TextInputType.number,
                      style: const TextStyle(fontSize: 24),
                      textAlign: TextAlign.center,
                      decoration: otpInputDecoration,
                      onChanged: (value) {
                        nextField(value: value, focusNode: pin3FocusNode);
                      },
                    ),
                  ),
                  SizedBox(
                    // width: SizeConfig().getProportionateScreenWidth(60),
                    width: screenWidth * 0.1,
                    child: TextFormField(
                      focusNode: pin3FocusNode,
                      obscureText: true,
                      keyboardType: TextInputType.number,
                      style: const TextStyle(fontSize: 24),
                      textAlign: TextAlign.center,
                      decoration: otpInputDecoration,
                      onChanged: (value) {
                        nextField(value: value, focusNode: pin4FocusNode);
                      },
                    ),
                  ),
                  SizedBox(
                    // width: SizeConfig().getProportionateScreenWidth(60),
                    width: screenWidth * 0.1,
                    child: TextFormField(
                      focusNode: pin4FocusNode,
                      obscureText: true,
                      keyboardType: TextInputType.number,
                      style: const TextStyle(fontSize: 24),
                      textAlign: TextAlign.center,
                      decoration: otpInputDecoration,
                      onChanged: (value) {
                        pin4FocusNode.unfocus();
                      },
                    ),
                  )
                ],
              ),
            ),
            SizedBox(height: SizeConfig.screenHeight * 0.15),
            DefaultButton(press: () {}, text: "Continue"),
          ],
        ),
      ),
    );
  }
}
