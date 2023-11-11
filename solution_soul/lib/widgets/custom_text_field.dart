import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({super.key, required this.controller, required this.text});
  final TextEditingController controller;
  final String text;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      // controller: codeController,
      enableInteractiveSelection: true,
      decoration: InputDecoration(
        hintStyle: const TextStyle(color: Colors.grey),
        hintText: 'Enter $text',
        filled: true,
        fillColor: Colors.grey[300],
        contentPadding: const EdgeInsets.all(10),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide.none,
        ),
      ),
      style: const TextStyle(
        color: Colors.black,
        fontSize: 18,
      ),
    );
  }
}
