import 'package:flutter/material.dart';
import 'package:tax10_uikit/utils/spacing.dart';
import 'package:tax10_uikit/utils/ui_color.dart';
import 'package:tax10_uikit/utils/text_style.dart';
import 'package:tax10_uikit/models/input_type.dart';

/// Dropdown de selección simple, con el mismo estilo visual (label, borde,
/// fondo) que [UiTextInput], para listas de opciones conocidas de antemano
/// (catálogos) en lugar de texto libre con filtro.
class UiSelectInput<T> extends StatelessWidget {
  final String? hint;
  final String? label;
  final InputType type;
  final bool isRequired;
  final bool isReadOnly;
  final String? errorText;
  final List<T> items;
  final T? value;
  final String Function(T item) itemLabel;
  final ValueChanged<T?>? onChanged;
  final String? emptyOptionLabel;

  const UiSelectInput({
    super.key,
    this.hint,
    this.label,
    this.value,
    this.errorText,
    this.onChanged,
    this.emptyOptionLabel,
    required this.items,
    required this.itemLabel,
    this.isReadOnly = false,
    this.isRequired = false,
    this.type = InputType.dark,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (label != null) ...[
          RichText(
            text: TextSpan(
              text: label,
              style: AppTypography.label.copyWith(
                color: type == InputType.dark
                    ? AppColors.black
                    : AppColors.white,
              ),
              children: [
                if (isRequired)
                  const TextSpan(
                    text: ' *',
                    style: TextStyle(color: AppColors.error),
                  ),
              ],
            ),
          ),
          const SizedBox(height: AppSpacing.xs),
        ],
        DropdownButtonFormField<T?>(
          initialValue: value,
          onChanged: isReadOnly ? null : onChanged,
          style: AppTypography.bodyMedium.copyWith(
            color: AppColors.textPrimary,
          ),
          decoration: InputDecoration(
            hintText: hint,
            errorText: errorText,
            filled: true,
            fillColor: isReadOnly ? AppColors.gray50 : AppColors.surface,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(AppSpacing.radiusMD),
              borderSide: const BorderSide(color: AppColors.gray300),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(AppSpacing.radiusMD),
              borderSide: const BorderSide(color: AppColors.gray300),
            ),
            disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(AppSpacing.radiusMD),
              borderSide: const BorderSide(color: AppColors.gray300),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(AppSpacing.radiusMD),
              borderSide: const BorderSide(color: AppColors.primary, width: 2),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(AppSpacing.radiusMD),
              borderSide: const BorderSide(color: AppColors.error),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(AppSpacing.radiusMD),
              borderSide: const BorderSide(color: AppColors.error, width: 2),
            ),
            contentPadding: const EdgeInsets.symmetric(
              horizontal: AppSpacing.paddingMD,
              vertical: AppSpacing.paddingSM,
            ),
          ),
          items: [
            if (emptyOptionLabel != null)
              DropdownMenuItem<T?>(
                value: null,
                child: Text(emptyOptionLabel!),
              ),
            ...items.map(
              (item) => DropdownMenuItem<T?>(
                value: item,
                child: Text(itemLabel(item), overflow: TextOverflow.ellipsis),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
