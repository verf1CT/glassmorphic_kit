import 'dart:ui';
import 'package:flutter/material.dart';

class AnimatedGlassContainer extends ImplicitlyAnimatedWidget {
  final Widget child;
  final double blur;
  final double opacity;
  final BorderRadius? borderRadius;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final double? width;
  final double? height;
  final Color? color;

  const AnimatedGlassContainer({
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
    required Duration duration,
    Curve curve = Curves.linear,
  }) : super(key: key, duration: duration, curve: curve);

  @override
  ImplicitlyAnimatedWidgetState<AnimatedGlassContainer> createState() => _AnimatedGlassContainerState();
}

class _AnimatedGlassContainerState extends AnimatedWidgetBaseState<AnimatedGlassContainer> {
  Tween<double>? _blurTween;
  Tween<double>? _opacityTween;
  ColorTween? _colorTween;

  @override
  void forEachTween(TweenVisitor<dynamic> visitor) {
    _blurTween = visitor(_blurTween, widget.blur, (dynamic value) => Tween<double>(begin: value as double)) as Tween<double>?;
    _opacityTween = visitor(_opacityTween, widget.opacity, (dynamic value) => Tween<double>(begin: value as double)) as Tween<double>?;
    _colorTween = visitor(_colorTween, widget.color ?? Colors.white, (dynamic value) => ColorTween(begin: value as Color)) as ColorTween?;
  }

  @override
  Widget build(BuildContext context) {
    final defaultBorderRadius = widget.borderRadius ?? BorderRadius.circular(16);
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final currentBlur = _blurTween?.evaluate(animation) ?? widget.blur;
    final currentOpacity = _opacityTween?.evaluate(animation) ?? widget.opacity;
    final currentColor = _colorTween?.evaluate(animation) ?? Colors.white;

    return Container(
      margin: widget.margin,
      width: widget.width,
      height: widget.height,
      decoration: BoxDecoration(
        borderRadius: defaultBorderRadius,
        boxShadow: isDark
            ? null
            : const [
                BoxShadow(color: Color(0x0F1B2733), blurRadius: 20, offset: Offset(0, 8)),
                BoxShadow(color: Color(0x0A1B2733), blurRadius: 2, offset: Offset(0, 1)),
              ],
      ),
      child: ClipRRect(
        borderRadius: defaultBorderRadius,
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: currentBlur, sigmaY: currentBlur),
          child: Container(
            padding: widget.padding,
            decoration: BoxDecoration(
              color: currentColor.withOpacity(currentOpacity),
              borderRadius: defaultBorderRadius,
              border: Border.all(
                color: isDark 
                    ? const Color(0xFF2C3742).withOpacity(currentOpacity + 0.3)
                    : const Color(0xFFE7ECF1).withOpacity(currentOpacity + 0.5),
                width: 1.0,
              ),
            ),
            child: widget.child,
          ),
        ),
      ),
    );
  }
}
