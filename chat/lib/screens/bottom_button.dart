import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constants/constants.dart';
import '../controller/offer_btn_controller.dart';
import '../main.dart';
import '../widgets/chat_offerN_custom_btn.dart';
import '../widgets/custom_amount_button.dart';
import '../widgets/offer_custom_texts.dart';

class ButtonWithBottomContainer extends StatelessWidget {
  final ButtonController _buttonController = Get.put(ButtonController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Button with Bottom Container'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Obx(
            () => !_buttonController.isExpanded.value
                ? MaterialButton(
                    onPressed: _buttonController.toggleContainer,
                    child: const Text('Open Container'),
                  )
                : const SizedBox(height: 16),
          ),
          Obx(
            () => SizeTransition(
              sizeFactor: _buttonController.isExpanded.value
                  ? CurvedAnimation(
                      parent: _buttonController.animationController!,
                      curve: Curves.easeInOut,
                    )
                  // : const AlwaysStoppedAnimation<double>(0),
                  : CurvedAnimation(
                      parent: _buttonController.animationController!,
                      curve: Curves.easeInOut,
                    ),
              child: Container(
                color: Colors.grey[200],
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: mq.width * .04),
                      padding: EdgeInsets.symmetric(vertical: mq.width * .02),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                      ),
                      child: Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: mq.width * .02),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CustomElevatedButton(
                              isToggled:
                                  _buttonController.isCatBtnToggled.value,
                              onPressed: _buttonController.toggleOffer,
                              asset: _buttonController.isCatBtnToggled.value
                                  ? 'assets/icons/make_offer_selected.svg'
                                  : 'assets/icons/make_offer_unselected.svg',
                              label: 'Make an offer',
                              buttonColor: kofferColor,
                            ),
                            SizedBox(width: mq.width * .02),
                            CustomElevatedButton(
                              isToggled:
                                  _buttonController.isCustomBtnToggled.value,
                              onPressed: _buttonController.toggleCustom,
                              asset: _buttonController.isCustomBtnToggled.value
                                  ? 'assets/icons/customize_offer_selected.svg'
                                  : 'assets/icons/customize_offer_unselected.svg',
                              label: 'Customization Details',
                              buttonColor: kPrimaryColor,
                            ),
                          ],
                        ),
                      ),
                    ),
                    Obx(
                      () => _buttonController.isExpanded.value
                          ? _buttonController.isCatBtnToggled.value
                              ? Container(
                                  margin: const EdgeInsets.fromLTRB(2, 0, 2, 0),
                                  width: mq.width * .9,
                                  height: mq.height * .4,
                                  child: Stack(
                                    children: [
                                      Positioned(
                                        left: 0,
                                        top: 13,
                                        child: Container(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 20, vertical: 5),
                                          width: mq.width * .9,
                                          height: mq.height * .3,
                                          decoration: BoxDecoration(
                                            border:
                                                Border.all(color: kofferColor),
                                            color: kWhiteColor,
                                            borderRadius:
                                                BorderRadius.circular(12),
                                          ),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              const OfferNCustomTexts(
                                                title: 'Make an Offer',
                                                package: 'Shadi Package',
                                              ),
                                              Row(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  CustomAmountButton(
                                                    amount: '45000',
                                                    index: 0,
                                                    selectedButtonIndex:
                                                        _buttonController
                                                            .selectedButtonIndex
                                                            .value
                                                            .obs,
                                                    onPressed: (amount,
                                                            index) =>
                                                        _buttonController
                                                            .updateAmount(
                                                                amount, index),
                                                  ),
                                                  SizedBox(
                                                      width: mq.width * .01),
                                                  CustomAmountButton(
                                                    amount: '35000',
                                                    index: 1,
                                                    selectedButtonIndex:
                                                        _buttonController
                                                            .selectedButtonIndex
                                                            .value
                                                            .obs,
                                                    onPressed: (amount,
                                                            index) =>
                                                        _buttonController
                                                            .updateAmount(
                                                                amount, index),
                                                  ),
                                                  SizedBox(
                                                      width: mq.width * .01),
                                                  CustomAmountButton(
                                                    amount: '30000',
                                                    index: 2,
                                                    selectedButtonIndex:
                                                        _buttonController
                                                            .selectedButtonIndex
                                                            .value
                                                            .obs,
                                                    onPressed: (amount,
                                                            index) =>
                                                        _buttonController
                                                            .updateAmount(
                                                                amount, index),
                                                  ),
                                                ],
                                              ),
                                              SizedBox(height: mq.height * .05),
                                              Row(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  Text(
                                                    'RS',
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color: kTextColor),
                                                  ),
                                                  SizedBox(
                                                      width: mq.width * .01),
                                                  SizedBox(
                                                    width: mq.width * .2,
                                                    child: TextFormField(
                                                      controller: _buttonController
                                                          .offerAmountEditingController,
                                                      decoration:
                                                          const InputDecoration(
                                                        contentPadding:
                                                            EdgeInsets
                                                                .symmetric(
                                                                    vertical:
                                                                        5),
                                                        isCollapsed: true,
                                                        hintText:
                                                            'Amount in Rs',
                                                        hintStyle: TextStyle(
                                                            fontSize: 12),
                                                      ),
                                                    ),
                                                  ),
                                                  const Spacer(),
                                                  ElevatedButton(
                                                    onPressed: () {},
                                                    style: ElevatedButton
                                                        .styleFrom(
                                                            shape:
                                                                RoundedRectangleBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          20),
                                                            ),
                                                            backgroundColor:
                                                                kofferColor),
                                                    child: const Text(
                                                      'Next',
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: TextStyle(
                                                          color: Colors.white),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        left: mq.width * .4,
                                        top: 0,
                                        child: Container(
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            shape: BoxShape.circle,
                                            border: Border.all(
                                                color: const Color(0xff4285f4)),
                                          ),
                                          child: IconButton(
                                              onPressed: () {
                                                _buttonController
                                                    .toggleContainer();
                                              },
                                              color: kofferColor,
                                              style: TextButton.styleFrom(
                                                padding: EdgeInsets.zero,
                                              ),
                                              icon: const Icon(Icons
                                                  .keyboard_arrow_down_rounded)),
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              : Container(
                                  margin: const EdgeInsets.fromLTRB(2, 0, 2, 0),
                                  width: mq.width * .9,
                                  height: mq.height * .4,
                                  child: Stack(
                                    children: [
                                      Positioned(
                                        left: 0,
                                        top: 13,
                                        child: Container(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 20, vertical: 5),
                                          width: mq.width * .9,
                                          height: mq.height * .3,
                                          decoration: BoxDecoration(
                                            border: Border.all(
                                                color: kPrimaryColor),
                                            color: kWhiteColor,
                                            borderRadius:
                                                BorderRadius.circular(12),
                                          ),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              const OfferNCustomTexts(
                                                title: 'Add Customizaton',
                                                package: 'Shadi Package',
                                              ),
                                              //don't wanna show in next widget
                                              Row(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  CustomAmountButton(
                                                    amount: '45000',
                                                    index: 0,
                                                    selectedButtonIndex:
                                                        _buttonController
                                                            .selectedButtonIndex
                                                            .value
                                                            .obs,
                                                    onPressed: (amount,
                                                            index) =>
                                                        _buttonController
                                                            .updateAmount(
                                                                amount, index),
                                                  ),
                                                  SizedBox(
                                                      width: mq.width * .01),
                                                  CustomAmountButton(
                                                    amount: '35000',
                                                    index: 1,
                                                    selectedButtonIndex:
                                                        _buttonController
                                                            .selectedButtonIndex
                                                            .value
                                                            .obs,
                                                    onPressed: (amount,
                                                            index) =>
                                                        _buttonController
                                                            .updateAmount(
                                                                amount, index),
                                                  ),
                                                  SizedBox(
                                                      width: mq.width * .01),
                                                  CustomAmountButton(
                                                    amount: '30000',
                                                    index: 2,
                                                    selectedButtonIndex:
                                                        _buttonController
                                                            .selectedButtonIndex
                                                            .value
                                                            .obs,
                                                    onPressed: (amount,
                                                            index) =>
                                                        _buttonController
                                                            .updateAmount(
                                                                amount, index),
                                                  ),
                                                ],
                                              ),
                                              SizedBox(
                                                  height: mq.height *
                                                      .05), //don't wanna show in next widget
                                              Row(
                                                //don't wanna show in next widget
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  Text(
                                                    'RS',
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color: kTextColor),
                                                  ),
                                                  SizedBox(
                                                      width: mq.width * .01),
                                                  SizedBox(
                                                    width: mq.width * .2,
                                                    child: TextFormField(
                                                      controller: _buttonController
                                                          .offerDetailsEditingController,
                                                      decoration:
                                                          const InputDecoration(
                                                        contentPadding:
                                                            EdgeInsets
                                                                .symmetric(
                                                                    vertical:
                                                                        5),
                                                        isCollapsed: true,
                                                        hintText:
                                                            'Add Customizations here',
                                                        hintStyle: TextStyle(
                                                            fontSize: 12),
                                                      ),
                                                    ),
                                                  ),
                                                  const Spacer(),
                                                  ElevatedButton(
                                                    onPressed: () {
                                                      _buttonController
                                                          .toggleCustom();
                                                    },
                                                    style: ElevatedButton
                                                        .styleFrom(
                                                            shape:
                                                                RoundedRectangleBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          20),
                                                            ),
                                                            backgroundColor:
                                                                kofferColor),
                                                    child: const Text(
                                                      'Next',
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: TextStyle(
                                                          color: Colors.white),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        left: mq.width * .4,
                                        top: 0,
                                        child: Container(
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            shape: BoxShape.circle,
                                            border: Border.all(
                                                color: kPrimaryColor),
                                          ),
                                          child: IconButton(
                                              onPressed: () {
                                                _buttonController
                                                    .toggleContainer();
                                              },
                                              color: kPrimaryColor,
                                              style: TextButton.styleFrom(
                                                padding: EdgeInsets.zero,
                                              ),
                                              icon: const Icon(Icons
                                                  .keyboard_arrow_down_rounded)),
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                          : const SizedBox(),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
