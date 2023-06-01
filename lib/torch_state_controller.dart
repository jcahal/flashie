import 'dart:async';

import 'package:torch_light/torch_light.dart';

class TorchStateController {
  TorchStateController();

  final _controller = StreamController<bool>();
  bool _state = false;
  Stream<bool> get stream => _controller.stream;

  void toggleTorch() {
    _state ? disableTorch() : enableTorch();
  }
  
  void enableTorch() async {
    await TorchLight.enableTorch();
    _state = true;
    _controller.sink.add(_state);
  }

  void disableTorch() async {
    await TorchLight.disableTorch();
    _state = false;
    _controller.sink.add(_state);
  }
}