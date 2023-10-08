import 'package:flutter/material.dart';

class TitleBar extends StatelessWidget {
  const TitleBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Padding(
              padding: const EdgeInsets.only(right: 18, left: 18, bottom: 18),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Will you have',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 24,
                        fontWeight: FontWeight.w600),
                  ),
                  Text(
                    'Some more',
                    style: TextStyle(
                        color: Colors.black.withOpacity(0.5),
                        fontSize: 24,
                        fontWeight: FontWeight.w600),
                  ),
                  Text(
                    'Cakes',
                    style: TextStyle(
                        color: Colors.pink,
                        fontSize: 30,
                        fontWeight: FontWeight.w700),
                  )
                ],
              )),
        ),
        Container(
          margin: EdgeInsets.only(right: 18),
          decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  blurRadius: 8,
                  offset: Offset(-5, 5),
                  spreadRadius: 4,
                  color: Colors.black.withOpacity(0.08),
                ),
                BoxShadow(
                  blurRadius: 8,
                  offset: Offset(5, 5),
                  spreadRadius: 4,
                  color: Colors.black.withOpacity(0.08),
                ),
              ]),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(
              Icons.search,
              size: 35,
              color: Colors.black.withOpacity(0.5),
            ),
          ),
        ),
      ],
    );
  }
}
