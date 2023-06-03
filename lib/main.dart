import 'package:flutter/material.dart';

import 'package:flashie/flashie.dart';

void main() {
  runApp(const TorchInterval());
}

class TorchInterval extends StatelessWidget {
  const TorchInterval({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flashie',
      theme: ThemeData(
        useMaterial3: true,
        sliderTheme: const SliderThemeData(
          trackHeight: 10.0,
        ),
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Center(
            child: Text(
              'FLASHIE',
              style: TextStyle(
                fontSize: 48.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        body: const Flashie(),
      ),
    );
  }
}
