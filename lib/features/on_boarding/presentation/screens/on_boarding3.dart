import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:himah/core/theme/theme.dart';
import 'package:himah/core/utils/training_load_metrics.dart';
import 'package:himah/features/on_boarding/presentation/config/training_load_metrics.dart';
import 'package:himah/features/on_boarding/presentation/providers/onboarding_user_choice_provider.dart';

import '../providers/appbar_step_provider.dart';
import 'on_boarding4.dart';
import '../widgets/appbar.dart';
import '../widgets/choice_chip.dart';
import '../widgets/next_button.dart';
import '../widgets/progress_bar.dart';

class OnBoarding3 extends ConsumerWidget {
  const OnBoarding3({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedChoice = ref.watch(trainingDayCountProvider);

    // داخل build:
    final selectedDays = ref.watch(trainingDayCountProvider);
    final experience = ref.watch(experienceChoiceProvider);

    final metrics = (selectedDays != null && experience != null)
        ? getTrainingLoadMetrics(dayCount: selectedDays, experience: experience)
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
                  'كم يوم تدريب؟',
                  textAlign: TextAlign.center,
                  style: AppTextStyles.titleLarge,
                ),
                Text(
                  'كم يوم يمكنك الالتزام بهم حقاً في الأسبوع',
                  textAlign: TextAlign.center,
                  style: AppTextStyles.body,
                ),

                const SizedBox(height: AppSpacing.xxl),

                // ─── Difficulty ───

                // بار واحد فقط — الصعوبة
                _MetricHeader(
                  label: ':الصعوبة',
                  value: metrics?.difficultyLabel ?? '—',
                ),
                const SizedBox(height: AppSpacing.sm),
                HimProgressBar(
                  height: AppSizes.progressBarHeight,
                  fillColor: metrics != null
                      ? loadColorFor(metrics.difficulty)
                      : AppColors.surface,
                  progress: metrics?.difficulty ?? 0,
                ),

                const SizedBox(height: AppSpacing.xxl),

                // ─── Days Chips ───────────────────────────────────────
                Row(
                  spacing: AppSpacing.chipGap,
                  children: [
                    HimChoiseChip(
                      title: 'ثلاث',
                      isSelected: selectedChoice == 3,
                      onTap: () {
                        ref.read(trainingDayCountProvider.notifier).state = 3;
                      },
                    ),
                    HimChoiseChip(
                      title: 'يومان',
                      isSelected: selectedChoice == 2,
                      onTap: () {
                        ref.read(trainingDayCountProvider.notifier).state = 2;
                      },
                    ),
                    HimChoiseChip(
                      title: 'يوم',
                      isSelected: selectedChoice == 1,
                      onTap: () {
                        ref.read(trainingDayCountProvider.notifier).state = 1;
                      },
                    ),
                  ],
                ),
                const SizedBox(height: AppSpacing.lg),
                Row(
                  spacing: AppSpacing.chipGap,
                  children: [
                    HimChoiseChip(
                      title: 'ستة',
                      isSelected: selectedChoice == 6,
                      onTap: () {
                        ref.read(trainingDayCountProvider.notifier).state = 6;
                      },
                    ),
                    HimChoiseChip(
                      title: 'خمسة',
                      isSelected: selectedChoice == 5,
                      onTap: () {
                        ref.read(trainingDayCountProvider.notifier).state = 5;
                      },
                    ),
                    HimChoiseChip(
                      title: 'أربع',
                      isSelected: selectedChoice == 4,
                      onTap: () {
                        ref.read(trainingDayCountProvider.notifier).state = 4;
                      },
                    ),
                  ],
                ),
                const SizedBox(height: AppSpacing.lg),
                Row(
                  children: [
                    HimChoiseChip(
                      title: 'سبعة',
                      isSelected: selectedChoice == 7,
                      onTap: () {
                        ref.read(trainingDayCountProvider.notifier).state = 7;
                      },
                    ),
                  ],
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
            MaterialPageRoute(builder: (_) => const OnBoarding4()),
          );
        },
      ),
    );
  }
}

/// Private helper to avoid repeating the Stack structure.
class _MetricHeader extends StatelessWidget {
  const _MetricHeader({required this.label, required this.value});

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Align(
          alignment: Alignment.centerRight,
          child: Text(
            label,
            textAlign: TextAlign.right,
            style: AppTextStyles.bodyLarge.copyWith(
              color: AppColors.textPrimary,
            ),
          ),
        ),
        Center(
          child: Text(
            value,
            textAlign: TextAlign.center,
            style: AppTextStyles.body.copyWith(color: AppColors.textTertiary),
          ),
        ),
      ],
    );
  }
}
