import 'package:flutter/material.dart';
import 'package:tax10_uikit/utils/ui_color.dart';

/// Tono visual compartido por [UiStatCard], [UiStatusBadge] y
/// [UiRecordListItem]: define qué color de acento usar (fondo suave +
/// color de icono/texto), tomado de la paleta "tributa".
enum UiTone {
  neutral,
  primary,
  coral,
  teal,
  gold,
  success,
  warning,
  danger;

  /// Color de acento (icono, texto destacado, punto del badge).
  Color get accent {
    switch (this) {
      case UiTone.neutral:
        return AppColors.textSecondary;
      case UiTone.primary:
        return AppColors.primary;
      case UiTone.coral:
        return AppColors.accentCoral;
      case UiTone.teal:
        return AppColors.accentTeal;
      case UiTone.gold:
        return AppColors.accentGold;
      case UiTone.success:
        return AppColors.success;
      case UiTone.warning:
        return AppColors.warning;
      case UiTone.danger:
        return AppColors.error;
    }
  }

  /// Color de fondo suave (chips, íconos, badges).
  Color get soft {
    switch (this) {
      case UiTone.neutral:
        return AppColors.secondary;
      case UiTone.primary:
        return AppColors.secondary;
      case UiTone.coral:
        return AppColors.accentCoralSoft;
      case UiTone.teal:
        return AppColors.accentTealSoft;
      case UiTone.gold:
        return AppColors.accentGoldSoft;
      case UiTone.success:
        return AppColors.accentTealSoft;
      case UiTone.warning:
        return AppColors.accentGoldSoft;
      case UiTone.danger:
        return AppColors.accentCoralSoft;
    }
  }
}
