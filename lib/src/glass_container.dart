import 'dart:ui';
import 'package:flutter/material.dart';

class GlassContainer extends StatelessWidget {
  final Widget child;
  final double blur;
  final double opacity;
  final BorderRadius? borderRadius;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final double? width;
  final double? height;
  final Color? color;

  const GlassContainer({
    Key? key,
    required this.child,
    this.blur = 15.0,
    this.opacity = 0.2,
    this.borderRadius,
    this.padding,
    this.margin,
    this.width,
    this.height,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final defaultBorderRadius = borderRadius ?? BorderRadius.circular(16);
    final baseColor = color ?? Colors.white;
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Container(
      margin: margin,
      width: width,
      height: height,
      decoration: BoxDecoration(
        borderRadius: defaultBorderRadius,
        boxShadow: isDark
            ? null
            : const [
                BoxShadow(
                    color: Color(0x0F1B2733),
                    blurRadius: 20,
                    offset: Offset(0, 8)),
                BoxShadow(
                    color: Color(0x0A1B2733),
                    blurRadius: 2,
                    offset: Offset(0, 1)),
              ],
      ),
      child: ClipRRect(
        borderRadius: defaultBorderRadius,
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: blur, sigmaY: blur),
          child: Container(
            padding: padding,
            decoration: BoxDecoration(
              color: baseColor.withValues(alpha: opacity),
              borderRadius: defaultBorderRadius,
              border: Border.all(
                color: isDark
                    ? const Color(0xFF2C3742).withValues(alpha: opacity + 0.3)
                    : const Color(0xFFE7ECF1).withValues(alpha: opacity + 0.5),
                width: 1.0,
              ),
            ),
            child: child,
          ),
        ),
      ),
    );
  }
}
