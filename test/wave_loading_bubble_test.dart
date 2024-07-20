// test/wave_loading_bubble_test.dart

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:wave_loading_bubble/wave_loading_bubble.dart';

void main() {
  testWidgets('WaveLoadingBubble renders correctly', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: WaveLoadingBubble(
            bubbleDiameter: 200.0,
            loadingCircleWidth: 10.0,
            waveInsetWidth: 5.0,
            waveHeight: 10.0,
            foregroundWaveColor: Colors.lightBlue,
            backgroundWaveColor: Colors.blue,
            loadingWheelColor: Colors.white,
            foregroundWaveVerticalOffset: 10.0,
            backgroundWaveVerticalOffset: 0.0,
            period: 0.0,
          ),
        ),
      ),
    );

    expect(find.byType(WaveLoadingBubble), findsOneWidget);
  });

  testWidgets('AutomatedAnimator animates correctly', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: AutomatedAnimator(
            animateToggle: true,
            doRepeatAnimation: true,
            duration: const Duration(seconds: 1),
            buildWidget: (double animationPosition) {
              return Container(
                width: animationPosition * 100,
                height: animationPosition * 100,
                color: Colors.blue,
              );
            },
          ),
        ),
      ),
    );

    // Initial state
    expect(find.byType(Container), findsOneWidget);

    // Move forward 500ms in time
    await tester.pump(const Duration(milliseconds: 500));
    // The animation should be halfway done
    final container = tester.widget<Container>(find.byType(Container));
    expect(container.constraints?.maxWidth, 50);
    expect(container.constraints?.maxHeight, 50);
  });
}
