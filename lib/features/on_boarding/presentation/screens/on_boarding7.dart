import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:himah/core/theme/theme.dart';
import 'package:himah/features/on_boarding/domain/entities/traning_entity.dart';
import 'package:himah/features/on_boarding/domain/entities/user_entitiy.dart';
import 'package:himah/features/on_boarding/domain/enums/tranings.dart';
import 'package:himah/features/on_boarding/domain/enums/weak_days.dart';
import 'package:himah/features/on_boarding/presentation/config/training_ui_config.dart';
import 'package:himah/features/on_boarding/presentation/providers/get_user_data_provider.dart';
import 'package:himah/features/on_boarding/presentation/providers/onboarding_dependencies.dart';
import 'package:himah/features/on_boarding/presentation/providers/onboarding_traning_index_provider.dart';
import 'package:himah/features/on_boarding/presentation/providers/onboarding_user_choice_provider.dart';

import '../providers/appbar_step_provider.dart';
import '../widgets/appbar.dart';
import '../widgets/next_button.dart';

class OnBoarding7 extends ConsumerWidget {
  const OnBoarding7({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final trainingDays = [
      const TraningEntity(type: Tranings.upper, day: WeakDays.sunday),
      const TraningEntity(type: Tranings.rest, day: WeakDays.monday),
      const TraningEntity(type: Tranings.lower, day: WeakDays.tuesday),
      const TraningEntity(type: Tranings.rest, day: WeakDays.wednesday),
      const TraningEntity(type: Tranings.upper, day: WeakDays.thursday),
      const TraningEntity(type: Tranings.rest, day: WeakDays.friday),
      const TraningEntity(type: Tranings.lower, day: WeakDays.saturday),
    ];

    final selectedIndex = ref.watch(onBoardingTrainingIndex);
    final selectedDay = trainingDays[selectedIndex];
    final selectedUi = trainingUiConfigs[selectedDay.type]!;

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: const HimOnboardingAppbar(),
      body: Padding(
        padding: const EdgeInsets.only(
          left: AppSpacing.pageHorizontal,
          right: AppSpacing.pageHorizontal,
          top: AppSpacing.pageHorizontal,
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              // ─── Titles ─────────────────────────────────────────────
              Text(
                'الجدول المقترح',
                textAlign: TextAlign.center,
                style: AppTextStyles.titleLarge,
              ),
              Text(
                'الجدول الأنسب لك',
                textAlign: TextAlign.center,
                style: AppTextStyles.body,
              ),

              const SizedBox(height: AppSpacing.xxl),

              // ─── Split System ───────────────────────────────────────
              Text(
                'نظام التقسيم',
                style: AppTextStyles.label.copyWith(
                  color: AppColors.textTertiary,
                  letterSpacing: 0.96,
                ),
              ),
              const SizedBox(height: AppSpacing.sm),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _Dot(color: AppColors.accentBlue),
                  const SizedBox(width: 10),
                  Text(
                    'Upper',
                    style: AppTextStyles.titleLarge.copyWith(fontSize: 36),
                  ),
                  const SizedBox(width: 14),
                  Text(
                    '/',
                    style: AppTextStyles.titleLarge.copyWith(
                      fontSize: 36,
                      color: AppColors.textHint,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  const SizedBox(width: 14),
                  _Dot(color: AppColors.accentPurple),
                  const SizedBox(width: 10),
                  Text(
                    'Lower',
                    style: AppTextStyles.titleLarge.copyWith(fontSize: 36),
                  ),
                ],
              ),

              const SizedBox(height: AppSpacing.sm),

              // ─── Summary Chips ──────────────────────────────────────
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                spacing: AppSpacing.sm,
                children: const [
                  _SummaryChip(label: '3 أيام راحة'),
                  _SummaryChip(label: '4 أيام تمرين'),
                ],
              ),

              const SizedBox(height: AppSpacing.xxl),

              // ─── Week Days ──────────────────────────────────────────
              Align(
                alignment: Alignment.centerRight,
                child: Text(
                  'أسبوعك',
                  style: AppTextStyles.body.copyWith(color: AppColors.white),
                ),
              ),
              const SizedBox(height: AppSpacing.lg),

              SizedBox(
                height: AppSizes.dayCardHeight,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: trainingDays.length,
                  separatorBuilder: (_, __) =>
                      const SizedBox(width: AppSpacing.sm),
                  itemBuilder: (context, index) {
                    final day = trainingDays[index];
                    final ui = trainingUiConfigs[day.type]!;

                    return HimDayCard(
                      dayNumber: index + 1,
                      title: ui.label,
                      icon: buildTrainingIcon(
                        ui.iconPath,
                        isSvg: ui.isSvg,
                        color: Colors.white,
                      ),
                      restDay: day.isRest,
                      selected: selectedIndex == index,
                      onPressed: () {
                        ref.read(onBoardingTrainingIndex.notifier).state =
                            index;
                      },
                    );
                  },
                ),
              ),

              const SizedBox(height: AppSpacing.xxl),
              const Divider(),
              const SizedBox(height: 28),

              // ─── Selected Day Details ───────────────────────────────
              Align(
                alignment: Alignment.centerRight,
                child: Text(
                  'اليوم $selectedIndex',
                  style: AppTextStyles.label.copyWith(
                    color: AppColors.textDisabled,
                    fontFamily: AppTextStyles.secondaryFont,
                  ),
                ),
              ),
              const SizedBox(height: 10),

              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                spacing: AppSpacing.sm,
                children: [
                  Text(
                    selectedUi.label,
                    style: AppTextStyles.bodySmall.copyWith(
                      color: AppColors.textDisabled,
                      fontFamily: AppTextStyles.secondaryFont,
                    ),
                  ),
                  Text(
                    'الجزء العلوي',
                    style: AppTextStyles.titleMedium.copyWith(
                      fontFamily: AppTextStyles.secondaryFont,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: AppSpacing.sm),
              Align(
                alignment: Alignment.centerRight,
                child: Text(
                  'الصدر · الظهر · الأكتاف · الذراعان',
                  style: AppTextStyles.body.copyWith(
                    color: AppColors.textSecondary,
                    fontFamily: AppTextStyles.secondaryFont,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),

      // ─── Bottom Buttons ─────────────────────────────────────────────
      bottomNavigationBar: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: SizedBox(
                width: double.infinity,
                height: AppSizes.buttonHeight,
                child: OutlinedButton(
                  onPressed: () {
                    // TODO: تبديل الجدول
                  },
                  child: Text(
                    'تبديل الجدول',
                    style: AppTextStyles.body.copyWith(
                      color: AppColors.textSecondary,
                    ),
                  ),
                ),
              ),
            ),

            HimOnboardingNextButton(
              onPressed: () async {
                final goal = ref.read(goalChoiceProvider);
                final experience = ref.read(experienceChoiceProvider);
                final dayCount = ref.read(trainingDayCountProvider);
                final days = ref.read(trainingDaysProvider);

                // حماية بسيطة
                if (experience == null || dayCount == null || days.isEmpty) {
                  return;
                }

                final user = UserEntity(
                  goal: goal,
                  experience: experience,
                  trainingDayCount: dayCount,
                  trainingDays: days,
                  trainingSchedule: null, // ← أنت ستبنيه لاحقاً
                );

                final createUser = ref.read(createUserUseCaseProvider);
                final result = await createUser(user);

                result.fold(
                  (failure) {
                    // يمكنك عرض SnackBar لاحقاً
                    debugPrint('Error: ${failure.errMessage}');
                  },
                  (_) {
                    ref.read(appBarOnBoardingStepProvider.notifier).state += 1;
                    // TODO: الانتقال للشاشة الرئيسية
                    debugPrint('User saved successfully');
                  },
                );

                final getCurrentUser = ref.read(getCurrentUserUseCaseProvider);
                final data = await getCurrentUser();

                data.fold(
                  (failure) {
                    debugPrint('Error: ${failure.errMessage}');
                  },
                  (user) {
                    if (user == null) {
                      debugPrint('No user found');
                    } else {
                      debugPrint('Goal: ${user.goal}');
                      debugPrint('Experience: ${user.experience}');
                      debugPrint('Day count: ${user.trainingDayCount}');
                      debugPrint('Days: ${user.trainingDays}');
                    }
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────
// Helpers الخاصة بهذه الشاشة فقط
// ─────────────────────────────────────────────────────────────────────────

class _Dot extends StatelessWidget {
  const _Dot({required this.color});
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 9,
      height: 9,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(4.5),
      ),
    );
  }
}

class _SummaryChip extends StatelessWidget {
  const _SummaryChip({required this.label});
  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 28,
      padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 14),
      decoration: ShapeDecoration(
        color: AppColors.surface,
        shape: RoundedRectangleBorder(
          side: const BorderSide(color: AppColors.borderSubtle),
          borderRadius: BorderRadius.circular(14),
        ),
      ),
      child: Center(
        child: Text(
          label,
          style: AppTextStyles.label.copyWith(
            color: AppColors.textPrimary,
            fontSize: 12.5,
          ),
        ),
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────
// يُفضل نقل هذا إلى presentation/widgets/day_card.dart
// ─────────────────────────────────────────────────────────────────────────
class HimDayCard extends StatelessWidget {
  const HimDayCard({
    super.key,
    required this.dayNumber,
    required this.icon,
    required this.title,
    required this.restDay,
    required this.selected,
    required this.onPressed,
  });

  final int dayNumber;
  final String title;
  final Widget icon;
  final bool selected;
  final bool restDay;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    final Color contentColor = restDay
        ? AppColors.textDisabled
        : selected
        ? AppColors.white
        : AppColors.textSecondary;

    return Container(
      height: AppSizes.dayCardHeight,
      width: AppSizes.dayCardWidth,
      decoration: BoxDecoration(
        color: restDay
            ? Colors.transparent
            : selected
            ? AppColors.primaryLight.withValues(alpha: 0.12)
            : AppColors.surface,
        borderRadius: BorderRadius.circular(AppRadius.lg),
        border: Border.all(
          color: restDay
              ? AppColors.borderSubtle
              : selected
              ? AppColors.primaryLight
              : AppColors.border,
        ),
      ),
      padding: const EdgeInsets.only(top: 12, bottom: 8, left: 12, right: 12),
      child: Column(
        children: [
          Text(
            '$dayNumber',
            style: AppTextStyles.label.copyWith(
              color: contentColor,
              fontFamily: AppTextStyles.secondaryFont,
            ),
          ),
          const SizedBox(height: AppSpacing.md),
          icon,
          const SizedBox(height: AppSpacing.md),
          Text(
            title,
            softWrap: false,
            style: AppTextStyles.caption.copyWith(
              color: contentColor,
              fontFamily: AppTextStyles.secondaryFont,
            ),
          ),
        ],
      ),
    );
  }
}

Widget buildTrainingIcon(
  String path, {
  required bool isSvg,
  required Color color,
  double size = 20,
}) {
  if (isSvg) {
    return SvgPicture.asset(
      path,
      width: size,
      height: size,
      colorFilter: ColorFilter.mode(color, BlendMode.srcIn),
    );
  }
  return Image.asset(path, width: size, height: size, color: color);
}
