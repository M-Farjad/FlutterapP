import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
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
          SizedBox(height: mq.height * .01),
          Expanded(
              child: ListView.builder(
            itemCount: 4,
            itemBuilder: (context, index) => OrderCard(),
          ))
        ],
      ), // TODO add orders list here
    );
  }
}

class OrderCard extends StatelessWidget {
  const OrderCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: mq.width * .03, vertical: mq.height * .015),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: mq.width * .03, vertical: mq.height * .015),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Saleem Caterers',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontFamily: 'Manrope',
                  fontWeight: FontWeight.w800,
                ),
              ),
              SizedBox(height: mq.height * .01),
              Container(
                padding: EdgeInsets.zero,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset(
                        'assets/images/caterers.png',
                        width: 100,
                        height: 100,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Shadi Package',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontFamily: 'Manrope',
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                          const Text(
                            'Date : 21-05-2023',
                            textAlign: TextAlign.justify,
                            style: TextStyle(
                              color: Color(0xFF555454),
                              fontSize: 8,
                              fontFamily: 'Manrope',
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          const Text(
                            'Location : XYZ building XYZ block, Latifabad, Hyd.',
                            textAlign: TextAlign.justify,
                            style: TextStyle(
                              color: Color(0xFF555454),
                              fontSize: 8,
                              fontFamily: 'Manrope',
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          SizedBox(height: mq.height * .04),
                          const Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                '50,000 Rs',
                                textAlign: TextAlign.justify,
                                style: TextStyle(
                                  color: Color(0xFF9C0C0C),
                                  fontSize: 18,
                                  fontFamily: 'Manrope',
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              Text(
                                'per 100 person',
                                style: TextStyle(
                                  color: Color(0xFFA2A2A2),
                                  fontSize: 9,
                                  fontFamily: 'Manrope',
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
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
