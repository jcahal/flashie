import 'package:flutter/material.dart';

import 'package:flashie/controller.dart';

class SOSButton extends StatelessWidget {
  const SOSButton({super.key});

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
            elevation: MaterialStateProperty.all(3.33),
            backgroundColor: MaterialStateProperty.all(Colors.red),
          ),
          icon: Icon(
            snapshot.data!.isSOSButtonEnabled ? Icons.stop : Icons.sos,
          ),
          onPressed: Controller.onSOSButtonPressed,
        );
      },
    );
  }
}
