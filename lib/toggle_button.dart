import 'package:flutter/material.dart';

import 'package:flashie/controller.dart';

class ToggleButton extends StatelessWidget {
  const ToggleButton({super.key});

  @override
  Widget build(context) {
    return StreamBuilder(
        stream: Controller.stream,
        initialData: Controller.state,
        builder: (context, snapshot) {
          return IconButton.filled(
            icon: Icon(snapshot.data!.isTorchEnabled
                ? Icons.flashlight_on
                : Icons.flashlight_off),
            onPressed: snapshot.data!.isSOSButtonEnabled
                ? null
                : Controller.onToggleButtonPressed,
          );
        });
  }
}
