import 'package:chatgpt/widgets/drop_down_btn.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import '../constants/constants.dart';
import '../widgets/text_widget.dart';

class Services {
  static Future<void> showModalBtmSheet({required BuildContext context}) async {
    await showModalBottomSheet(
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
        context: context,
        backgroundColor: scaffoldBackgroundColor,
        builder: (context) {
          return Padding(
            padding: const EdgeInsets.all(18.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Flexible(
                  child: TextWidget(
                    label: 'Chosen Modal',
                    fontSize: 18,
                  ),
                ),
                Flexible(flex: 2, child: DropDownBtn()),
              ],
            ),
          );
        });
  }
}
