import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:himah/core/theme/theme.dart';
import 'package:himah/features/on_boarding/domain/enums/weak_days.dart';
import 'package:himah/features/on_boarding/presentation/providers/onboarding_user_choice_provider.dart';

import '../providers/appbar_step_provider.dart';
import 'on_boarding5.dart';
import '../widgets/appbar.dart';
import '../widgets/choice_chip.dart';
import '../widgets/next_button.dart';

class OnBoarding4 extends ConsumerWidget {
  const OnBoarding4({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedDays = ref.watch(trainingDaysProvider);
    final maxDays = ref.watch(trainingDayCountProvider) ?? 0;
    final selectedCount = selectedDays.length;
    final current = List<WeakDays>.from(selectedDays);

    void toggleDay(WeakDays day) {
      if (current.contains(day)) {
        current.remove(day);
      } else {
        if (current.length >= maxDays) return; // وصل للحد الأقصى
        current.add(day);
      }

      ref.read(trainingDaysProvider.notifier).state = current;
    }

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
                  'حدد الأيام',
                  textAlign: TextAlign.center,
                  style: AppTextStyles.titleLarge,
                ),
                Text(
                  'حدد الأيام التي سوف تلتزم فيها بالتدريب',
                  textAlign: TextAlign.center,
                  style: AppTextStyles.body,
                ),

                const SizedBox(height: AppSpacing.xxl),

                // ─── Days Chips ───────────────────────────────────────
                Row(
                  spacing: AppSpacing.chipGap,
                  children: [
                    HimChoiseChip(
                      title: 'الثلاثاء',
                      isSelected: selectedDays.contains(WeakDays.tuesday),

                      onTap: () => toggleDay(WeakDays.tuesday),
                    ),
                    HimChoiseChip(
                      title: 'الاثنين',
                      isSelected: selectedDays.contains(WeakDays.monday),
                      onTap: () => toggleDay(WeakDays.monday),
                    ),
                    HimChoiseChip(
                      title: 'الأحد',
                      isSelected: selectedDays.contains(WeakDays.sunday),
                      onTap: () => toggleDay(WeakDays.sunday),
                    ),
                  ],
                ),
                const SizedBox(height: AppSpacing.lg),
                Row(
                  spacing: AppSpacing.chipGap,
                  children: [
                    HimChoiseChip(
                      title: 'الجمعة',
                      isSelected: selectedDays.contains(WeakDays.friday),
                      onTap: () => toggleDay(WeakDays.friday),
                    ),
                    HimChoiseChip(
                      title: 'الخميس',
                      isSelected: selectedDays.contains(WeakDays.thursday),
                      onTap: () => toggleDay(WeakDays.thursday),
                    ),
                    HimChoiseChip(
                      title: 'الأربعاء',
                      isSelected: selectedDays.contains(WeakDays.wednesday),
                      onTap: () => toggleDay(WeakDays.wednesday),
                    ),
                  ],
                ),
                const SizedBox(height: AppSpacing.lg),
                Row(
                  children: [
                    HimChoiseChip(
                      title: 'السبت',
                      isSelected: selectedDays.contains(WeakDays.saturday),
                      onTap: () => toggleDay(WeakDays.saturday),
                    ),
                  ],
                ),

                const SizedBox(height: AppSpacing.sm),

                Text(
                  '$selectedCount/${ref.watch(trainingDayCountProvider)}',
                  textAlign: TextAlign.center,
                  style: AppTextStyles.body.copyWith(
                    color: current.length >= maxDays
                        ? AppColors.textPrimary
                        : AppColors.textHint, // تقريباً alpha 0.40
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
        isEnabled: selectedDays.length == maxDays && maxDays > 0,
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
