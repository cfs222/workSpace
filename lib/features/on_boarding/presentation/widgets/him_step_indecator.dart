import 'package:flutter/material.dart';
import 'package:himah/core/theme/theme.dart';

class HimStepIndicator extends StatelessWidget {
  final int totalSteps;
  final int currentStep;

  const HimStepIndicator({
    super.key,
    this.totalSteps = 6,
    required this.currentStep,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(totalSteps, (index) {
        final isFilled = index < currentStep;

        return Expanded(
          child: Container(
            height: 4,
            margin: EdgeInsetsDirectional.only(
              end: index == totalSteps - 1 ? 0 : 5,
            ),
            decoration: BoxDecoration(
              color: isFilled
                  ? AppColors.white
                  : AppColors.white.withValues(alpha: 0.25),
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        );
      }),
    );
  }
}
