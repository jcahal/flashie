import 'package:flutter/material.dart';

class TorchIntervalButton extends StatefulWidget {
  const TorchIntervalButton(this._onPressed, {super.key});

  final void Function(bool) _onPressed;

  @override
  State<TorchIntervalButton> createState() {
    return _TorchIntervalButtonState();
  }
}

class _TorchIntervalButtonState extends State<TorchIntervalButton> {
  bool _isEnabled = false;
  IconData _icon = Icons.timer_off;

  @override
  Widget build(context) {
    return IconButton.filled(
      iconSize: 96.0,
      padding: const EdgeInsets.all(48.0),
      style: ButtonStyle(
        elevation: MaterialStateProperty.all(3.33),
      ),
      icon: Icon(
        _icon,
      ),
      onPressed: () { 
        setState(() {
          if (_isEnabled) {
            _icon = Icons.timer_off;
            _isEnabled = false;
          } else {
            _icon = Icons.timer;
            _isEnabled = true;
          }
          widget._onPressed(_isEnabled);
        });
      },
    );
  }
}