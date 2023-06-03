import 'dart:async';

import 'package:torch_light/torch_light.dart';
import 'package:flashie/model.dart';

class Controller {
  Controller();

  static final Model _state = Model();
  static final Future<bool> torchAvailble = TorchLight.isTorchAvailable();
  static final StreamController<Model> _streamController = StreamController<Model>.broadcast();
  
  static Stream<Model> get stream => _streamController.stream;
  static Model get state => _state;

  Timer _timer;

  static void toggleTorch() {
    _state.isTorchEnabled ? disableTorch() : enableTorch();
  }
  
  static void enableTorch() async {
    // await TorchLight.enableTorch();
    _state.setTorchEnabled = true;
    _streamController.sink.add(_state);
  }

  static void disableTorch() async {
    // await TorchLight.disableTorch();
    _state.setTorchEnabled = false;
    _streamController.sink.add(_state);
  }

  static void onToggleButtonPressed() {
    toggleTorch();
  }

  static void onIntervalSliderChanged(double value) {
    _state.setIntervalSliderValue = value;
    // _torchIntervalTimer?.cancel();
    // _onTorchIntervalButtonPressed(_torchIntervalButtonEnabled);

    _streamController.sink.add(_state);
  }

  static void onIntervalButtonPressed() async {
    _state.isIntervalButtonEnabled 
    ? _state.setIntervalButtonEnabled = false 
    : _state.setIntervalButtonEnabled = true;

    // if (_torchIntervalButtonEnabled) {
    //   _torchIntervalTimer = Timer.periodic(
    //     Duration(milliseconds: (_torchIntervalSiderValue * 1000.00).round()),
    //     (timer) => _torchState.toggleTorch(),
    //   );
    // } else {
    //   _torchIntervalTimer?.cancel();
    // }

    _streamController.sink.add(_state);
  }

  static void onSOSButtonPressed() async {
    _state.isSOSButtonEnabled 
    ? _state.setSOSButtonEnabled = false 
    : _state.setSOSButtonEnabled = true;
     
    // SOS Logic
    Timer.periodic(Duration(milliseconds: 500), (timer) {
        
     });
     
    _streamController.sink.add(_state);
  }
}