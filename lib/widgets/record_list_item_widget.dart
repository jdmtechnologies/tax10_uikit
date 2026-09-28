import 'package:flutter/material.dart';
import 'package:tax10_uikit/enum/ui_tone.dart';
import 'package:tax10_uikit/utils/ui_color.dart';
import 'package:tax10_uikit/utils/text_style.dart';
import 'package:tax10_uikit/utils/spacing.dart';

/// Fila de lista/tabla: avatar circular con iniciales (color según [tone]),
/// título + subtítulo, y un widget final opcional (badge, texto, flecha).
/// Tomada de la fila de "Clientes recientes" del diseño "tributa".
class UiRecordListItem extends StatelessWidget {
  final String initials;
  final String title;
  final String? subtitle;
  final UiTone tone;
  final Widget? trailing;
  final bool showChevron;
  final VoidCallback? onTap;

  const UiRecordListItem({
    super.key,
    required this.initials,
    required this.title,
    this.subtitle,
    this.tone = UiTone.neutral,
    this.trailing,
    this.showChevron = true,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(AppSpacing.radiusSM),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.paddingSM,
          vertical: AppSpacing.paddingSM,
        ),
        child: Row(
          children: [
            Container(
              width: 36,
              height: 36,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: tone.soft,
                shape: BoxShape.circle,
              ),
              child: Text(
                initials,
                style: AppTypography.caption.copyWith(
                  color: tone.accent,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(width: AppSpacing.sm),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    title,
                    style: AppTypography.bodyMedium
                        .copyWith(fontWeight: FontWeight.w600),
                    overflow: TextOverflow.ellipsis,
                  ),
                  if (subtitle != null) ...[
                    const SizedBox(height: 2),
                    Text(
                      subtitle!,
                      style: AppTypography.caption,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ],
              ),
            ),
            if (trailing != null) ...[
              const SizedBox(width: AppSpacing.sm),
              trailing!,
            ],
            if (showChevron) ...[
              const SizedBox(width: 4),
              Icon(
                Icons.chevron_right,
                size: 18,
                color: AppColors.textTertiary,
              ),
            ],
          ],
        ),
      ),
    );
  }
}
