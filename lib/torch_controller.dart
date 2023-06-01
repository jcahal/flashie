import 'package:flutter/material.dart';
import 'dart:async';

import 'package:torch_light/torch_light.dart';

import 'package:torch_interval/torch_state_controller.dart';
import 'package:torch_interval/torch_toggle_button.dart';
import 'package:torch_interval/torch_interval_slider.dart';
import 'package:torch_interval/torch_interval_button.dart';

class TorchController extends StatefulWidget {
  const TorchController({super.key});

  @override
  State<TorchController> createState() {
    return _TorchControllerState();
  }
}

class _TorchControllerState extends State<TorchController> {
  final _torchState = TorchStateController();
  
  Timer? _torchIntervalTimer;
  bool _torchIntervalButtonEnabled = false;
  double _torchIntervalSiderValue = 1.0;

  void _onTorchToggleButtonPressed() {
    _torchState.toggleTorch();
  }

  void _onTorchIntervalSliderChanged(double newTorchIntervalSliderValue) {
    _torchIntervalSiderValue = newTorchIntervalSliderValue;
    _torchIntervalTimer?.cancel();
    _onTorchIntervalButtonPressed(_torchIntervalButtonEnabled);
  }

  void _onTorchIntervalButtonPressed(bool torchIntervalButtonEnabled) async {
    _torchIntervalButtonEnabled = torchIntervalButtonEnabled;
    if (torchIntervalButtonEnabled) {
      if (_torchIntervalButtonEnabled) {
      _torchIntervalTimer = Timer.periodic(
        Duration(milliseconds: (_torchIntervalSiderValue * 1000.00).round()),
        (timer) => _torchState.toggleTorch(),
      );
    }
    } else {
      _torchIntervalTimer?.cancel();
    }
  }

  Future<List<Widget>> _torchUI() async {
    bool isTorchAvailable = await TorchLight.isTorchAvailable();

    if (isTorchAvailable) {
      return [
        TorchToggleButton(
          _onTorchToggleButtonPressed,
          _torchState.stream,
        ),
        const SizedBox(
          height: 20.0,
        ),
        TorchIntervalButton(
          _onTorchIntervalButtonPressed,
        ),
        const SizedBox(
          height: 20.0,
        ),
        TorchIntervalSlider(
          _onTorchIntervalSliderChanged,
        ),
      ];
    } else {
      return const [
        Text(
          "Hey, we can't find a torch. Sorry.",
        ),
      ];
    }
  }

  @override
  Widget build(context) {
    return Center(
      child: FutureBuilder(
          future: _torchUI(),
          initialData: const [CircularProgressIndicator()],
          builder: (context, snapshot) {
            return Column(
              mainAxisSize: MainAxisSize.min,
              children: snapshot.data!,
            );
          }),
    );
  }
}
