import 'package:flutter/material.dart';

class CustomOutlinedButton extends StatelessWidget {
  const CustomOutlinedButton({
    super.key,
    this.text,
    this.child,
    this.onTap,
    this.bgColor = Colors.transparent,
    this.color = Colors.black,
    this.isNormal = true,
  });
  final String? text;
  final Widget? child;
  final Function()? onTap;
  final Color bgColor;
  final Color color;
  final bool isNormal;
  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      style: OutlinedButton.styleFrom(
          // backgroundColor: Colors.transparent,
          backgroundColor: bgColor,
          foregroundColor: color,
          padding: EdgeInsets.symmetric(
            horizontal: 20,
            vertical: isNormal ? 16 : 8,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          textStyle: TextStyle(
            fontSize: isNormal ? 18 : 16,
            fontWeight: FontWeight.w600,
            color: color,
          )),
      onPressed: onTap,
      child: text != null ? Text(text!) : child ?? const SizedBox.shrink(),
    );
  }
}
