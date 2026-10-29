import 'package:flutter/material.dart';

/// Centralized color palette for the entire application.
/// Never use raw Color(...) or Colors.xxx directly in UI code.
class AppColors {
  AppColors._();

  // ─── Base ───────────────────────────────────────────────────────────────
  static const Color black = Color(0xFF000000);
  static const Color white = Color(0xFFFFFFFF);
  static const Color transparent = Color(0x00000000);

  // ─── Backgrounds ────────────────────────────────────────────────────────
  static const Color background = black;
  static const Color surface = Color(0x0DFFFFFF); // white @ 5%
  static const Color surfaceElevated = Color(0x14FFFFFF); // white @ 8%

  // ─── Primary ────────────────────────────────────────────────────────────
  static const Color primary = Color(0xFF2F6BFF);
  static const Color primaryLight = Color(0xFF3F78FF);
  static const Color primarySoft = Color(0x282F6BFF); // selected chip bg

  // ─── Semantic / Accent ──────────────────────────────────────────────────
  static const Color successLight = Color(0xFF4ec9b0); // أخضر فاتح
  static const Color success = Color(0xFF22C55E); // أخضر
  static const Color successDark = Color(0xFF16A34A); // أخضر غامق
  static const Color warning = Color(0xFFF59E0B); // برتقالي (اختياري)
  static const Color dangerSoft = Color(0xFFF87171); // أحمر فاتح
  static const Color danger = Color(0xFFC71C1C); // أحمر (موجود)

  static const Color accentBlue = Color(0xFF4A85FF);
  static const Color accentPurple = Color(0xFF9A82FF);
  static const Color accentCyan = Color(0xFF0189F1); // Welcome underline

  // ─── Buttons ────────────────────────────────────────────────────────────
  static const Color buttonPrimary = Color(0xFFF5F6F7);
  static const Color buttonPrimaryText = black;

  // ─── Borders ────────────────────────────────────────────────────────────
  static const Color border = Color(0x24FFFFFF); // white @ 14%
  static const Color borderSubtle = Color(0x14FFFFFF); // white @ 8%
  static const Color borderSelected = primary;

  // ─── Text hierarchy (prefer these over withValues) ──────────────────────
  static const Color textPrimary = Color(0xEBFFFFFF); // ~92%
  static const Color textSecondary = Color(0xADFFFFFF); // ~68%
  static const Color textTertiary = Color(0x99FFFFFF); // ~60%
  static const Color textDisabled = Color(0x80FFFFFF); // ~50%
  static const Color textHint = Color(0x66FFFFFF); // ~40%

  // ─── Welcome screen specific ────────────────────────────────────────────
  static const Color welcomeSubtitle = Color(0xFFCDD1D9);
  static const Color welcomeCaption = Color(0xFFC6CAD1);
}
