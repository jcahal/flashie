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
            iconSize: 60.0,
            padding: const EdgeInsets.all(36.0),
            style: ButtonStyle(
              elevation: snapshot.data!.isSOSButtonEnabled
                ? MaterialStateProperty.all(0.0)
                : MaterialStateProperty.all(3.33),
            ),
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
