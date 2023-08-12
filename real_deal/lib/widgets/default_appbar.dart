import 'package:flutter/material.dart';

import '../values/custom_colors.dart';

AppBar customAppBar({Widget? title, bool leading = true}) {
  return AppBar(
    backgroundColor: leading == true ? CustomColors.primaryColor : null,
    title: title,
    automaticallyImplyLeading: leading,
    centerTitle: !leading,
    leading: leading ? BackButton(color: CustomColors.white) : null,
  );
}
