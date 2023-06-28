import 'package:flutter/material.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

import '../../widget/text_appbar.dart';
import '../../constants/constant.dart';
import '../orders/orders_screen.dart';

class OrderStatusScreen extends StatelessWidget {
  OrderStatusScreen({super.key});
  final List<String> _list = [
    'Order Pending',
    'Order Completed',
    'Verification Pending'
  ];
  @override
  Widget build(BuildContext context) {
    mq = MediaQuery.of(context).size;
    return Scaffold(
      appBar: const TextAppBar(title: 'Order Details'),
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.symmetric(horizontal: mq.width * .08),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Text('Order Status', style: kBlackTextStyle),
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: mq.width * .02, vertical: mq.height * .02),
                  child: StepProgressIndicator(
                    totalSteps: 3,
                    currentStep: 1,
                    size: mq.height * .08,
                    padding: mq.width * .006,
                    selectedColor: Color(constant.red),
                    unselectedColor: Colors.grey,
                    customStep: makeProgressSteps,
                  ),
                ),
                Container(
                  width: double.infinity,
                  height: mq.height * .3,
                  decoration: ShapeDecoration(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: Image.asset(
                      'assets/images/caterers.jpg',
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                Text(
                  'Shadi Package',
                  style: TextStyle(
                    color: Color(constant.black),
                    fontSize: 24,
                    fontFamily: 'Manrope',
                    fontWeight: FontWeight.w800,
                  ),
                ),
                Text('Order Number: 098765', style: kRedTextStyle),
                SizedBox(height: mq.height * .015),
                const Text(
                  'Biryani, Qorma, Kheer, Kabab, Gulab Jamun, Pulao, Chapati, Naan, Broast & Custard. Biryani, Qorma, Kheer, Kabab, Gulab Jamun, Pulao, Chapati, Naan, Broast & Custard.',
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                    color: Color(0xFF555454),
                    fontSize: 12,
                    fontFamily: 'Manrope',
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: mq.height * .015),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Price',
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                        color: Color(0x7F555454),
                        fontSize: 12,
                        fontFamily: 'Manrope',
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Text(
                      'Person',
                      textAlign: TextAlign.right,
                      style: TextStyle(
                        color: Color(0x7F555454),
                        fontSize: 12,
                        fontFamily: 'Manrope',
                        fontWeight: FontWeight.w700,
                      ),
                    )
                  ],
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '50,000 Rs',
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                        color: Color(0xFF555454),
                        fontSize: 24,
                        fontFamily: 'Manrope',
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Text(
                      '100',
                      textAlign: TextAlign.right,
                      style: TextStyle(
                        color: Color(0xFF555454),
                        fontSize: 24,
                        fontFamily: 'Manrope',
                        fontWeight: FontWeight.w700,
                      ),
                    )
                  ],
                ),
                SizedBox(height: mq.height * .015),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: mq.width * .16,
                      child: const Text(
                        'Date',
                        style: TextStyle(
                          color: Color(0xFF555454),
                          fontSize: 14,
                          fontFamily: 'Manrope',
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    const Expanded(
                      child: Text(
                        '21/05/2023',
                        style: TextStyle(
                          color: Color(0xFFCB585A),
                          fontSize: 16,
                          fontFamily: 'Manrope',
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    )
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: mq.width * .16,
                      child: const Text(
                        'Location',
                        style: TextStyle(
                          color: Color(0xFF555454),
                          fontSize: 14,
                          fontFamily: 'Manrope',
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 258,
                      child: Text(
                        'XYZ building XZ block, Latifabad, Hyd. ',
                        style: TextStyle(
                          color: Color(0xFFCB585A),
                          fontSize: 16,
                          fontFamily: 'Manrope',
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    )
                  ],
                ),
                Row(
                  children: [
                    SizedBox(
                      width: mq.width * .16,
                      child: const Text(
                        'Duration',
                        textAlign: TextAlign.justify,
                        style: TextStyle(
                          color: Color(0xFF555454),
                          fontSize: 14,
                          fontFamily: 'Manrope',
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    const Text(
                      '6:00 pm to 12:00 am',
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                        color: Color(0xFFCB585A),
                        fontSize: 16,
                        fontFamily: 'Manrope',
                        fontWeight: FontWeight.w700,
                      ),
                    )
                  ],
                )
              ],
            ),
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
        SizedBox(height: mq.height * .01),
        SizedBox(
          width: mq.width * .15,
          child: Text(
            _list[index],
            maxLines: 2,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: color,
              fontSize: 11,
              fontFamily: 'Manrope',
              fontWeight: FontWeight.w800,
            ),
          ),
        )
      ],
    );
  }
}
