import 'package:flutter/material.dart';

class ShakePulse extends StatefulWidget {
  const ShakePulse({
    super.key,
    required this.child,
    required this.trigger,
    this.duration = const Duration(milliseconds: 350),
    this.shakeOffset = 5,
  });

  final Widget child;
  final bool trigger;
  final Duration duration;
  final double shakeOffset;

  @override
  State<ShakePulse> createState() => _ShakePulseState();
}

class _ShakePulseState extends State<ShakePulse>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _shake;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(vsync: this, duration: widget.duration);

    _shake = TweenSequence<double>([
      TweenSequenceItem(tween: Tween(begin: 0, end: -1), weight: 15),
      TweenSequenceItem(tween: Tween(begin: -1, end: 1), weight: 25),
      TweenSequenceItem(tween: Tween(begin: 1, end: -0.6), weight: 25),
      TweenSequenceItem(tween: Tween(begin: -0.6, end: 0.4), weight: 20),
      TweenSequenceItem(tween: Tween(begin: 0.4, end: 0), weight: 15),
    ]).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));
  }

  @override
  void didUpdateWidget(covariant ShakePulse oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (widget.trigger != oldWidget.trigger) {
      _controller.forward(from: 0);
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      child: widget.child,
      builder: (context, child) {
        return Transform.translate(
          offset: Offset(_shake.value * widget.shakeOffset, 0),
          child: child,
        );
      },
    );
  }
}
