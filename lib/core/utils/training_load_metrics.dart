// في training_load_metrics.dart أو ملف utils صغير
import 'package:flutter/material.dart';
import 'package:himah/core/theme/app_colors.dart';

Color loadColorFor(double value) {
  if (value < 0.30) return AppColors.successLight; // سهل / منخفض
  if (value < 0.50) return AppColors.success; // مريح
  if (value < 0.70) return AppColors.successDark; // متوسط
  if (value < 0.85) return AppColors.warning; // مرتفع
  if (value < 0.95) return AppColors.dangerSoft; // إجهاد
  return AppColors.danger; // إجهاد مؤكد
}
