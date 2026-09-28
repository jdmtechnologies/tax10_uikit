import 'package:flutter/material.dart';
import 'package:tax10_uikit/enum/ui_tone.dart';
import 'package:tax10_uikit/utils/ui_color.dart';
import 'package:tax10_uikit/utils/text_style.dart';
import 'package:tax10_uikit/utils/spacing.dart';

/// Chip de estado: un punto de color + una etiqueta, sobre un fondo suave
/// del mismo tono. Tomado del badge de estado del diseño "tributa" (ej.
/// "Al día" / "Pendiente" / "Vencido").
class UiStatusBadge extends StatelessWidget {
  final String label;
  final UiTone tone;

  const UiStatusBadge({
    super.key,
    required this.label,
    this.tone = UiTone.neutral,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        color: tone.soft,
        borderRadius: BorderRadius.circular(AppSpacing.radiusFull),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 6,
            height: 6,
            decoration: BoxDecoration(
              color: tone.accent,
              shape: BoxShape.circle,
            ),
          ),
          const SizedBox(width: 6),
          Text(
            label,
            style: AppTypography.caption.copyWith(
              color: tone.accent,
              fontWeight: FontWeight.w600,
              height: 1,
            ),
          ),
        ],
      ),
    );
  }
}
