import 'package:flutter/material.dart';

import 'package:flashie/controller.dart';
import 'package:flashie/toggle_button.dart';
import 'package:flashie/interval_slider.dart';
import 'package:flashie/interval_button.dart';
import 'package:flashie/sos_button.dart';

class Flashie extends StatelessWidget {
  const Flashie({super.key});

  List<Widget> _buildChildren(bool value) {
    List<Widget> children;

    value
        ? children = const [
            SOSButton(),
            SizedBox(
              height: 20.0,
            ),
            ToggleButton(),
            SizedBox(
              height: 20.0,
            ),
            IntervalButton(),
            SizedBox(
              height: 20.0,
            ),
            IntervalSlider(),
          ]
        : children = const [
            Text(
              "Hey, we can't find a torch. Sorry.",
            )
          ];

    return children;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Controller.torchAvailble,
      initialData: null,
      builder: (context, snapshot) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: snapshot.hasData
              ? _buildChildren(snapshot.data!)
              : const [CircularProgressIndicator()],
        );
      },
    );
  }
}
