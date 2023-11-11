import 'package:flutter/material.dart';

enum ShadowRange { none, low, normal, hgih }

class CurveBox extends StatelessWidget {
  const CurveBox({
    super.key,
    required this.child,
    this.shadowRange = ShadowRange.low,
    this.color,
    this.border,
    this.radius = 12,
  });
  final Widget child;
  final ShadowRange shadowRange;
  final Color? color;
  final Border? border;
  final double radius;
  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        color: color,
        boxShadow: _shadow,
        borderRadius: BorderRadius.circular(radius),
        border: border,
      ),
      child: child,
    );
  }

  List<BoxShadow>? get _shadow {
    if (shadowRange == ShadowRange.none) return _none;
    if (shadowRange == ShadowRange.low) return _normal;
    if (shadowRange == ShadowRange.normal) return _normal;
    if (shadowRange == ShadowRange.hgih) return _high;
    return null;
  }

  static const _none = null;
  static final List<BoxShadow> _normal = [
    BoxShadow(
      color: Colors.grey.withOpacity(0.2), // Shadow color
      spreadRadius: 2, // How wide the shadow is
      blurRadius: 4, // How blurred the shadow is
      offset: const Offset(0, 2), // Offset of the shadow
    ),
  ];
  static final List<BoxShadow> _high = [
    BoxShadow(
      color: Colors.grey.withOpacity(0.5), // Shadow color
      spreadRadius: 5, // How wide the shadow is
      blurRadius: 5, // How blurred the shadow is
      offset: const Offset(0, 2), // Offset of the shadow
    ),
  ];
}
