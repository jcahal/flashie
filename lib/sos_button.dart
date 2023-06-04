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
          style: ButtonStyle(
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
