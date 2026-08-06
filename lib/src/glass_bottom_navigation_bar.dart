import 'package:flutter/material.dart';
import 'glass_container.dart';

class GlassBottomNavigationBar extends StatelessWidget {
  final List<BottomNavigationBarItem> items;
  final int currentIndex;
  final ValueChanged<int>? onTap;
  final double blur;
  final double opacity;
  final Color? color;

  const GlassBottomNavigationBar({
    Key? key,
    required this.items,
    this.currentIndex = 0,
    this.onTap,
    this.blur = 20.0,
    this.opacity = 0.2,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        child: GlassContainer(
          blur: blur,
          opacity: opacity,
          color: color,
          borderRadius: BorderRadius.circular(32),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: List.generate(items.length, (index) {
                final item = items[index];
                final isSelected = index == currentIndex;
                final theme = Theme.of(context);
                final iconColor = isSelected ? theme.primaryColor : theme.unselectedWidgetColor;
                
                return GestureDetector(
                  onTap: () => onTap?.call(index),
                  behavior: HitTestBehavior.opaque,
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 250),
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: isSelected ? theme.primaryColor.withOpacity(0.15) : Colors.transparent,
                      borderRadius: BorderRadius.circular(24),
                    ),
                    child: IconTheme(
                      data: IconThemeData(color: iconColor, size: 24),
                      child: isSelected ? (item.activeIcon ?? item.icon) : item.icon,
                    ),
                  ),
                );
              }),
            ),
          ),
        ),
      ),
    );
  }
}
