import 'package:flutter/material.dart';
import 'package:glassmorphic_kit/glassmorphic_kit.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Glassmorphic Kit Playground',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        brightness: Brightness.light,
      ),
      darkTheme: ThemeData(brightness: Brightness.dark),
      themeMode: ThemeMode.dark,
      home: const PlaygroundPage(),
    );
  }
}

class PlaygroundPage extends StatefulWidget {
  const PlaygroundPage({Key? key}) : super(key: key);

  @override
  State<PlaygroundPage> createState() => _PlaygroundPageState();
}

class _PlaygroundPageState extends State<PlaygroundPage> {
  double _blur = 15.0;
  double _opacity = 0.2;
  double _radius = 24.0;
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background Gradient
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFFE8CBC0), Color(0xFF636FA4)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
          ),
          SafeArea(
            child: Row(
              children: [
                Expanded(
                  child: Center(
                    child: AnimatedGlassContainer(
                      duration: const Duration(milliseconds: 300),
                      width: 300,
                      height: 300,
                      blur: _blur,
                      opacity: _opacity,
                      borderRadius: BorderRadius.circular(_radius),
                      child: Center(
                        child: Text(
                          'Glassmorphic Kit',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.white.withOpacity(0.9),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                // Controls Panel
                Container(
                  width: 300,
                  color: Colors.black45,
                  padding: const EdgeInsets.all(24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Playground Controls',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 32),
                      const Text(
                        'Blur',
                        style: TextStyle(color: Colors.white70),
                      ),
                      Slider(
                        value: _blur,
                        min: 0,
                        max: 40,
                        onChanged: (val) => setState(() => _blur = val),
                      ),
                      const SizedBox(height: 16),
                      const Text(
                        'Opacity',
                        style: TextStyle(color: Colors.white70),
                      ),
                      Slider(
                        value: _opacity,
                        min: 0,
                        max: 1,
                        onChanged: (val) => setState(() => _opacity = val),
                      ),
                      const SizedBox(height: 16),
                      const Text(
                        'Border Radius',
                        style: TextStyle(color: Colors.white70),
                      ),
                      Slider(
                        value: _radius,
                        min: 0,
                        max: 100,
                        onChanged: (val) => setState(() => _radius = val),
                      ),
                      const SizedBox(height: 24),
                      GlassTextField(
                        hintText: 'Enter text here...',
                        blur: _blur,
                        opacity: _opacity,
                      ),
                      const SizedBox(height: 16),
                      GlassDatePicker(
                        initialDate: DateTime.now(),
                        onDateSelected: (date) {
                          print('Selected: \$date');
                        },
                      ),
                      const SizedBox(height: 32),
                      ElevatedButton.icon(
                        icon: const Icon(Icons.copy),
                        label: const Text('Copy Code'),
                        onPressed: () {
                          // Copy code action mock
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: GlassBottomNavigationBar(
        blur: _blur,
        opacity: _opacity,
        currentIndex: _currentIndex,
        onTap: (i) => setState(() => _currentIndex = i),
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
    );
  }
}
