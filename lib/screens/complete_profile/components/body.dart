import 'package:eccomerce_app/constants.dart';
import 'package:eccomerce_app/size_config.dart';
import 'package:flutter/material.dart';
import './complete_profile_form.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: SizeConfig().getProportionateScreenWidth(30)),
          child: Column(
            children: [
              Text(
                'Complete Profile',
                style: headingStyle,
              ),
              const Text(
                "Complete your details or continue \n with social media",
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: SizeConfig.screenHeight * 0.05,
              ),
              const CompleteProfileForm(),
              SizedBox(
                height: SizeConfig().getProportionateScreenHeight(30),
              ),
              const Text(
                "By continuing your confirm that you agree \n with our Term and Condition",
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
