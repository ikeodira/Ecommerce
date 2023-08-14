import "package:eccomerce_app/size_config.dart";
import "package:flutter/material.dart";
import "home_header.dart";

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            // SizedBox(
            //   height: SizeConfig().getProportionateScreenHeight(20),
            // ),
            const HomeHeader(),
            Container(
              margin: EdgeInsets.symmetric(
                  horizontal: SizeConfig().getProportionateScreenWidth(20)),
              width: double.infinity,
              height: 90,
              decoration: const BoxDecoration(
                color: Color(0xFF4A3298),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
