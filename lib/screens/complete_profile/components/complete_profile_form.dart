import 'package:eccomerce_app/screens/otp/otp_screen.dart';
import 'package:flutter/material.dart';

import '../../../components/default_button.dart';
import '../../../components/form_error.dart';
import '../../../constants.dart';
import '../../../size_config.dart';
import '../../sign_in/components/custom_suffix_icon.dart';

class CompleteProfileForm extends StatefulWidget {
  const CompleteProfileForm({super.key});

  @override
  State<CompleteProfileForm> createState() => _CompleteProfileFormState();
}

class _CompleteProfileFormState extends State<CompleteProfileForm> {
  final _formKey = GlobalKey<FormState>();
  final List<String> errors = [];
  late String firstName;
  late String lastName;
  late String phoneNumber;
  late String address;

  void addError({required String error}) {
    if (!errors.contains(error)) {
      setState(() {
        errors.add(error);
      });
    }
  }

  void removeError({error}) {
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
      child: Column(children: [
        buildFirstNamFormField(),
        SizedBox(
          height: SizeConfig().getProportionateScreenHeight(30),
        ),
        buildLastNameFormField(),
        SizedBox(
          height: SizeConfig().getProportionateScreenHeight(30),
        ),
        buildPhoneNumberFormField(),
        SizedBox(
          height: SizeConfig().getProportionateScreenHeight(30),
        ),
        buildAddressFormField(),
        FormError(errors: errors),
        SizedBox(
          height: SizeConfig().getProportionateScreenHeight(40),
        ),
        DefaultButton(
            press: () {
              // if (_formKey.currentState!.validate()) {
              //   //Go to OTP Screen
              Navigator.pushNamed(context, OtpScreen.routeName);
              // }
            },
            text: "Continue"),
      ]),
    );
  }

  TextFormField buildAddressFormField() {
    return TextFormField(
      onSaved: (newValue) => address = newValue!,
      onChanged: (value) {
        if (value!.isNotEmpty) {
          setState(() {
            errors.remove(kAddressNullError);
          });
        }
      },
      validator: (value) {
        if (value!.isEmpty) {
          setState(() {
            errors.add(kAddressNullError);
          });
          // return "";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "Address",
        hintText: "Enter your Address",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: const CustomSuffixIcon(
          svgIcon: "/assets/icons/Location_point.svg",
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

  TextFormField buildPhoneNumberFormField() {
    return TextFormField(
      keyboardType: TextInputType.number,
      onSaved: (newValue) => phoneNumber = newValue!,
      onChanged: (value) {
        if (value!.isNotEmpty) {
          setState(() {
            errors.remove(kPhoneNumberNullError);
          });
        }
      },
      validator: (value) {
        if (value!.isEmpty) {
          setState(() {
            errors.add(kPhoneNumberNullError);
          });
          // return "";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "Phone Number",
        hintText: "Enter your phone number",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: const CustomSuffixIcon(
          svgIcon: "assets/icons/Phone.svg",
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

  TextFormField buildLastNameFormField() {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      onSaved: (newValue) => lastName = newValue!,
      onChanged: (value) {
        if (value!.isNotEmpty) {
          setState(() {
            errors.remove(kNamelNullError);
          });
        }
      },
      validator: (value) {
        if (value!.isEmpty) {
          setState(() {
            errors.add(kNamelNullError);
          });
          // return "";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "Last Name",
        hintText: "Enter your last name",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: const CustomSuffixIcon(
          svgIcon: "assets/icons/User.svg",
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

  TextFormField buildFirstNamFormField() {
    return TextFormField(
      onSaved: (newValue) => firstName = newValue!,
      onChanged: (value) {
        if (value!.isNotEmpty) {
          setState(() {
            errors.remove(kNamelNullError);
          });
        }
      },
      validator: (value) {
        if (value!.isEmpty) {
          setState(() {
            errors.add(kNamelNullError);
          });
          // return "";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "First Name",
        hintText: "Enter your first name",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: const CustomSuffixIcon(
          svgIcon: "assets/icons/User.svg",
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
