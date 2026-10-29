import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:himah/core/theme/theme.dart';
import 'package:himah/core/constants/app_assets.dart';
import 'package:himah/features/on_boarding/presentation/widgets/him_step_indecator.dart';

import '../providers/appbar_step_provider.dart';

// import 'him_step_indicator.dart';

class HimOnboardingAppbar extends ConsumerWidget
    implements PreferredSizeWidget {
  const HimOnboardingAppbar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentStep = ref.watch(appBarOnBoardingStepProvider);

    return AppBar(
      backgroundColor: AppColors.background,
      elevation: 0,
      title: HimStepIndicator(currentStep: currentStep),
      leading: InkWell(
        splashColor: Colors.transparent,
        hoverColor: Colors.transparent,
        focusColor: Colors.transparent,
        onTap: () {
          ref.read(appBarOnBoardingStepProvider.notifier).state -= 1;
          Navigator.pop(context);
        },
        child: Center(
          child: SizedBox(
            width: AppSizes.iconButtonSize,
            height: AppSizes.iconButtonSize,
            child: Image.asset(AppAssets.iconBack, fit: BoxFit.contain),
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
