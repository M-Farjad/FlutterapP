import 'package:liveroute/headers.dart';

class CustomElevatedButton extends StatelessWidget {
  const CustomElevatedButton(
      {super.key,
      this.text,
      this.child,
      this.onTap,
      this.color = ColorConfigs.actionColor,
      this.isNormal = true});
  final String? text;
  final Widget? child;
  final Function()? onTap;
  final Color color;
  final bool isNormal;
  @override
  Widget build(BuildContext context) {
    // isNormal = true;
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        backgroundColor: color,
        padding: EdgeInsets.symmetric(
          horizontal: 20,
          vertical:
              isNormal ? rSize(mobile: 12, web: 18) : rSize(mobile: 8, web: 14),
        ),
        textStyle: TextStyle(
          fontSize: isNormal
              ? rSize(mobile: 16, web: 18)
              : rSize(mobile: 14, web: 16),
          fontWeight: FontWeight.w600,
        ),
      ),
      onPressed: onTap,
      child: text != null ? Text(text!) : child ?? const SizedBox.shrink(),
    );
  }
}
