import 'dart:ui';
import 'package:flutter/material.dart';

class GlassTextField extends StatefulWidget {
  final TextEditingController? controller;
  final String? hintText;
  final bool obscureText;
  final double blur;
  final double opacity;

  const GlassTextField({
    Key? key,
    this.controller,
    this.hintText,
    this.obscureText = false,
    this.blur = 15.0,
    this.opacity = 0.1,
  }) : super(key: key);

  @override
  State<GlassTextField> createState() => _GlassTextFieldState();
}

class _GlassTextFieldState extends State<GlassTextField> {
  final FocusNode _focusNode = FocusNode();
  bool _isFocused = false;

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(() {
      setState(() => _isFocused = _focusNode.hasFocus);
    });
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        boxShadow: _isFocused
            ? [
                BoxShadow(
                  color: Theme.of(context).primaryColor.withValues(alpha: 0.3),
                  blurRadius: 20,
                  spreadRadius: 2,
                )
              ]
            : null,
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: widget.blur, sigmaY: widget.blur),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white.withValues(alpha: widget.opacity),
              borderRadius: BorderRadius.circular(16),
              border: Border.all(
                color: _isFocused
                    ? Theme.of(context).primaryColor
                    : Colors.white.withValues(alpha: 0.2),
                width: 1.5,
              ),
            ),
            child: TextField(
              controller: widget.controller,
              focusNode: _focusNode,
              obscureText: widget.obscureText,
              style: const TextStyle(color: Colors.white),
              decoration: InputDecoration(
                hintText: widget.hintText,
                hintStyle: TextStyle(color: Colors.white.withValues(alpha: 0.6)),
                border: InputBorder.none,
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
