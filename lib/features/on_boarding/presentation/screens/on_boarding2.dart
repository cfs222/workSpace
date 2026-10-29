import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:himah/core/theme/theme.dart';
import 'package:himah/features/on_boarding/domain/enums/experiences.dart';
import 'package:himah/features/on_boarding/presentation/config/experience_ui_config.dart';
import 'package:himah/features/on_boarding/presentation/providers/onboarding_user_choice_provider.dart';

import '../providers/appbar_step_provider.dart';
import 'on_boarding3.dart';
import '../widgets/appbar.dart';
import '../widgets/choice_chip.dart';
import '../widgets/next_button.dart';

class OnBoarding2 extends ConsumerWidget {
  const OnBoarding2({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedChoice = ref.watch(experienceChoiceProvider);
    final motivationText = selectedChoice != null
        ? experienceUiConfigs[selectedChoice]!.motivationText
        : null;

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
                  'كم هي خبرتك؟',
                  textAlign: TextAlign.center,
                  style: AppTextStyles.titleLarge,
                ),
                Text(
                  'هل لديك أي خبرة سابقة في التدريب',
                  textAlign: TextAlign.center,
                  style: AppTextStyles.body,
                ),

                const SizedBox(height: AppSpacing.massive),

                // ─── Experience Chips ─────────────────────────────────
                Row(
                  children: [
                    HimChoiseChip(
                      title: 'جديد',
                      subTitle: 'لم يسبق التدريب من قبل',
                      isSelected: selectedChoice == ExperienceLevel.newbie,
                      onTap: () =>
                          ref.read(experienceChoiceProvider.notifier).state =
                              ExperienceLevel.newbie,
                    ),
                  ],
                ),

                const SizedBox(height: AppSpacing.lg),

                Row(
                  spacing: AppSpacing.chipGap,
                  children: [
                    HimChoiseChip(
                      title: 'متمرس',
                      subTitle: 'من سنة إلى 3 سنوات تقريبًا',
                      isSelected:
                          selectedChoice == ExperienceLevel.intermediate,
                      onTap: () =>
                          ref.read(experienceChoiceProvider.notifier).state =
                              ExperienceLevel.intermediate,
                    ),
                    HimChoiseChip(
                      title: 'البداية',
                      subTitle: 'أقل من سنة تقريبًا',
                      isSelected: selectedChoice == ExperienceLevel.beginner,

                      onTap: () =>
                          ref.read(experienceChoiceProvider.notifier).state =
                              ExperienceLevel.beginner,
                    ),
                  ],
                ),

                const SizedBox(height: AppSpacing.lg),

                Row(
                  children: [
                    HimChoiseChip(
                      title: 'محترف',
                      subTitle: 'أكثر من 3 سنوات من التدريب المنتظم',
                      isSelected: selectedChoice == ExperienceLevel.advanced,
                      onTap: () =>
                          ref.read(experienceChoiceProvider.notifier).state =
                              ExperienceLevel.advanced,
                    ),
                  ],
                ),

                if (motivationText != null) ...[
                  const SizedBox(height: AppSpacing.md),
                  Text(
                    motivationText,
                    textAlign: TextAlign.center,
                    style: AppTextStyles.body.copyWith(
                      color: AppColors.textHint, // تقريباً alpha 0.40
                      fontWeight: FontWeight.w500,
                      height: 1.96,
                    ),
                  ),
                ],
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
            MaterialPageRoute(builder: (_) => const OnBoarding3()),
          );
        },
      ),
    );
  }
}
