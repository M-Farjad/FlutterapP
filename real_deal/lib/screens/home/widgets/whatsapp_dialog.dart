// ignore_for_file: unused_field

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../values/assets.dart';
import '../../../values/custom_colors.dart';
import '../../../values/shadows.dart';
import '../../../values/strings.dart';
import '../../../values/styles.dart';
import '../../../widgets/real_deal.dart';

// ignore: must_be_immutable
class WhatsappAlertDialog extends StatelessWidget {
  WhatsappAlertDialog({
    super.key,
    required SharedPreferences prefs,
    required RxBool showModal,
  })  : _prefs = prefs,
        show = showModal;

  final SharedPreferences _prefs;
  RxBool show;
  final Uri whatsappCommunity = Uri.parse('https://wa.me/1XXXXXXXXXX');
  Future<void> _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      contentPadding: EdgeInsets.zero,
      content: Container(
        width: Get.width * .9,
        height: Get.height * .34,
        padding: const EdgeInsets.all(10),
        decoration: ShapeDecoration(
          color: CustomColors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(19),
          ),
          shadows: CustomShadows.shadowsAbove,
        ),
        child: Stack(
          children: [
            Positioned(
              right: 0,
              top: 0,
              child: IconButton(
                onPressed: () {
                  _prefs.setBool('showModal', false);
                  show.value = false;
                  Get.back();
                },
                icon: Icon(Icons.close, color: CustomColors.primaryColor),
              ),
            ),
            Positioned(
              bottom: 0,
              right: 0,
              // top: Get.height * .1,
              left: Get.width * .22,
              child: Image.asset(Assets.whatsapp),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                DealRealSmallTitle(color: CustomColors.primaryColor),
                Text(
                  Strings.join,
                  style: Styles.regularInter15(CustomColors.black),
                ),
                Text(
                  Strings.whatsappCommunity,
                  style: Styles.regularInter20(CustomColors.black,
                      fontWeight: FontWeight.w600),
                ),
                Text(
                  Strings.dailyUpdates,
                  style: Styles.regularInter15(CustomColors.black),
                ),
                Text(
                  Strings.discussions,
                  style: Styles.regularInter15(CustomColors.black,
                      fontWeight: FontWeight.w600),
                ),
                GestureDetector(
                  onTap: () {
                    Get.back();
                    _prefs.setBool('showModal', false);
                    show.value = false;
                    _launchURL(
                      'https://chat.whatsapp.com/BW9yhWkmZuA58M4BncrTNy',
                    );
                  },
                  child: Container(
                    width: Get.width * .55,
                    height: 42,
                    decoration: ShapeDecoration(
                      color: CustomColors.green,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: Center(
                      child: Text(
                        Strings.tapToJoin,
                        style: Styles.regularInter15(
                          CustomColors.white,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      // actions: [
      //   TextButton(
      //     onPressed: () {
      //       Get.back();
      //       _prefs.setBool('showModal', false);
      //       _showModal.value = false;
      //     },
      //     child: const Text('Close'),
      //   ),
      // ],
    );
  }
}
