import 'package:flutter/material.dart';

class TorchIntervalSlider extends StatefulWidget {
  const TorchIntervalSlider(this._onChanged, {super.key});

  final void Function(double) _onChanged;

  @override
  State<TorchIntervalSlider> createState() {
    return _TorchIntervalSliderState();
  }
}

class _TorchIntervalSliderState extends State<TorchIntervalSlider> {
  double _currentValue = 1.0;

  @override
  Widget build(context) {
    return Column(
      children: [
        Slider(
          value: _currentValue,
          max: 1.0,
          min: 0.25,
          divisions: 3,
          onChanged: (double value) {
            setState(() {
              _currentValue = value;
              widget._onChanged(value);
            });
          },
        ),
        Text(
          '${_currentValue}s',
          style: const TextStyle(
            fontSize: 24.0,
          ),
        )
      ],
    );
  }
}