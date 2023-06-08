import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
            Spacer(
              flex: 2,
            ),
            Flexible(
              flex: 5,
              child: SOSButton(),
            ),
            Spacer(),
            Flexible(
              flex: 5,
              child: ToggleButton(),
            ),
            Spacer(),
            Flexible(
              flex: 5,
              child: IntervalButton(),
            ),
            Spacer(),
            Flexible(
              flex: 5,
              child: IntervalSlider(),
            ),
          ]
        : children = const [
            Flexible(
              child: Icon(
                Icons.flash_off,
                size: 200.0,
                color: Colors.red,
              ),
            ),
            Flexible(
              child: Text("NO FLASH DETECTED",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.red,
                  )),
            ),
          ];

    return children;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Controller.torchAvailble,
      initialData: null,
      builder: (context, snapshot) {
        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: snapshot.hasData
                ? _buildChildren(snapshot.data!)
                : const [CircularProgressIndicator()],
          ),
        );
      },
    );
  }
}
