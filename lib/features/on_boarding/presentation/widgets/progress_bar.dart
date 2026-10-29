import 'package:flutter/material.dart';
import 'package:himah/core/theme/theme.dart';

class HimProgressBar extends StatelessWidget {
  const HimProgressBar({
    super.key,
    this.progress = 0,
    this.height = 2,
    this.fillColor = AppColors.white,
    this.centerBar = false,
    this.duration = AppDurations.progress,
  });

  final double progress;
  final double height;
  final Color fillColor;
  final bool centerBar;
  final Duration duration;

  @override
  Widget build(BuildContext context) {
    final value = progress.clamp(0.0, 1.0);

    return ClipRRect(
      borderRadius: BorderRadius.circular(AppRadius.xl),
      child: Container(
        height: height,
        width: double.infinity,
        color: AppColors.white.withValues(alpha: 0.20),
        child: TweenAnimationBuilder<double>(
          tween: Tween<double>(end: value),
          duration: duration,
          curve: Curves.easeInOutCubic,
          builder: (context, animatedValue, child) {
            return Align(
              alignment: centerBar ? Alignment.center : Alignment.centerLeft,
              child: FractionallySizedBox(
                widthFactor: animatedValue,
                heightFactor: 1,
                child: child,
              ),
            );
          },
          child: ColoredBox(color: fillColor),
        ),
      ),
    );
  }
}
