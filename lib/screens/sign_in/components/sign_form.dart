import 'package:eccomerce_app/screens/forgot_password/forgot_password_screen.dart';
import 'package:eccomerce_app/screens/login_success/login_sucess_screen.dart';
import 'package:flutter/material.dart';
import '../../../components/default_button.dart';
import '../../../components/form_error.dart';
import '../../../constants.dart';
import '../../../size_config.dart';
import 'custom_suffix_icon.dart';

class SignForm extends StatefulWidget {
  const SignForm({super.key});

  @override
  State<SignForm> createState() => _SignFormState();
}

class _SignFormState extends State<SignForm> {
  final _formKey = GlobalKey<FormState>();
  late String email;
  late String pasword;
  bool remember = false;
  final List<String> errors = [];

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          SizedBox(
            height: SizeConfig().getProportionateScreenHeight(20),
          ),
          Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: buildEmailForm()),
          SizedBox(
            height: SizeConfig().getProportionateScreenHeight(30),
          ),
          Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: buildPassForm()),
          SizedBox(
            height: SizeConfig().getProportionateScreenHeight(30),
          ),

          Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Checkbox(
                    value: remember,
                    activeColor: kPrimaryColor,
                    onChanged: (value) {
                      setState(() {
                        remember = value!;
                      });
                    }),
                const Text("Remember me"),
                GestureDetector(
                    onTap: () => Navigator.pushNamed(
                        context, ForgotPasswordScreen.routeName),
                    child: const Text("Forgot Password")),
              ],
            ),
          ),

          //Displaying Errors on the
          FormError(errors: errors),

          ButtonTheme(
            minWidth: 200.0,
            height: 60.0,
            child: DefaultButton(
              press: () {
                if (_formKey.currentState!.validate()) {
                  _formKey.currentState!.save();
                  //if all are valid then go to success screen
                  Navigator.pushNamed(context, LoginSuccessScreen.routeName);
                }
              },
              text: "Continue",
            ),
          ),
        ],
      ),
    );
  }

  TextFormField buildPassForm() {
    return TextFormField(
      onSaved: (newValue) => pasword = newValue!,
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
      },
      onChanged: (value) {
        if (value.isNotEmpty && errors.contains(kPassNullError)) {
          setState(() {
            errors.remove(kPassNullError);
          });
        } else if (value.length < 8 && errors.contains(kShortPassError)) {
          setState(() {
            errors.remove(kShortPassError);
          });
        }
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

  TextFormField buildEmailForm() {
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
        return null;
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
