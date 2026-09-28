import 'package:flutter/material.dart';
import 'package:tax10_uikit/enum/ui_tone.dart';
import 'package:tax10_uikit/utils/ui_color.dart';
import 'package:tax10_uikit/utils/text_style.dart';
import 'package:tax10_uikit/utils/spacing.dart';

/// Tarjeta de métrica: título arriba, ícono en un cuadro de color suave,
/// valor grande y un detalle pequeño abajo. Tomada de las tarjetas de
/// resumen ("Clientes activos", "Impuestos pendientes", etc.) del diseño
/// "tributa".
class UiStatCard extends StatelessWidget {
  final String title;
  final String value;
  final String? detail;
  final IconData icon;
  final UiTone tone;
  final VoidCallback? onTap;

  const UiStatCard({
    super.key,
    required this.title,
    required this.value,
    required this.icon,
    this.detail,
    this.tone = UiTone.primary,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final card = Container(
      padding: const EdgeInsets.all(AppSpacing.paddingLG),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(AppSpacing.radiusLG),
        border: Border.all(color: AppColors.border),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  title,
                  style: AppTypography.bodyMedium.copyWith(
                    color: AppColors.textSecondary,
                  ),
                ),
              ),
              Container(
                width: 36,
                height: 36,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: tone.soft,
                  borderRadius: BorderRadius.circular(AppSpacing.radiusSM),
                ),
                child: Icon(icon, size: 18, color: tone.accent),
              ),
            ],
          ),
          const SizedBox(height: AppSpacing.md),
          Text(
            value,
            style: AppTypography.h3,
          ),
          if (detail != null) ...[
            const SizedBox(height: 4),
            Text(
              detail!,
              style: AppTypography.caption,
            ),
          ],
        ],
      ),
    );

    if (onTap == null) return card;

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(AppSpacing.radiusLG),
      child: card,
    );
  }
}
