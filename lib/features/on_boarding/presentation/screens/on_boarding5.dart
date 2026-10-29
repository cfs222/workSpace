import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:himah/core/constants/app_assets.dart';
import 'package:himah/core/theme/theme.dart';
import 'package:himah/features/on_boarding/domain/enums/training_space.dart';
import 'package:himah/features/on_boarding/presentation/providers/onboarding_user_choice_provider.dart';

import '../providers/appbar_step_provider.dart';
import '../widgets/appbar.dart';
import '../widgets/choice_chip.dart';
import '../widgets/next_button.dart';

class OnBoarding5 extends ConsumerWidget {
  const OnBoarding5({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedChoice = ref.watch(trainingSpaceProvider);

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: const HimOnboardingAppbar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.pageHorizontal,
        ),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // ─── Titles ───────────────────────────────────────────
                Text(
                  'ما هي ساحة تدريبك؟',
                  textAlign: TextAlign.center,
                  style: AppTextStyles.titleLarge,
                ),
                Text(
                  'أين ستتدرب غالبا؟',
                  textAlign: TextAlign.center,
                  style: AppTextStyles.body,
                ),

                const SizedBox(height: AppSpacing.xxl),

                // ─── Days Chips ───────────────────────────────────────
                Row(
                  spacing: AppSpacing.chipGap,
                  children: [
                    HimChoiseChip(
                      title: 'النادي',
                      icon: Image.asset(AppAssets.iconGym),
                      verticalPadding: 200,
                      isSelected: selectedChoice == TrainingSpace.gym,

                      onTap: () =>
                          ref.read(trainingSpaceProvider.notifier).state =
                              TrainingSpace.gym,
                    ),
                    HimChoiseChip(
                      icon: Image.asset(AppAssets.iconHome),
                      title: 'المنزل',
                      verticalPadding: 200,
                      isSelected: selectedChoice == TrainingSpace.home,

                      onTap: () =>
                          ref.read(trainingSpaceProvider.notifier).state =
                              TrainingSpace.home,
                    ),
                  ],
                ),

                const SizedBox(height: AppSpacing.sm),

                Text(
                  selectedChoice == TrainingSpace.gym
                      ? 'تمارين بأجهزة وأوزان حرة كاملة.'
                      : '',
                  textAlign: TextAlign.center,
                  style: AppTextStyles.body.copyWith(
                    color: AppColors.textHint,
                    fontWeight: FontWeight.w500,
                    height: 1.96,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: HimOnboardingNextButton(
        isEnabled: selectedChoice != null,
        onPressed: () {
          ref.read(appBarOnBoardingStepProvider.notifier).state += 1;
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => const OnBoarding5()),
          );
        },
      ),
    );
  }
}
