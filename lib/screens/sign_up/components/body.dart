import 'package:eccomerce_app/size_config.dart';
import 'package:flutter/material.dart';
import '../../../components/social_card.dart';
import 'sign_up_form.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: SizeConfig().getProportionateScreenHeight(20),
          ),
          child: Column(
            children: [
              SizedBox(
                height: SizeConfig.screenHeight * 0.02,
              ),
              Text(
                "Register Account",
                style: TextStyle(
                  fontSize: SizeConfig().getProportionateScreenWidth(45),
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  // height:
                ),
              ),
              const Text(
                "Complete your details or continue \n with social media",
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: SizeConfig.screenHeight * 0.07,
              ),
              const SignUpForm(),
              SizedBox(
                height: SizeConfig.screenHeight * 0.07,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SocialCard(
                    icon: "assets/icons/google-icon.svg",
                    press: () {},
                  ),
                  SocialCard(
                    icon: "assets/icons/facebook-2.svg",
                    press: () {},
                  ),
                  SocialCard(
                    icon: "assets/icons/twitter.svg",
                    press: () {},
                  ),
                ],
              ),
              SizedBox(
                height: SizeConfig().getProportionateScreenWidth(20),
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
