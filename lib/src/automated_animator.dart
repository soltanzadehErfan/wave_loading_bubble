import 'package:flutter/material.dart';

class AutomatedAnimator extends StatefulWidget {
  const AutomatedAnimator({
    required this.buildWidget,
    required this.animateToggle,
    this.duration = const Duration(milliseconds: 300),
    this.doRepeatAnimation = false,
    Key? key,
  }) : super(key: key);

  final Widget Function(double animationValue) buildWidget;
  final Duration duration;
  final bool animateToggle;
  final bool doRepeatAnimation;

  @override
  _AutomatedAnimatorState createState() => _AutomatedAnimatorState();
}

class _AutomatedAnimatorState extends State<AutomatedAnimator> with SingleTickerProviderStateMixin {
  late AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(vsync: this, duration: widget.duration)..addListener(() => setState(() {}));
    if (widget.animateToggle) controller.forward();
    if (widget.doRepeatAnimation) controller.repeat();
  }

  @override
  void didUpdateWidget(AutomatedAnimator oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.animateToggle) {
      controller.forward();
    } else {
      controller.reverse();
    }
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return widget.buildWidget(controller.value);
  }
}

double reversingSplitParameters({
  required double position,
  required double numberBreaks,
  required double parameterBase,
  required double parameterVariation,
  required double reversalPoint,
}) {
  assert(reversalPoint <= 1.0 && reversalPoint >= 0.0, "reversalPoint must be a number between 0.0 and 1.0");
  final double finalAnimationPosition = breakAnimationPosition(position, numberBreaks);

  if (finalAnimationPosition <= 0.5) {
    return parameterBase - (finalAnimationPosition * 2 * parameterVariation);
  } else {
    return parameterBase - ((1 - finalAnimationPosition) * 2 * parameterVariation);
  }
}

double breakAnimationPosition(double position, double numberBreaks) {
  double finalAnimationPosition = 0;
  final double breakPoint = 1.0 / numberBreaks;

  for (var i = 0; i < numberBreaks; i++) {
    if (position <= breakPoint * (i + 1)) {
      finalAnimationPosition = (position - i * breakPoint) * numberBreaks;
      break;
    }
  }

  return finalAnimationPosition;
}
