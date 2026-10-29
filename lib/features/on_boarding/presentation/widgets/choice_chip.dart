import 'package:flutter/material.dart';
import 'package:himah/core/theme/theme.dart';

class HimChoiseChip extends StatelessWidget {
  const HimChoiseChip({
    super.key,
    required this.title,
    this.subTitle,
    this.isSelected = false,
    this.icon,
    required this.onTap,
    this.verticalPadding = 18,
    this.titleSize = 18, // القيمة الأكثر استخداماً أصبحت الافتراضية
    this.subTitleSize = 13, // نفس الشيء
  });

  final String title;
  final String? subTitle;
  final bool isSelected;
  final Image? icon;
  final VoidCallback onTap;
  final double verticalPadding;
  final double titleSize;
  final double subTitleSize;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        borderRadius: BorderRadius.circular(AppRadius.lg),
        onTap: onTap,
        child: Container(
          padding: EdgeInsets.symmetric(vertical: verticalPadding),
          decoration: ShapeDecoration(
            color: isSelected ? AppColors.primarySoft : AppColors.surface,
            shape: RoundedRectangleBorder(
              side: BorderSide(
                width: 1,
                color: isSelected ? AppColors.primary : AppColors.border,
              ),
              borderRadius: BorderRadius.circular(AppRadius.lg),
            ),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(
                    width: 70,
                    child: Text(
                      title,
                      softWrap: false,
                      textAlign: TextAlign.center,
                      style: AppTextStyles.chipTitle.copyWith(
                        fontSize: titleSize,
                      ),
                    ),
                  ),
                  if (subTitle != null)
                    Text(
                      subTitle!,
                      textAlign: TextAlign.center,
                      style: AppTextStyles.chipSubtitle.copyWith(
                        fontSize: subTitleSize,
                      ),
                    ),
                ],
              ),
              if (icon != null) ...[
                const SizedBox(width: AppSpacing.xs),
                Container(
                  width: 34,
                  height: 34,
                  decoration: BoxDecoration(
                    color: AppColors.surfaceElevated,
                    borderRadius: BorderRadius.circular(9),
                  ),
                  child: Center(child: icon),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
