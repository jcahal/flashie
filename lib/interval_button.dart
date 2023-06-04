import 'package:flutter/material.dart';

import 'package:flashie/controller.dart';

class IntervalButton extends StatelessWidget {
  const IntervalButton({super.key});

  @override
  Widget build(context) {
    return StreamBuilder(
      stream: Controller.stream,
      initialData: Controller.state,
      builder: (context, snapshot) {
        return IconButton.filled(
          icon: Icon(snapshot.data!.isIntervalButtonEnabled
                ? Icons.timer
                : Icons.timer_off),
          onPressed: snapshot.data!.isSOSButtonEnabled
                ? null
                : Controller.onIntervalButtonPressed,
        );
      }
    );
  }
}