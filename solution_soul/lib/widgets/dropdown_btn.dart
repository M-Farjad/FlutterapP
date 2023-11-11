import 'package:flutter/material.dart';

class DropdownButtonField extends StatelessWidget {
  DropdownButtonField({super.key});

  // final CardPaymentController controller = Get.find<CardPaymentController>();
  final List items = ['Duplicate', 'Delete'];
  @override
  Widget build(BuildContext context) {
    return DropdownButton(
      value: items[0],
      items:
          items.map((e) => DropdownMenuItem(value: e, child: Text(e))).toList(),
      icon: Icon(
        Icons.keyboard_arrow_down_rounded,
        color: Colors.black,
      ),
      // decoration: InputDecoration(ar(10),
      //     borderSide: BorderSide.none,
      //   ),
      // ),
      //   filled: true,
      //   fillColor: Colors.grey,
      //   contentPadding: const EdgeInsets.all(10),
      //   border: OutlineInputBorder(
      //     borderRadius: BorderRadius.circul
      onChanged: (value) {
        // controller.selectValue(value as String);
      },
    );
  }
}
