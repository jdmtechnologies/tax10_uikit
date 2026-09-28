import 'package:flutter/material.dart';

/// Paleta de colores de tax10_uikit.
///
/// Adaptada del diseño "tributa" (mockup generado con v0): fondo cálido tipo
/// arena, un primary azul marino oscuro, y tres acentos de marca (coral,
/// teal, gold), cada uno con una variante "soft" para fondos de chips/badges.
class AppColors {
  // Colores primarios
  static const Color primary = Color(0xFF122539);
  static const Color primaryLight = Color(0xFF247A76);
  static const Color primaryDark = Color(0xFF0B1622);

  // Colores secundarios (tonos cálidos tipo "arena")
  static const Color secondary = Color(0xFFEDE7DB);
  static const Color secondaryLight = Color(0xFFF2EEE6);
  static const Color secondaryDark = Color(0xFFE7E1D3);

  // Colores de estado
  static const Color success = Color(0xFF006964);
  static const Color warning = Color(0xFFA67110);
  static const Color error = Color(0xFFD24C49);
  static const Color info = Color(0xFF247A76);

  // Colores neutros (escala cálida)
  static const Color white = Color(0xFFFFFFFF);
  static const Color black = Color(0xFF000000);
  static const Color gray50 = Color(0xFFF9F7F1);
  static const Color gray100 = Color(0xFFF5F2EA);
  static const Color gray200 = Color(0xFFEDE7DB);
  static const Color gray300 = Color(0xFFDFDAD0);
  static const Color gray400 = Color(0xFFD7D0C3);
  static const Color gray500 = Color(0xFFB4ADA0);
  static const Color gray600 = Color(0xFF958E82);
  static const Color gray700 = Color(0xFF5E6A77);
  static const Color gray800 = Color(0xFF3E4955);
  static const Color gray900 = Color(0xFF141E28);

  // Colores de fondo / superficies
  static const Color background = Color(0xFFF9F7F1);
  static const Color surface = Color(0xFFFFFFFF);
  static const Color surfaceVariant = Color(0xFFF2EEE6);
  static const Color popover = Color(0xFFFFFFFF);
  static const Color border = Color(0xFFDFDAD0);
  static const Color input = Color(0xFFD7D0C3);
  static const Color ring = Color(0xFF247A76);
  static const Color sidebar = Color(0xFFF2EEE6);
  static const Color sidebarBorder = Color(0xFFDFDAD0);

  // Acentos de marca (tributa): coral, teal, gold + variante suave para
  // fondos de chips/badges.
  static const Color accentCoral = Color(0xFFD5584D);
  static const Color accentCoralSoft = Color(0xFFFFE1D7);
  static const Color accentTeal = Color(0xFF006964);
  static const Color accentTealSoft = Color(0xFFC0EBE8);
  static const Color accentGold = Color(0xFFA67110);
  static const Color accentGoldSoft = Color(0xFFFFE8C2);

  // Colores médicos/botánicos heredados de iatros_uikit. No se usan en el
  // diseño de tax10, pero se conservan para los widgets decorativos de fondo
  // existentes (medicalBackground, backgroundExample, etc).
  static const Color medicalBlue = Color(0xFFE6F3FF);
  static const Color botanicalGreen = Color(0xFFE8F5E8);
  static const Color leafGreen = Color(0xFFB8E6B8);
  static const Color turquoise = Color(0xFFB8E6E6);
  static const Color coral = Color(0xFFFFE4E1);
  static const Color peach = Color(0xFFFFF0E6);

  // Colores de texto
  static const Color textPrimary = Color(0xFF141E28);
  static const Color textSecondary = Color(0xFF5E6A77);
  static const Color textTertiary = Color(0xFF958E82);
  static const Color textInverse = Color(0xFFFFFFFF);
}
