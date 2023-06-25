import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/order_btn_controller.dart';

late Size mq;

class OrdersScreen extends StatelessWidget {
  OrdersScreen({super.key});
  final OrdersBtnController controller = Get.put(OrdersBtnController());

  @override
  Widget build(BuildContext context) {
    if (controller.isFirstButtonActive.value) {
      controller.setActiveButtonColor();
    } else {
      controller.setAllButtonColor();
    }
    mq = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(CupertinoIcons.back),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          'Your Orders',
          style: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 20,
          ),
        ),
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: mq.width * .1),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Obx(
                  () => ListOrderButton(
                    title: 'Active Orders',
                    color: controller.activeButtonColor.value,
                    onpressed: () {
                      controller.setActiveButtonColor();
                    },
                  ),
                ),
                SizedBox(width: mq.width * .05),
                Obx(
                  () => ListOrderButton(
                    title: 'All Orders',
                    color: controller.allButtonColor.value,
                    onpressed: () {
                      controller.setAllButtonColor();
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ), // TODO add orders list here
    );
  }
}

class ListOrderButton extends StatelessWidget {
  const ListOrderButton({
    super.key,
    required this.onpressed,
    required this.color,
    required this.title,
  });
  final VoidCallback onpressed;
  final Color color;
  final String title;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ElevatedButton(
        onPressed: onpressed,
        style: ElevatedButton.styleFrom(
          elevation: 4,
          padding: EdgeInsets.symmetric(
              horizontal: mq.width * .06, vertical: mq.height * .03),
          backgroundColor: color,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        child: Text(
          title,
          style: const TextStyle(
              fontSize: 16, fontWeight: FontWeight.bold, fontFamily: 'Manrope'),
        ),
      ),
    );
  }
}
