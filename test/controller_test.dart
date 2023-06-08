import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:flashie/controller.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  
  test('Controller default state', () {
    expect(Controller.state.isTorchEnabled, false);
    expect(Controller.state.isSOSButtonEnabled, false);
    expect(Controller.state.isIntervalButtonEnabled, false);
    expect(Controller.state.currentIntervalSliderValue, 1.0);
  });

  test('Controller function results', () {
    Controller.onToggleButtonPressed();
    expect(Controller.state.isTorchEnabled, true);

    Controller.onSOSButtonPressed();
    expect(Controller.state.isSOSButtonEnabled, true);
    expect(Controller.state.isTorchEnabled, false);
    expect(Controller.state.isIntervalButtonEnabled, false);

    Controller.onIntervalButtonPressed();
    expect(Controller.state.isIntervalButtonEnabled, true);
    expect(Controller.state.isTorchEnabled, false);

    Controller.onIntervalSliderChanged(0.5);
    expect(Controller.state.currentIntervalSliderValue, 0.5);
  });
}