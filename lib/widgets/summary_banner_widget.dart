import 'package:flutter/material.dart';
import 'package:tax10_uikit/utils/ui_color.dart';
import 'package:tax10_uikit/utils/text_style.dart';
import 'package:tax10_uikit/utils/spacing.dart';

/// Un valor destacado dentro de [UiSummaryBanner] (ej. "45" / "al día").
class UiSummaryStat {
  final String value;
  final String label;

  const UiSummaryStat({required this.value, required this.label});
}

/// Banner destacado de resumen: fondo de color primario, un texto pequeño
/// ("eyebrow"), título, descripción, y a la derecha una fila de estadísticas
/// separadas por una línea vertical. Tomado del banner "Resumen del periodo"
/// del diseño "tributa".
class UiSummaryBanner extends StatelessWidget {
  final String eyebrow;
  final String title;
  final String description;
  final List<UiSummaryStat> stats;
  final String? actionLabel;
  final VoidCallback? onActionPressed;

  const UiSummaryBanner({
    super.key,
    required this.eyebrow,
    required this.title,
    required this.description,
    this.stats = const [],
    this.actionLabel,
    this.onActionPressed,
  });

  Widget _buildTextBlock() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          eyebrow.toUpperCase(),
          style: AppTypography.caption.copyWith(
            color: AppColors.textInverse.withValues(alpha: 0.6),
            fontWeight: FontWeight.w700,
            letterSpacing: 1,
          ),
        ),
        const SizedBox(height: 6),
        Text(
          title,
          style: AppTypography.h4.copyWith(color: AppColors.textInverse),
        ),
        const SizedBox(height: 4),
        Text(
          description,
          style: AppTypography.bodyMedium.copyWith(
            color: AppColors.textInverse.withValues(alpha: 0.7),
          ),
        ),
      ],
    );
  }

  Widget? _buildStatsBlock() {
    if (stats.isEmpty && actionLabel == null) return null;
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        for (var i = 0; i < stats.length; i++) ...[
          if (i > 0)
            Container(
              width: 1,
              height: 36,
              margin: const EdgeInsets.symmetric(horizontal: AppSpacing.md),
              color: AppColors.textInverse.withValues(alpha: 0.2),
            ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                stats[i].value,
                style:
                    AppTypography.h3.copyWith(color: AppColors.textInverse),
              ),
              Text(
                stats[i].label,
                style: AppTypography.caption.copyWith(
                  color: AppColors.textInverse.withValues(alpha: 0.6),
                ),
              ),
            ],
          ),
        ],
        if (actionLabel != null) ...[
          const SizedBox(width: AppSpacing.lg),
          TextButton(
            onPressed: onActionPressed,
            style: TextButton.styleFrom(
              backgroundColor: AppColors.textInverse.withValues(alpha: 0.1),
              foregroundColor: AppColors.textInverse,
              textStyle:
                  AppTypography.caption.copyWith(fontWeight: FontWeight.w700),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(AppSpacing.radiusSM),
              ),
            ),
            child: Text(actionLabel!),
          ),
        ],
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final textBlock = _buildTextBlock();
    final statsBlock = _buildStatsBlock();

    return Container(
      padding: const EdgeInsets.all(AppSpacing.paddingLG),
      decoration: BoxDecoration(
        color: AppColors.primary,
        borderRadius: BorderRadius.circular(AppSpacing.radiusLG),
      ),
      child: LayoutBuilder(
        builder: (context, constraints) {
          // En pantallas angostas, apila el bloque de estadísticas debajo.
          if (constraints.maxWidth < 560) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                textBlock,
                if (statsBlock != null) ...[
                  const SizedBox(height: AppSpacing.lg),
                  statsBlock,
                ],
              ],
            );
          }
          return Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(child: textBlock),
              if (statsBlock != null) ...[
                const SizedBox(width: AppSpacing.lg),
                statsBlock,
              ],
            ],
          );
        },
      ),
    );
  }
}
