import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../values/assets.dart';
import '../values/custom_colors.dart';
import '../values/spacing.dart';
import '../values/strings.dart';
import '../values/styles.dart';

class RealDealTitleNLogo extends StatelessWidget {
  const RealDealTitleNLogo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          Strings.appTitle,
          style: Styles.regularMonteAlt28(CustomColors.white,
              fontWeight: FontWeight.w500),
        ),
        Spacing.horizontal(.03),
        SizedBox(
          width: 28,
          height: 28,
          child: SvgPicture.asset(Assets.dealReelLogo),
        ),
      ],
    );
  }
}

class DealRealSmallTitle extends StatelessWidget {
  const DealRealSmallTitle({
    super.key,
    required this.color,
  });
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          Strings.appTitle,
          style: Styles.regularMonteAlt16(color, fontWeight: FontWeight.w600),
        ),
        Spacing.horizontal(.01),
        SizedBox(
          width: 16.3,
          height: 16.3,
          child: SvgPicture.asset(
            Assets.dealReelLogo,
            color: color,
          ),
        ),
      ],
    );
  }
}
