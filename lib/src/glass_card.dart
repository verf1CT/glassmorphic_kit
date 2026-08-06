import 'package:flutter/material.dart';
import 'glass_container.dart';

class GlassCard extends StatelessWidget {
  final Widget child;
  final double blur;
  final double opacity;
  final BorderRadius? borderRadius;
  final EdgeInsetsGeometry? padding;

  const GlassCard({
    Key? key,
    required this.child,
    this.blur = 20.0,
    this.opacity = 0.15,
    this.borderRadius,
    this.padding = const EdgeInsets.all(24.0),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GlassContainer(
      blur: blur,
      opacity: opacity,
      borderRadius: borderRadius ?? BorderRadius.circular(24),
      padding: padding,
      child: child,
    );
  }
}
