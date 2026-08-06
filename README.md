# 🔮 Glassmorphic Kit

![Pub Version](https://img.shields.io/pub/v/glassmorphic_kit?color=blue)
![License](https://img.shields.io/badge/license-MIT-blue.svg)
![Flutter](https://img.shields.io/badge/flutter-supported-02569B?logo=flutter)

A premium Flutter UI kit for implementing beautiful, high-performance glassmorphism effects in your applications. 

This package comes with a **[Figma Plugin](https://github.com/verf1CT/glassmorphic_kit/tree/main/figma-plugin)** that allows designers and developers to instantly convert Figma glass layers into ready-to-use Dart code!

## ✨ Features
* **AnimatedGlassContainer:** Beautiful frosted glass containers with implicit animations.
* **GlassBottomNavigationBar:** A modern, translucent navigation bar with glowing active states.
* **Figma Plugin Integration:** Generate the exact border radiuses, opacities, and blur amounts directly from your design files.
* **Highly Customizable:** Control blur intensity, gradients, borders, and noise texture.

## 🚀 Installation

Add the dependency to your `pubspec.yaml`:
```yaml
dependencies:
  glassmorphic_kit: ^1.0.0
```

## 💻 Usage

```dart
import 'package:glassmorphic_kit/glassmorphic_kit.dart';

AnimatedGlassContainer(
  width: 300,
  height: 200,
  blur: 15.0,
  opacity: 0.2,
  borderOpacity: 0.5,
  borderRadius: BorderRadius.circular(24),
  gradient: LinearGradient(
    colors: [
      Colors.white.withOpacity(0.2),
      Colors.white.withOpacity(0.05),
    ],
  ),
  child: Center(
    child: Text('Premium Glassmorphism', style: TextStyle(color: Colors.white)),
  ),
);
```

## 🎨 Figma Plugin
Want to skip manually typing parameters? Use our **Glassmorphic Kit Figma Plugin** (found in the `figma-plugin` folder) to instantly extract Dart code from your designs!

## 🤝 Contributing
Contributions are welcome! Feel free to open an issue or submit a pull request.
