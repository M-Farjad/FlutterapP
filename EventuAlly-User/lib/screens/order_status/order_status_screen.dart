import 'package:eventually_user/screens/orders/components/action_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

import '../../controllers/order_pic_controller.dart';
import '../../routes.dart';
import '../../widget/price_people_text.dart';
import '../../widget/product_categories.dart';
import '../../widget/product_image_view.dart';
import '../../widget/product_title_text.dart';
import '../../widget/text_appbar.dart';
import '../../constants/constant.dart';
import 'components/order_date.dart';
import 'components/order_duration.dart';
import 'components/order_location.dart';

// ignore: must_be_immutable
class OrderStatusScreen extends StatelessWidget {
  OrderStatusScreen({super.key});
  final List<String> _list = [
    'Order\nPending',
    'Order\nCompleted/Verified',
  ];
  OrderPicController orderPicController = Get.put(OrderPicController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TextAppBar(title: 'Order Details'),
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.symmetric(horizontal: Get.width * .08),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text('Order Status', style: kBlackTextStyle),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: Get.width * .02, vertical: Get.height * .02),
                child: StepProgressIndicator(
                  totalSteps: _list.length,
                  currentStep: 1,
                  size: Get.height * .08,
                  padding: Get.width * .02,
                  selectedColor: Color(constant.red),
                  unselectedColor: Colors.grey,
                  customStep: makeProgressSteps,
                ),
              ),
              ProductImageView(orderPicController: orderPicController),
              const ProductTitleText(),
              Text('Order Number: 098765', style: kRedTextStyle),
              SizedBox(height: Get.height * .015),
              const ProductDescription(
                  description:
                      'Biryani, Qorma, Kheer, Kabab, Gulab Jamun, Pulao, Chapati, Naan, Broast & Custard. Biryani, Qorma, Kheer, Kabab, Gulab Jamun, Pulao, Chapati, Naan, Broast & Custard.'),
              SizedBox(height: Get.height * .015),
              const PriceAndPeopleText(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '50,000 Rs',
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                      color: Color(constant.lightGrey),
                      fontSize: 24,
                      fontFamily: constant.font,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Text(
                    '100',
                    textAlign: TextAlign.right,
                    style: TextStyle(
                      color: Color(constant.lightGrey),
                      fontSize: 24,
                      fontFamily: constant.font,
                      fontWeight: FontWeight.w700,
                    ),
                  )
                ],
              ),
              SizedBox(height: Get.height * .015),
              const OrderDate(),
              const OrderLocation(),
              const OrderDuration(),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    child: Text(
                      'Order Completed? Verify here',
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color(constant.lightGrey),
                        fontSize: 10.52,
                        fontFamily: constant.font,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ),
                  ActionButton(
                    onTap: () => Get.toNamed(NamedRoutes.verifyOrder),
                    color: Color(constant.green),
                    text: 'Verify',
                  )
                ],
              )
            ],
          ),
        ),
      )),
    );
  }

  Widget makeProgressSteps(index, color, _) {
    return Column(
      children: [
        Container(
          height: 9,
          decoration: ShapeDecoration(
            color: color,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(7)),
          ),
        ),
        SizedBox(height: Get.height * .01),
        SizedBox(
          // width: Get.width * .15,
          child: Text(
            _list[index],
            maxLines: 2,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: color,
              fontSize: 11,
              fontFamily: constant.font,
              fontWeight: FontWeight.w800,
            ),
          ),
        )
      ],
    );
  }
}
