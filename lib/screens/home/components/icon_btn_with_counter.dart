import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../constants.dart';
import '../../../size_config.dart';

class IconBtnWithCounter extends StatelessWidget {
  const IconBtnWithCounter({
    required this.svgScr,
    this.numOfItems = 0,
    required this.press,
    super.key,
  });

  final String svgScr;
  final int numOfItems;
  final GestureTapCallback press;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: press,
      borderRadius: BorderRadius.circular(50),
      child: Stack(
        children: [
          Container(
            padding:
                EdgeInsets.all(SizeConfig().getProportionateScreenWidth(15)),
            height: SizeConfig().getProportionateScreenHeight(80),
            width: SizeConfig().getProportionateScreenWidth(80),
            decoration: BoxDecoration(
              color: kSecondaryColor.withOpacity(0.1),
              shape: BoxShape.circle,
            ),
            child: SvgPicture.asset(
              svgScr,
              width: 20,
              height: 20,
            ),
          ),
          if (numOfItems != 0)
            Positioned(
              right: 0,
              top: 18,
              child: Container(
                height: SizeConfig().getProportionateScreenHeight(16),
                width: SizeConfig().getProportionateScreenWidth(16),
                decoration: BoxDecoration(
                    color: const Color(0xFFFF4848),
                    shape: BoxShape.circle,
                    border: Border.all(width: 1.5, color: Colors.white)),
                child: Center(
                  child: Text("$numOfItems",
                      style: TextStyle(
                        fontSize: SizeConfig().getProportionateScreenHeight(10),
                        height: 1,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      )),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
