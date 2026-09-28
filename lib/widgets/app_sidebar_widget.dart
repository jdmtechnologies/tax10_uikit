import 'package:flutter/material.dart';
import 'package:tax10_uikit/utils/ui_color.dart';
import 'package:tax10_uikit/utils/text_style.dart';
import 'package:tax10_uikit/utils/spacing.dart';

/// Un ítem de navegación dentro de [UiAppSidebar] (ej. "Clientes", con un
/// ícono, un contador opcional y si está seleccionado).
class UiSidebarNavItem {
  final IconData icon;
  final String label;
  final String? badge;
  final bool selected;
  final VoidCallback onTap;

  const UiSidebarNavItem({
    required this.icon,
    required this.label,
    this.badge,
    this.selected = false,
    required this.onTap,
  });
}

/// Un grupo de [UiSidebarNavItem] con un título opcional (ej. "Principal",
/// "Administración").
class UiSidebarSection {
  final String? title;
  final List<UiSidebarNavItem> items;

  const UiSidebarSection({this.title, required this.items});
}

/// Menú lateral de navegación (equivalente al `Drawer` de Flutter, pero
/// pensado también para usarse como panel fijo en layouts de escritorio/web):
/// logo + nombre de la app arriba, secciones de navegación en el medio, y un
/// pie opcional (normalmente [UiSidebarUserFooter]). Tomado del sidebar del
/// diseño "tributa".
class UiAppSidebar extends StatelessWidget {
  final Widget logo;
  final String appName;
  final String? appTagline;
  final List<UiSidebarSection> sections;
  final Widget? footer;
  final double width;

  const UiAppSidebar({
    super.key,
    required this.logo,
    required this.appName,
    this.appTagline,
    this.sections = const [],
    this.footer,
    this.width = 260,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      color: AppColors.sidebar,
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: AppSpacing.md,
            vertical: AppSpacing.lg,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Row(
                  children: [
                    logo,
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            appName,
                            style: AppTypography.label
                                .copyWith(fontWeight: FontWeight.bold),
                            overflow: TextOverflow.ellipsis,
                          ),
                          if (appTagline != null)
                            Text(
                              appTagline!,
                              style: AppTypography.caption,
                              overflow: TextOverflow.ellipsis,
                            ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: AppSpacing.xl),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      for (var i = 0; i < sections.length; i++) ...[
                        if (i > 0) const SizedBox(height: AppSpacing.lg),
                        _UiSidebarSectionView(section: sections[i]),
                      ],
                    ],
                  ),
                ),
              ),
              if (footer != null) ...[
                Divider(color: AppColors.sidebarBorder),
                const SizedBox(height: 4),
                footer!,
              ],
            ],
          ),
        ),
      ),
    );
  }
}

class _UiSidebarSectionView extends StatelessWidget {
  const _UiSidebarSectionView({required this.section});

  final UiSidebarSection section;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (section.title != null)
          Padding(
            padding: const EdgeInsets.fromLTRB(12, 0, 12, 8),
            child: Text(
              section.title!.toUpperCase(),
              style: AppTypography.caption.copyWith(
                fontWeight: FontWeight.bold,
                letterSpacing: 1.2,
                fontSize: 10,
              ),
            ),
          ),
        for (final item in section.items) _UiSidebarNavItemView(item: item),
      ],
    );
  }
}

class _UiSidebarNavItemView extends StatelessWidget {
  const _UiSidebarNavItemView({required this.item});

  final UiSidebarNavItem item;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 2),
      child: Material(
        color: item.selected ? AppColors.primary : Colors.transparent,
        borderRadius: BorderRadius.circular(AppSpacing.radiusSM),
        child: InkWell(
          onTap: item.onTap,
          borderRadius: BorderRadius.circular(AppSpacing.radiusSM),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 12,
              vertical: 10,
            ),
            child: Row(
              children: [
                Icon(
                  item.icon,
                  size: 18,
                  color: item.selected
                      ? AppColors.textInverse
                      : AppColors.textSecondary,
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    item.label,
                    style: AppTypography.bodyMedium.copyWith(
                      color: item.selected
                          ? AppColors.textInverse
                          : AppColors.textPrimary,
                    ),
                  ),
                ),
                if (item.badge != null)
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 6,
                      vertical: 2,
                    ),
                    decoration: BoxDecoration(
                      color: item.selected
                          ? AppColors.textInverse.withValues(alpha: 0.15)
                          : AppColors.secondary,
                      borderRadius: BorderRadius.circular(AppSpacing.radiusXS),
                    ),
                    child: Text(
                      item.badge!,
                      style: AppTypography.caption.copyWith(
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                        color: item.selected
                            ? AppColors.textInverse
                            : AppColors.textSecondary,
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

/// Fila de usuario para el pie de [UiAppSidebar]: avatar con iniciales,
/// nombre, rol/subtítulo y una flecha. Tomada del pie del sidebar del
/// diseño "tributa".
class UiSidebarUserFooter extends StatelessWidget {
  final String initials;
  final String name;
  final String role;
  final VoidCallback? onTap;

  const UiSidebarUserFooter({
    super.key,
    required this.initials,
    required this.name,
    required this.role,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(AppSpacing.radiusSM),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          child: Row(
            children: [
              Container(
                width: 32,
                height: 32,
                alignment: Alignment.center,
                decoration: const BoxDecoration(
                  color: AppColors.secondary,
                  shape: BoxShape.circle,
                ),
                child: Text(
                  initials,
                  style: AppTypography.caption
                      .copyWith(fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      name,
                      style: AppTypography.bodyMedium
                          .copyWith(fontWeight: FontWeight.w600),
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      role,
                      style: AppTypography.caption,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
              Icon(Icons.keyboard_arrow_down,
                  size: 18, color: AppColors.textSecondary),
            ],
          ),
        ),
      ),
    );
  }
}

/// Igual que [UiAppSidebar], pero envuelto en un [Drawer] de Material, listo
/// para usar en `Scaffold(drawer: UiAppDrawer(...))` en layouts móviles.
class UiAppDrawer extends StatelessWidget {
  final Widget logo;
  final String appName;
  final String? appTagline;
  final List<UiSidebarSection> sections;
  final Widget? footer;

  const UiAppDrawer({
    super.key,
    required this.logo,
    required this.appName,
    this.appTagline,
    this.sections = const [],
    this.footer,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: AppColors.sidebar,
      child: UiAppSidebar(
        logo: logo,
        appName: appName,
        appTagline: appTagline,
        sections: sections,
        footer: footer,
        width: double.infinity,
      ),
    );
  }
}
