import 'package:flutter/material.dart';

import 'package:flashie/controller.dart';

class IntervalSlider extends StatelessWidget {
  const IntervalSlider({super.key});

  @override
  Widget build(context) {
    return StreamBuilder(
        stream: Controller.stream,
        initialData: Controller.state,
        builder: (context, snapshot) {
          return Column(
            children: [
              Slider(
                  value: snapshot.data!.currentIntervalSliderValue,
                  max: 1.0,
                  min: 0.25,
                  divisions: 3,
                  onChanged: snapshot.data!.isSOSButtonEnabled
                      ? null
                      : (double value) {
                          Controller.onIntervalSliderChanged(value);
                        }),
              Text(
                '${snapshot.data!.currentIntervalSliderValue}s',
                style: const TextStyle(
                  fontSize: 24.0,
                ),
              )
            ],
          );
        });
  }
}
