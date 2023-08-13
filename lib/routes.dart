import 'package:eccomerce_app/screens/complete_profile/complete_profile_screen.dart';
import 'package:eccomerce_app/screens/forgot_password/forgot_password_screen.dart';
import 'package:eccomerce_app/screens/login_success/login_sucess_screen.dart';
import 'package:eccomerce_app/screens/otp/otp_screen.dart';
import 'package:eccomerce_app/screens/sign_in/sign_in_screen.dart';
import 'package:eccomerce_app/screens/sign_up/sign_up_screen.dart';
import 'package:eccomerce_app/screens/splash/splash_screen.dart';
import 'package:flutter/widgets.dart';

final Map<String, WidgetBuilder> routes = {
  SplashScreen.routeName: (context) => const SplashScreen(),
  SignInScreen.routeName: (context) => SignInScreen(),
  ForgotPasswordScreen.routeName: (context) => const ForgotPasswordScreen(),
  LoginSuccessScreen.routeName: (context) => const LoginSuccessScreen(),
  SignUpScreen.routeName: (context) => const SignUpScreen(),
  CompleteProfileScreen.routeName: (context) => const CompleteProfileScreen(),
  OtpScreen.routeName: (context) => OtpScreen(),
};
