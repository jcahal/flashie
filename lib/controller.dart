import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:torch_light/torch_light.dart';
import 'package:flashie/model.dart';

enum TimerMode { sos, inf }

class Controller {
  Controller();

  static final torchAvailble = TorchLight.isTorchAvailable();
  static final _state = Model();
  static final _streamController = StreamController<Model>.broadcast();
  static Timer? _periodicTimer;

  static Stream<Model> get stream => _streamController.stream;
  static Model get state => _state;

  static void _enableTorch() async {
    if (kReleaseMode) {
      await TorchLight.enableTorch();
    }
    _state.setTorchEnabled = true;
    _streamController.sink.add(_state);
  }

  static void _disableTorch() async {
    if (kReleaseMode) {
      await TorchLight.disableTorch();
    }
    _state.setTorchEnabled = false;
    _streamController.sink.add(_state);
  }

  static void _toggleTorch() {
    _state.isTorchEnabled ? _disableTorch() : _enableTorch();
  }

  static void _toggleTorchPeriodically(int millis, TimerMode mode) {
    _periodicTimer = Timer.periodic(Duration(milliseconds: millis), (timer) {
      _toggleTorch();

      if (mode == TimerMode.sos) {
        if (timer.tick == 6) {
          timer.cancel();
          _toggleTorchPeriodically(millis == 500 ? 1000 : 500, TimerMode.sos);
        }
      }
    });
  }

  static void onToggleButtonPressed() {
    _toggleTorch();
  }

  static void onIntervalSliderChanged(double value) {
    _state.setIntervalSliderValue = value;
    if (_state.isIntervalButtonEnabled) {
      _periodicTimer?.cancel();
      _toggleTorchPeriodically(
          (_state.currentIntervalSliderValue * 1000).round(), TimerMode.inf);
    }

    _streamController.sink.add(_state);
  }

  static void onIntervalButtonPressed() async {
    if (_state.isIntervalButtonEnabled) {
      _periodicTimer?.cancel();
      _disableTorch();
      _state.setIntervalButtonEnabled = false;
    } else {
      _periodicTimer?.cancel();
      _disableTorch();
      _toggleTorchPeriodically(
          (_state.currentIntervalSliderValue * 1000).round(), TimerMode.inf);
      _state.setIntervalButtonEnabled = true;
    }

    _streamController.sink.add(_state);
  }

  static void onSOSButtonPressed() async {
    if (_state.isSOSButtonEnabled) {
      _periodicTimer?.cancel();
      _disableTorch();
      _state.setSOSButtonEnabled = false;
    } else {
      _periodicTimer?.cancel();
      _disableTorch();
      _state.setIntervalButtonEnabled = false;
      _toggleTorchPeriodically(500, TimerMode.sos);
      _state.setSOSButtonEnabled = true;
    }

    _streamController.sink.add(_state);
  }
}
