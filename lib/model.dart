class Model {
  Model();

  bool _isTorchEnabled = false;
  bool _isSOSButtonEnabled = false;
  bool _isToggleButtonEnabled = false;
  bool _isIntervalButtonEnabled = false;
  double _currentIntervalSliderValue = 1.0;

  bool get isTorchEnabled => _isTorchEnabled;
  bool get isSOSButtonEnabled => _isSOSButtonEnabled;
  bool get isToggleButtonEnabled => _isToggleButtonEnabled;
  bool get isIntervalButtonEnabled => _isIntervalButtonEnabled;
  double get currentIntervalSliderValue => _currentIntervalSliderValue;

  set setTorchEnabled(bool value) {
    _isTorchEnabled = value;
  }

  set setSOSButtonEnabled(bool value) {
    _isSOSButtonEnabled = value;
  }

  set setToggleButtonEnabled(bool value) {
    _isToggleButtonEnabled = value;
  }

  set setIntervalButtonEnabled(bool value) {
    _isIntervalButtonEnabled = value;
  }

  set setIntervalSliderValue(double value) {
    _currentIntervalSliderValue = value;
  }
}
