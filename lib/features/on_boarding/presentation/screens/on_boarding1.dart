import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:himah/core/theme/theme.dart';
import 'package:himah/core/constants/app_assets.dart';
import 'package:himah/features/on_boarding/domain/enums/goals.dart';
import 'package:himah/features/on_boarding/presentation/config/goal_config.dart';

import '../providers/onboarding_user_choice_provider.dart';
import '../providers/appbar_step_provider.dart';
import 'on_boarding2.dart';
import '../widgets/appbar.dart';
import '../widgets/choice_chip.dart';
import '../widgets/next_button.dart';
import '../widgets/progress_bar.dart';

class OnBoarding1 extends ConsumerWidget {
  const OnBoarding1({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedChoice = ref.watch(goalChoiceProvider);
    final goal = goalConfigs[selectedChoice]!;

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: const HimOnboardingAppbar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.pageHorizontal,
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // ─── Hero Image ───────────────────────────────────────────
              Center(
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Image.asset(
                      AppAssets.circleEffect,
                      width: AppSizes.onboardingHeroSize,
                      height: AppSizes.onboardingHeroSize,
                    ),
                    Image.asset(
                      goal.imagePath,
                      width: AppSizes.onboardingHeroImageWidth,
                      height: AppSizes.onboardingHeroImageHeight,
                    ),
                    Positioned(
                      left: 0,
                      right: 0,
                      bottom: 0,
                      height: 180,
                      child: IgnorePointer(
                        child: Container(
                          decoration: const BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                                Color(0x00000000),
                                Color(0x40000000),
                                Color(0xB3000000),
                                Color(0xFF000000),
                              ],
                              stops: [0.0, 0.35, 0.7, 1.0],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              // ─── Titles ───────────────────────────────────────────────
              Text(
                'ما الذي تريد بناءه؟',
                textAlign: TextAlign.center,
                style: AppTextStyles.titleLarge,
              ),
              Text(
                'اختر هدفك الأساسي، ويمكنك تغييره لاحقًا',
                textAlign: TextAlign.center,
                style: AppTextStyles.body,
              ),

              const SizedBox(height: AppSpacing.lg),

              // ─── Focus Distribution ───────────────────────────────────
              Align(
                alignment: AlignmentGeometry.centerRight,
                child: Text(
                  'توزيع تركيز خطتك',
                  style: AppTextStyles.caption.copyWith(
                    color: AppColors.textTertiary,
                  ),
                ),
              ),

              const SizedBox(height: AppSpacing.md),

              HimBar(
                title: 'القوة العضلية',
                subTitle: 'متوسطة',
                progress: goal.strength,
              ),

              const SizedBox(height: AppSpacing.md),
              HimBar(
                title: 'الحجم العضلي',
                subTitle: 'متوسطة',
                progress: goal.muscleSize,
              ),

              const SizedBox(height: AppSpacing.xl),

              // ─── Choice Chips ──────────────────────────────────────────
              Row(
                spacing: AppSpacing.chipGap,
                children: [
                  HimChoiseChip(
                    title: 'الحجم العضلي',
                    subTitle: 'تضخيم وشكل',
                    titleSize: 13,
                    subTitleSize: 10,
                    isSelected: selectedChoice == Goals.muscleSize,
                    icon: Image.asset(
                      AppAssets.iconExtended,
                      height: 16,
                      width: 16,
                    ),
                    onTap: () => ref.read(goalChoiceProvider.notifier).state =
                        Goals.muscleSize,
                  ),
                  HimChoiseChip(
                    title: 'خسارة الدهون',
                    subTitle: 'تنشيف وتحديد',
                    titleSize: 13,
                    subTitleSize: 10,
                    isSelected: selectedChoice == Goals.fatloss,
                    icon: Image.asset(
                      AppAssets.iconFire,
                      height: 16,
                      width: 16,
                    ),
                    onTap: () => ref.read(goalChoiceProvider.notifier).state =
                        Goals.fatloss,
                  ),
                ],
              ),

              const SizedBox(height: AppSpacing.sm),
              Row(spacing: AppSpacing.chipGap, children: [
                
                ],
              ),
              const SizedBox(height: AppSpacing.sm),
              Row(
                children: [
                  HimChoiseChip(
                    title: 'القوة العضلية',
                    subTitle: 'أداء أقوى',
                    titleSize: 13,
                    subTitleSize: 10,
                    isSelected: selectedChoice == Goals.power,
                    icon: Image.asset(
                      AppAssets.iconDumbbell,
                      height: 16,
                      width: 16,
                    ),
                    onTap: () => ref.read(goalChoiceProvider.notifier).state =
                        Goals.power,
                  ),

                  HimChoiseChip(
                    title: 'شامل',
                    subTitle: 'جسم رياضي متوازن',
                    titleSize: 13,
                    subTitleSize: 10,
                    isSelected: selectedChoice == Goals.all,
                    icon: Image.asset(
                      AppAssets.iconLayers,
                      height: 16,
                      width: 16,
                    ),
                    onTap: () =>
                        ref.read(goalChoiceProvider.notifier).state = Goals.all,
                  ),
                ],
              ),

              const SizedBox(height: AppSpacing.lg),
            ],
          ),
        ),
      ),

      // ─── Bottom Button (مكرر مع Welcome → يجب استخراجه لاحقاً) ─────
      bottomNavigationBar: HimOnboardingNextButton(
        onPressed: () {
          ref.read(appBarOnBoardingStepProvider.notifier).state += 1;
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => const OnBoarding2()),
          );
        },
      ),
    );
  }
}

class HimBar extends StatelessWidget {
  const HimBar({
    super.key,
    required this.title,
    required this.subTitle,
    required this.progress,
  });

  final String title;
  final String subTitle;
  final double progress;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              subTitle,
              style: AppTextStyles.caption.copyWith(
                color: AppColors.textTertiary,
              ),
            ),
            Text(
              title,
              style: AppTextStyles.bodySmall.copyWith(
                color: AppColors.textPrimary,
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        HimProgressBar(
          height: AppSizes.progressBarHeight,
          fillColor: AppColors.primary,
          progress: progress,
        ),
      ],
    );
  }
}
