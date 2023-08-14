import "package:eccomerce_app/constants.dart";
import "package:eccomerce_app/routes.dart";
import "package:eccomerce_app/screens/splash/splash_screen.dart";
import "package:flutter/material.dart";

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Ecommerce App",
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        fontFamily: "Muli",
        appBarTheme: const AppBarTheme(
          color: Colors.white,
          elevation: 0,
          iconTheme: IconThemeData(color: Colors.black),
          // systemOverlayStyle: SystemUiOverlayStyle.dark,
        ),
        primaryTextTheme: const TextTheme(
          titleLarge: TextStyle(color: Color(0XFF8B8B8B)),
        ),
        textTheme: const TextTheme(
          bodyLarge: TextStyle(color: kTextColor),
          bodyMedium: TextStyle(color: kTextColor),
        ),
      ),
      initialRoute: SplashScreen.routeName,
      // initialRoute: OtpScreen.routeName,
      routes: routes,
    );
  }
}
