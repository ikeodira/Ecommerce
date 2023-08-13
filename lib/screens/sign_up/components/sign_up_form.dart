import 'package:eccomerce_app/screens/complete_profile/complete_profile_screen.dart';
import 'package:flutter/material.dart';
import '../../../components/default_button.dart';
import '../../../components/form_error.dart';
import '../../../constants.dart';
import '../../../size_config.dart';
import '../../sign_in/components/custom_suffix_icon.dart';

//10:49

class SignUpForm extends StatefulWidget {
  const SignUpForm({super.key});

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final _formKey = GlobalKey<FormState>();
  late String email;
  late String password;
  // ignore: non_constant_identifier_names
  late String confirm_password;
  final List<String> errors = [];

  void addError({required String error}) {
    if (!errors.contains(error)) {
      setState(() {
        errors.add(error);
      });
    }
  }

  void removeError({required String error}) {
    if (!errors.contains(error)) {
      setState(() {
        errors.remove(error);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          buildEmailFormField(),
          SizedBox(
            height: SizeConfig().getProportionateScreenHeight(30),
          ),
          buildPasswordFormField(),
          SizedBox(
            height: SizeConfig().getProportionateScreenHeight(30),
          ),
          buildConfirmPasswordFormField(),
          SizedBox(
            height: SizeConfig().getProportionateScreenHeight(30),
          ),
          FormError(errors: errors),
          DefaultButton(
              press: () {
                // if (_formKey.currentState!.validate()) {
                //Go to complete profile page
                // Navigator.pushNamed(context, CompleteProfileScreen.routeName );
                // }
                Navigator.pushNamed(context, CompleteProfileScreen.routeName);
              },
              text: "Continue"),
        ],
      ),
    );
  }

  TextFormField buildConfirmPasswordFormField() {
    return TextFormField(
      onSaved: (newValue) => confirm_password = newValue!,
      validator: (value) {
        if (value!.isEmpty) {
          setState(() {
            errors.add(kPassNullError);
          });

          // return "";
        } else if (password != confirm_password) {
          setState(() {
            errors.add(kMatchPassError);
          });
          // return "";
        }
      },
      onChanged: (value) {
        if (password == confirm_password) {
          setState(() {
            errors.remove(kMatchPassError);
          });
        } else if (value.isNotEmpty) {
          setState(() {
            errors.remove(kPassNullError);
          });
        }
        // return null;
      },
      obscureText: true,
      decoration: InputDecoration(
        labelText: "Confirm Password",
        hintText: "Re-enter your password",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: const CustomSuffixIcon(
          svgIcon: "assets/icons/Lock.svg",
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
    );
  }

  TextFormField buildPasswordFormField() {
    return TextFormField(
      onSaved: (newValue) => password = newValue!,
      validator: (value) {
        if (value!.isEmpty && !errors.contains(kPassNullError)) {
          setState(() {
            errors.add(kPassNullError);
          });
          // return "";
        } else if (value.length < 8 && !errors.contains(kShortPassError)) {
          setState(() {
            errors.add(kShortPassError);
          });
          // return "";
        }
        return null;
      },
      onChanged: (value) {
        if (value.isNotEmpty) {
          setState(() {
            errors.remove(kPassNullError);
          });
        } else if (value.length >= 8) {
          setState(() {
            errors.remove(kShortPassError);
          });
        }

        password = value;
        // return null;
      },
      obscureText: true,
      decoration: InputDecoration(
        labelText: "Password",
        hintText: "Enter your password",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: const CustomSuffixIcon(
          svgIcon: "assets/icons/Lock.svg",
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
    );
  }

  TextFormField buildEmailFormField() {
    return TextFormField(
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
        confirm_password = value;
        // return null;
      },
      validator: (value) {
        if (value!.isEmpty && !(errors.contains(kEmailNullError))) {
          setState(() {
            errors.add(kEmailNullError);
          });
          // return "";
        } else if (!emailValidatorRegExp.hasMatch(value) &&
            !(errors.contains(kInvalidEmailError))) {
          setState(() {
            errors.add(kInvalidEmailError);
          });
          // return "";
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
    );
  }
}
