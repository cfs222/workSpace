import 'package:flutter/material.dart';
import 'package:himah/core/constants/app_assets.dart';
import 'package:himah/core/theme/theme.dart';

class HimOnboardingNextButton extends StatelessWidget {
  const HimOnboardingNextButton({
    super.key,
    required this.onPressed,
    this.isEnabled = true,
  });

  final VoidCallback onPressed;
  final bool isEnabled;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 30,
        vertical: AppSpacing.sm,
      ),
      child: InkWell(
        onTap: isEnabled ? onPressed : null,
        borderRadius: BorderRadius.circular(AppRadius.lg),
        child: Opacity(
          opacity: isEnabled ? 1.0 : 0.4,
          child: Container(
            height: AppSizes.buttonHeight,
            width: double.infinity,
            decoration: ShapeDecoration(
              color: AppColors.buttonPrimary,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(AppRadius.lg),
              ),
            ),
            child: Center(
              child: Image.asset(
                AppAssets.iconCheck,
                height: AppSizes.iconButtonSize,
                width: AppSizes.iconButtonSize,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
