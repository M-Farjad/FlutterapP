import 'package:flutter/material.dart';

import '../../orders/orders_screen.dart';

class OrderLocation extends StatelessWidget {
  const OrderLocation({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: mq.width * .18,
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
        const Expanded(
          // width: 258,
          child: Text(
            softWrap: true,
            maxLines: 2,
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
    );
  }
}