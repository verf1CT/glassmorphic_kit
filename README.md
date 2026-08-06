<div align="center">

# 🪟 Glassmorphic Kit

**A premium, beautiful glassmorphism UI kit for Flutter.**

[![License: MIT](https://img.shields.io/badge/License-MIT-blue.svg?style=for-the-badge)](LICENSE)

</div>

Create stunning iOS-like blurred interfaces in seconds. `glassmorphic_kit` provides ready-to-use widgets like `GlassCard` and `GlassContainer` with perfect blur, transparency, and borders.

## 🚀 Installation

Add to your `pubspec.yaml`:

```yaml
dependencies:
  glassmorphic_kit: ^1.0.0
```

## 🛠️ Usage

### Basic GlassCard
```dart
import 'package:glassmorphic_kit/glassmorphic_kit.dart';

GlassCard(
  blur: 20,
  opacity: 0.15,
  borderRadius: BorderRadius.circular(16),
  child: const Padding(
    padding: EdgeInsets.all(24),
    child: Text(
      'Premium Card',
      style: TextStyle(color: Colors.white, fontSize: 24),
    ),
  ),
)
```

### Custom GlassContainer
```dart
GlassContainer(
  blur: 30,
  opacity: 0.1,
  color: Colors.blueAccent, // Base tint color
  child: YourWidget(),
)
```

## 🤝 Contributing
Contributions, issues, and feature requests are welcome!

## 📄 License
This project is MIT licensed.
