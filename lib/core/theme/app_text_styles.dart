import 'package:flutter/material.dart';
import 'app_colors.dart';

/// Centralized text styles.
/// Prefer these over inline TextStyle(...) whenever possible.
class AppTextStyles {
  AppTextStyles._();

  static const String primaryFont = 'IBM Plex Sans Arabic';
  static const String secondaryFont = 'Inter';
  static const String displayFont = 'Rubik';
  static const String captionFont = 'Quattrocento';

  // ─── Titles ─────────────────────────────────────────────────────────────
  static const TextStyle titleLarge = TextStyle(
    fontFamily: primaryFont,
    fontSize: 26,
    fontWeight: FontWeight.w600,
    height: 1.5,
    color: AppColors.white,
  );

  static const TextStyle titleMedium = TextStyle(
    fontFamily: primaryFont,
    fontSize: 22,
    fontWeight: FontWeight.w600,
    height: 1.5,
    color: AppColors.white,
  );

  // ─── Body ───────────────────────────────────────────────────────────────
  static const TextStyle bodyLarge = TextStyle(
    fontFamily: primaryFont,
    fontSize: 16,
    fontWeight: FontWeight.w500,
    height: 1.56,
    color: AppColors.textPrimary,
  );

  static const TextStyle body = TextStyle(
    fontFamily: primaryFont,
    fontSize: 14,
    fontWeight: FontWeight.w400,
    height: 1.5,
    color: AppColors.textSecondary,
  );

  static const TextStyle bodySmall = TextStyle(
    fontFamily: primaryFont,
    fontSize: 13,
    fontWeight: FontWeight.w500,
    height: 1.5,
    color: AppColors.white,
  );

  // ─── Labels / Captions ──────────────────────────────────────────────────
  static const TextStyle label = TextStyle(
    fontFamily: primaryFont,
    fontSize: 12,
    fontWeight: FontWeight.w400,
    height: 1.5,
    color: AppColors.textTertiary,
  );

  static const TextStyle caption = TextStyle(
    fontFamily: primaryFont,
    fontSize: 11,
    fontWeight: FontWeight.w400,
    height: 1.5,
    color: AppColors.textTertiary,
  );

  // ─── Chip specific ──────────────────────────────────────────────────────
  static const TextStyle chipTitle = TextStyle(
    fontFamily: primaryFont,
    fontSize: 13,
    fontWeight: FontWeight.w500,
    color: AppColors.white,
  );

  static const TextStyle chipSubtitle = TextStyle(
    fontFamily: primaryFont,
    fontSize: 10,
    fontWeight: FontWeight.w400,
    color: AppColors.textSecondary,
  );

  // ─── Welcome screen ─────────────────────────────────────────────────────
  static const TextStyle welcomeTitle = TextStyle(
    fontFamily: displayFont,
    fontSize: 22,
    fontWeight: FontWeight.w400,
    color: AppColors.welcomeSubtitle,
  );

  static const TextStyle welcomeCaption = TextStyle(
    fontFamily: captionFont,
    fontSize: 12,
    fontWeight: FontWeight.w400,
    letterSpacing: 4,
    color: AppColors.welcomeCaption,
  );
}
