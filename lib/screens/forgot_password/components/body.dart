import 'package:eccomerce_app/components/default_button.dart';
import 'package:eccomerce_app/components/form_error.dart';
import 'package:eccomerce_app/components/no_account_text.dart';
import 'package:flutter/material.dart';
import '../../../constants.dart';
import '../../../size_config.dart';
import '../../sign_in/components/custom_suffix_icon.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: SizeConfig().getProportionateScreenWidth(40)),
          child: Column(
            children: [
              SizedBox(height: SizeConfig.screenHeight * 0.1),
              Text(
                "Forgot Password",
                style: TextStyle(
                  fontSize: SizeConfig().getProportionateScreenWidth(60),
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Text(
                "Please enter your email and we will send you \n you a link to return to your account",
                textAlign: TextAlign.center,
              ),
              SizedBox(height: SizeConfig.screenHeight * 0.1),
              const ForgotPassForm(),
            ],
          ),
        ),
      ),
    );
  }
}

class ForgotPassForm extends StatefulWidget {
  const ForgotPassForm({super.key});

  @override
  State<ForgotPassForm> createState() => _ForgotPassFormState();
}

class _ForgotPassFormState extends State<ForgotPassForm> {
  final _formKey = GlobalKey<FormState>();
  List<String> errors = [];
  late String email;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: TextFormField(
              keyboardType: TextInputType.emailAddress,
              onSaved: (newValue) => email = newValue!,
              onChanged: (value) {
                if (value!.isNotEmpty && (errors.contains(kEmailNullError))) {
                  setState(() {
                    errors.remove(kEmailNullError);
                  });
                } else if (emailValidatorRegExp.hasMatch(value) &&
                    (errors.contains(kInvalidEmailError))) {
                  setState(() {
                    errors.remove(kInvalidEmailError);
                  });
                }
                return;
              },
              validator: (value) {
                if (value!.isEmpty && !(errors.contains(kEmailNullError))) {
                  setState(() {
                    errors.add(kEmailNullError);
                  });
                } else if (!emailValidatorRegExp.hasMatch(value) &&
                    !(errors.contains(kInvalidEmailError))) {
                  setState(() {
                    errors.add(kInvalidEmailError);
                  });
                }
                return null;
              },
              decoration: InputDecoration(
                labelText: "Email",
                hintText: "Enter your email",
                floatingLabelBehavior: FloatingLabelBehavior.always,
                suffixIcon: const CustomSuffixIcon(
                  svgIcon: "assets/icons/Mail.svg",
                ),
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 42,
                  vertical: 20,
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(28),
                  borderSide: const BorderSide(color: kTextColor),
                  gapPadding: 10,
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(28),
                  borderSide: const BorderSide(color: kTextColor),
                  gapPadding: 10,
                ),
              ),
            ),
          ),
          FormError(errors: errors),
          SizedBox(height: SizeConfig.screenHeight * 0.1),
          DefaultButton(
              press: () {
                if (_formKey.currentState!.validate()) {
                  //Do what you want to do
                }
              },
              text: "Continue"),
          const NoAccountText(),
        ],
      ),
    );
  }
}
