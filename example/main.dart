import 'package:flutter/material.dart';
import 'package:wave_loading_bubble/wave_loading_bubble.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Wave Loading Bubble Example',
      home: WaveLoadingBubbleExample(),
    );
  }
}

class WaveLoadingBubbleExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Wave Loading Bubble Example'),
      ),
      body: Center(
        child: AutomatedAnimator(
          animateToggle: true,
          doRepeatAnimation: true,
          buildWidget: (animationValue) {
            return WaveLoadingBubble(
              bubbleDiameter: 200.0,
              waveHeight: 10.0,
              foregroundWaveColor: Colors.lightBlue,
              backgroundWaveColor: Colors.blue,
              period: animationValue,
            );
          },
        ),
      ),
    );
  }
}
