import 'package:flutter/material.dart';
import 'package:tax10_uikit/utils/ui_color.dart';
import 'package:tax10_uikit/utils/text_style.dart';
import 'package:tax10_uikit/utils/spacing.dart';

/// Una acción del [UiAppTopBar] (ej. ayuda, notificaciones): un ícono con
/// [onPressed], y un punto opcional para indicar novedades sin leer.
class UiTopBarAction {
  final IconData icon;
  final VoidCallback onPressed;
  final String? tooltip;
  final bool showDot;

  const UiTopBarAction({
    required this.icon,
    required this.onPressed,
    this.tooltip,
    this.showDot = false,
  });
}

/// Barra superior: un texto secundario a la izquierda (ej. la fecha), una
/// fila de acciones (íconos con punto de novedad opcional) y un chip de
/// usuario (iniciales + nombre) a la derecha. Tomada del header del diseño
/// "tributa".
class UiAppTopBar extends StatelessWidget implements PreferredSizeWidget {
  final Widget? leading;
  final String? subtitle;
  final List<UiTopBarAction> actions;
  final String userInitials;
  final String userName;
  final VoidCallback? onUserTap;

  const UiAppTopBar({
    super.key,
    this.leading,
    this.subtitle,
    this.actions = const [],
    required this.userInitials,
    required this.userName,
    this.onUserTap,
  });

  @override
  Size get preferredSize => const Size.fromHeight(64);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: preferredSize.height,
      padding: const EdgeInsets.symmetric(horizontal: AppSpacing.lg),
      decoration: BoxDecoration(
        color: AppColors.surface,
        border: Border(bottom: BorderSide(color: AppColors.border)),
      ),
      child: Row(
        children: [
          if (leading != null) ...[leading!, const SizedBox(width: 12)],
          if (subtitle != null)
            Expanded(
              child: Text(
                subtitle!,
                style: AppTypography.bodyMedium
                    .copyWith(color: AppColors.textSecondary),
              ),
            )
          else
            const Spacer(),
          for (final action in actions)
            Padding(
              padding: const EdgeInsets.only(left: 4),
              child: _TopBarIcon(action: action),
            ),
          if (actions.isNotEmpty) ...[
            const SizedBox(width: 8),
            Container(width: 1, height: 24, color: AppColors.border),
            const SizedBox(width: 8),
          ],
          InkWell(
            onTap: onUserTap,
            borderRadius: BorderRadius.circular(AppSpacing.radiusSM),
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 8,
                vertical: 4,
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    width: 28,
                    height: 28,
                    alignment: Alignment.center,
                    decoration: const BoxDecoration(
                      color: AppColors.secondary,
                      shape: BoxShape.circle,
                    ),
                    child: Text(
                      userInitials,
                      style: AppTypography.caption
                          .copyWith(fontWeight: FontWeight.bold),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Text(userName, style: AppTypography.label),
                  const SizedBox(width: 4),
                  Icon(Icons.keyboard_arrow_down,
                      size: 18, color: AppColors.textSecondary),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _TopBarIcon extends StatelessWidget {
  const _TopBarIcon({required this.action});

  final UiTopBarAction action;

  @override
  Widget build(BuildContext context) {
    final button = IconButton(
      onPressed: action.onPressed,
      icon: Icon(action.icon, size: 20, color: AppColors.textSecondary),
      style: IconButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppSpacing.radiusSM),
        ),
      ),
    );

    final withDot = action.showDot
        ? Stack(
            clipBehavior: Clip.none,
            children: [
              button,
              Positioned(
                right: 8,
                top: 8,
                child: Container(
                  width: 7,
                  height: 7,
                  decoration: const BoxDecoration(
                    color: AppColors.accentCoral,
                    shape: BoxShape.circle,
                  ),
                ),
              ),
            ],
          )
        : button;

    if (action.tooltip == null) return withDot;
    return Tooltip(message: action.tooltip!, child: withDot);
  }
}
