import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../size_config.dart';

class ProfilePic extends StatelessWidget {
  const ProfilePic({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 115,
      height: 115,
      child: Stack(
        fit: StackFit.expand,
        // clipBehavior: Clip.hardEdge,

        children: [
          CircleAvatar(
              backgroundImage: AssetImage('assets/images/Profile Image.png')),
          Positioned(
            // width: double.nan,
            right: 0,
            bottom: 0,
            child: Container(
              width: getProportionateScreenWidth(26),
              height: getProportionateScreenHeight(26),
              child: MaterialButton(
                  padding: EdgeInsets.zero,
                  color: Color(0xFFF5F6F9),
                  shape: RoundedRectangleBorder(
                    side: BorderSide(color: Colors.white),
                    borderRadius: BorderRadius.circular(50),
                  ),
                  onPressed: () {},
                  child: SvgPicture.asset('assets/icons/Camera Icon.svg')),
            ),
          )
        ],
      ),
    );
  }
}
