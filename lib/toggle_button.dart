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
                ? Icons.flash_on
                : Icons.flash_off),
            onPressed: snapshot.data!.isSOSButtonEnabled || snapshot.data!.isIntervalButtonEnabled
                ? null
                : Controller.onToggleButtonPressed,
          );
        });
  }
}
