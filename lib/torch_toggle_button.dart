import 'dart:async';

import 'package:flutter/material.dart';

class TorchToggleButton extends StatefulWidget {
  const TorchToggleButton(this._onPressed, this._torchStateStream, {super.key});

  final Function _onPressed;
  final Stream<bool> _torchStateStream;

  @override
  State<TorchToggleButton> createState() {
    return TorchToggleButtonState();
  }
}

class TorchToggleButtonState extends State<TorchToggleButton> {

  @override
  Widget build(context) {
    return StreamBuilder(
      stream: widget._torchStateStream,
      initialData: false,
      builder: (context, snapshot) {
        return IconButton.filled(
          iconSize: 96.0,
          padding: const EdgeInsets.all(48.0),
          style: ButtonStyle(
            elevation: MaterialStateProperty.all(3.33),
          ),
          icon: Icon(
            snapshot.data! ? Icons.flashlight_on : Icons.flashlight_off
          ),
          onPressed: () {
            widget._onPressed();
          },
        );
      }
    );
  }
}
