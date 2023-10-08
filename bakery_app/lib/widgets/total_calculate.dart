import 'package:flutter/material.dart';

class TotalCalculate extends StatelessWidget {
  const TotalCalculate({
    super.key,
    required this.height,
    required this.width,
  });

  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Stack(
        children: [
          Container(
            height: height / 5,
            width: width,
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 233, 30, 155).withOpacity(0.08),
              borderRadius: BorderRadius.all(
                Radius.circular(15),
              ),
              boxShadow: [
                BoxShadow(
                  blurRadius: 8,
                  offset: Offset(-5, 5),
                  spreadRadius: 4,
                  color: Colors.black.withOpacity(0.08),
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Subtotal',
                        style: TextStyle(
                            fontSize: 18,
                            color: Colors.pink,
                            fontWeight: FontWeight.w200),
                      ),
                      Text(
                        '350.20',
                        style: TextStyle(
                            fontSize: 18,
                            color: Colors.pink,
                            fontWeight: FontWeight.w200),
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Delivery Fee',
                        style: TextStyle(
                            fontSize: 18,
                            color: Colors.pink,
                            fontWeight: FontWeight.w200),
                      ),
                      Text(
                        '350.20',
                        style: TextStyle(
                            fontSize: 18,
                            color: Colors.pink,
                            fontWeight: FontWeight.w200),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 60,
            child: Container(
              width: width - 40,
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Total',
                      style: TextStyle(
                          fontSize: 18,
                          color: Colors.pink,
                          fontWeight: FontWeight.w200),
                    ),
                    Text(
                      '350.20',
                      style: TextStyle(
                          fontSize: 18,
                          color: Colors.pink,
                          fontWeight: FontWeight.w200),
                    )
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            child: InkWell(
              child: Container(
                width: width - 40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(15),
                  ),
                  color: Colors.pink,
                ),
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Check out',
                      style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.w300,
                          color: Colors.white),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
