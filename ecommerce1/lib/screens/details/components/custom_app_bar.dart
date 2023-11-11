import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../components/roun_icn_btn.dart';
import '../../../size_config.dart';

class CustomAppBar extends StatelessWidget {
  final double rating;

  const CustomAppBar({super.key, required this.rating});
  @override
  Size get preferredSize => Size.fromHeight(AppBar().preferredSize.height);
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding:
            EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            RoundIconBtn(
              icnData: Icons.arrow_back_ios,
              press: () => Navigator.pop(context),
            ),
            Container(
              margin: EdgeInsets.only(top: 20),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50), color: Colors.white),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Text(
                      rating.toString(),
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                    SvgPicture.asset('assets/icons/Star Icon.svg')
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
