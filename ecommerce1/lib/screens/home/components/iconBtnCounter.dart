import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../constants.dart';
import '../../../size_config.dart';

class IconBtnCounter extends StatelessWidget {
  const IconBtnCounter({
    Key? key,
    required this.svgSrc,
    this.numOfItems = 0,
    required this.press,
  }) : super(key: key);

  final String svgSrc;
  final int numOfItems;
  final GestureTapCallback press;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: press,
      borderRadius: BorderRadius.circular(50),
      child: SizedBox(
        width: getProportionateScreenWidth(35),
        child: Stack(
          children: [
            Container(
              padding: EdgeInsets.all(getProportionateScreenWidth(8)),
              width: getProportionateScreenWidth(56),
              height: getProportionateScreenHeight(56),
              decoration: BoxDecoration(
                  color: kSecondaryColor.withOpacity(0.2),
                  shape: BoxShape.circle),
              child: SvgPicture.asset(svgSrc),
            ),
            if (numOfItems != 0)
              Positioned(
                right: 0,
                left: 25,
                top: 0,
                child: Container(
                  width: getProportionateScreenWidth(16),
                  height: getProportionateScreenHeight(16),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.white),
                    color: kPrimaryColor,
                  ),
                  child: Center(
                      child: Text(
                    '${numOfItems}',
                    style: TextStyle(
                        fontSize: getProportionateScreenHeight(10),
                        color: Colors.white,
                        height: 1,
                        fontWeight: FontWeight.w600),
                  )),
                ),
              )
          ],
        ),
      ),
    );
  }
}
