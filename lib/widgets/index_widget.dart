import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tax10_uikit/utils/spacing.dart';
import 'package:tax10_uikit/utils/ui_color.dart';
import 'package:tax10_uikit/utils/text_style.dart';
import 'package:tax10_uikit/enum/ui_tone.dart';
import 'package:tax10_uikit/widgets/stat_card_widget.dart';
import 'package:tax10_uikit/widgets/status_badge_widget.dart';
import 'package:tax10_uikit/widgets/record_list_item_widget.dart';
import 'package:tax10_uikit/widgets/summary_banner_widget.dart';
import 'package:tax10_uikit/widgets/app_top_bar_widget.dart';
import 'package:tax10_uikit/widgets/app_sidebar_widget.dart';
import 'package:tax10_uikit/models/input_type.dart';
import 'package:tax10_uikit/models/blood_type.dart';
import 'package:tax10_uikit/models/gender_type.dart';
import 'package:tax10_uikit/models/place_details.dart';
import 'package:tax10_uikit/utils/loading_overlay.dart';
import 'package:tax10_uikit/widgets/dropdown_widget.dart';
import 'package:tax10_uikit/widgets/base_card_widget.dart';
import 'package:tax10_uikit/widgets/text_input_widget.dart';
import 'package:tax10_uikit/components/inputs/focusable_resizable_input.dart';
import 'package:tax10_uikit/widgets/focusable_text_input_widget.dart';
import 'package:tax10_uikit/widgets/iatros_logo_widget.dart';
import 'package:tax10_uikit/widgets/icon_button_widget.dart';
import 'package:tax10_uikit/models/biological_sex_type.dart';
import 'package:tax10_uikit/extension/context_extension.dart';
import 'package:tax10_uikit/widgets/image_button_widget.dart';
import 'package:tax10_uikit/widgets/custom_floating_button.dart';
import 'package:tax10_uikit/widgets/custom_speed_dial_hild.dart';
import 'package:tax10_uikit/widgets/checkbox_input_widget.dart';
import 'package:tax10_uikit/widgets/password_input_widget.dart';
import 'package:tax10_uikit/models/address_location_model.dart';
import 'package:tax10_uikit/models/medical_specialization.dart';
import 'package:tax10_uikit/widgets/primary_button_widget.dart';
import 'package:tax10_uikit/widgets/gender_selector_widget.dart';
import 'package:tax10_uikit/widgets/secondary_button_widget.dart';
import 'package:tax10_uikit/widgets/file_picker_input_widget.dart';
import 'package:tax10_uikit/widgets/date_picker_input_widget.dart';
import 'package:tax10_uikit/widgets/time_picker_input_widget.dart';
import 'package:tax10_uikit/widgets/background_example_widget.dart';
import 'package:tax10_uikit/widgets/image_picker_input_widget.dart';
import 'package:tax10_uikit/widgets/glassmorphism_card_widget.dart';
import 'package:tax10_uikit/components/inputs/resizable_input.dart';
import 'package:tax10_uikit/widgets/medical_background_widget.dart';
import 'package:tax10_uikit/widgets/blood_type_selector_widget.dart';
import 'package:tax10_uikit/widgets/multi_select_dropdown_widget.dart';
import 'package:tax10_uikit/widgets/identification_selector_widget.dart';
import 'package:tax10_uikit/widgets/simple_medical_background_widget.dart';
import 'package:tax10_uikit/components/inputs/specialization_selector.dart';
import 'package:tax10_uikit/components/inputs/biological_sex_selector.dart';
import 'package:tax10_uikit/components/inputs/address_autocomplete_input.dart';
import 'package:simple_speed_dial/simple_speed_dial.dart';

class UiBackgrounds {
  Widget medicalBackground({
    Key? key,
    required Widget child,
    bool showBotanicalElements = true,
  }) =>
      UiMedicalBackground(
        key: key,
        showBotanicalElements: showBotanicalElements,
        child: child,
      );

  Widget simpleMedicalBackground({
    Key? key,
    required Widget child,
    bool showElements = true,
  }) =>
      UiSimpleMedicalBackground(
        key: key,
        showElements: showElements,
        child: child,
      );

  Widget backgroundExample({Key? key}) => UiBackgroundExample(key: key);
}

class UiButtons {
  Widget primaryButton({
    Key? key,
    required String label,
    required VoidCallback onPressed,
    double? width,
    double? height,
    bool isLoading = false,
    bool isDisabled = false,
  }) =>
      UiPrimaryButton(
        key: key,
        label: label,
        onPressed: onPressed,
        width: width,
        height: height,
        isLoading: isLoading,
        isDisabled: isDisabled,
      );

  Widget secondaryButton({
    Key? key,
    required String label,
    required VoidCallback onPressed,
    double? width,
    double? height,
    bool isLoading = false,
    bool isDisabled = false,
  }) =>
      UiSecondaryButton(
        key: key,
        label: label,
        onPressed: onPressed,
        width: width,
        height: height,
        isLoading: isLoading,
        isDisabled: isDisabled,
      );

  Widget iconButton({
    Key? key,
    required IconData icon,
    required VoidCallback onPressed,
    bool isLoading = false,
    bool isDisabled = false,
    Color? backgroundColor,
    Color? iconColor,
    double size = 24,
    String? tooltip,
  }) =>
      UiIconButton(
        key: key,
        icon: icon,
        onPressed: onPressed,
        isLoading: isLoading,
        isDisabled: isDisabled,
        backgroundColor: backgroundColor,
        iconColor: iconColor,
        size: size,
        tooltip: tooltip,
      );

  Widget imageButton({
    Key? key,
    required VoidCallback onTap,
    double size = 100,
    String? image,
    IconData? icon,
  }) =>
      UiImageButton(
        key: key,
        onTap: onTap,
        size: size,
        image: image ?? '',
        icon: icon,
      );

  Widget customFloatingButton({
    Key? key,
    required IconData icon,
    required List<SpeedDialChild> speedDialChildren,
  }) =>
      CustomFloatingButton(
        key: key,
        icon: icon,
        speedDialChildren: speedDialChildren,
      );

  SpeedDialChild customSpeedDial({
    required IconData icon,
    required String label,
    required VoidCallback onPressed,
  }) {
    return customSpeedDialChild(
      icon,
      label,
      onPressed,
    );
  }
}

class UiCards {
  Widget baseCard({
    Key? key,
    required Widget child,
    EdgeInsetsGeometry? padding,
    EdgeInsetsGeometry? margin,
    Color? backgroundColor,
    double? elevation,
    BorderRadius? borderRadius,
    VoidCallback? onTap,
  }) =>
      UiBaseCard(
        key: key,
        padding: padding,
        margin: margin,
        backgroundColor: backgroundColor,
        elevation: elevation,
        borderRadius: borderRadius,
        onTap: onTap,
        child: child,
      );

  Widget glassmorphismCard({
    Key? key,
    required Widget child,
    double blur = 10.0,
    double opacity = 0.1,
    EdgeInsetsGeometry? padding,
    BorderRadius? borderRadius,
    Color? backgroundColor,
    BoxBorder? border,
  }) =>
      UiGlassmorphismCard(
        key: key,
        blur: blur,
        opacity: opacity,
        padding: padding,
        borderRadius: borderRadius,
        backgroundColor: backgroundColor,
        border: border,
        child: child,
      );

  /// Tarjeta de métrica (ícono + valor + detalle), tomada del diseño
  /// "tributa" (ej. "Clientes activos", "Impuestos pendientes").
  Widget statCard({
    Key? key,
    required String title,
    required String value,
    required IconData icon,
    String? detail,
    UiTone tone = UiTone.primary,
    VoidCallback? onTap,
  }) =>
      UiStatCard(
        key: key,
        title: title,
        value: value,
        icon: icon,
        detail: detail,
        tone: tone,
        onTap: onTap,
      );
}

class UiData {
  /// Chip de estado (punto de color + etiqueta), ej. "Al día"/"Pendiente".
  Widget statusBadge({
    Key? key,
    required String label,
    UiTone tone = UiTone.neutral,
  }) =>
      UiStatusBadge(key: key, label: label, tone: tone);

  /// Fila de lista/tabla con avatar de iniciales, título, subtítulo y un
  /// widget final opcional (badge, flecha, etc).
  Widget recordListItem({
    Key? key,
    required String initials,
    required String title,
    String? subtitle,
    UiTone tone = UiTone.neutral,
    Widget? trailing,
    bool showChevron = true,
    VoidCallback? onTap,
  }) =>
      UiRecordListItem(
        key: key,
        initials: initials,
        title: title,
        subtitle: subtitle,
        tone: tone,
        trailing: trailing,
        showChevron: showChevron,
        onTap: onTap,
      );

  /// Banner destacado de resumen (fondo primario, estadísticas a la
  /// derecha), tomado del banner "Resumen del periodo" del diseño "tributa".
  Widget summaryBanner({
    Key? key,
    required String eyebrow,
    required String title,
    required String description,
    List<UiSummaryStat> stats = const [],
    String? actionLabel,
    VoidCallback? onActionPressed,
  }) =>
      UiSummaryBanner(
        key: key,
        eyebrow: eyebrow,
        title: title,
        description: description,
        stats: stats,
        actionLabel: actionLabel,
        onActionPressed: onActionPressed,
      );
}

class UiNavigation {
  /// Barra superior con subtítulo (ej. fecha), acciones e info de usuario.
  PreferredSizeWidget appTopBar({
    Key? key,
    Widget? leading,
    String? subtitle,
    List<UiTopBarAction> actions = const [],
    required String userInitials,
    required String userName,
    VoidCallback? onUserTap,
  }) =>
      UiAppTopBar(
        key: key,
        leading: leading,
        subtitle: subtitle,
        actions: actions,
        userInitials: userInitials,
        userName: userName,
        onUserTap: onUserTap,
      );

  /// Menú lateral de navegación como panel fijo (para layouts de
  /// escritorio/web). Para móvil, usa [appDrawer].
  Widget appSidebar({
    Key? key,
    required Widget logo,
    required String appName,
    String? appTagline,
    List<UiSidebarSection> sections = const [],
    Widget? footer,
    double width = 260,
  }) =>
      UiAppSidebar(
        key: key,
        logo: logo,
        appName: appName,
        appTagline: appTagline,
        sections: sections,
        footer: footer,
        width: width,
      );

  /// Igual que [appSidebar], envuelto en un [Drawer] para
  /// `Scaffold(drawer: ...)` en layouts móviles.
  Widget appDrawer({
    Key? key,
    required Widget logo,
    required String appName,
    String? appTagline,
    List<UiSidebarSection> sections = const [],
    Widget? footer,
  }) =>
      UiAppDrawer(
        key: key,
        logo: logo,
        appName: appName,
        appTagline: appTagline,
        sections: sections,
        footer: footer,
      );

  /// Fila de usuario (avatar + nombre + rol) para el pie de [appSidebar] o
  /// [appDrawer].
  Widget sidebarUserFooter({
    Key? key,
    required String initials,
    required String name,
    required String role,
    VoidCallback? onTap,
  }) =>
      UiSidebarUserFooter(
        key: key,
        initials: initials,
        name: name,
        role: role,
        onTap: onTap,
      );
}

class UiInputs {
  Widget dropdown({
    Key? key,
    required List<String> items,
    required TextEditingController controller,
    String? value,
    ValueChanged<String?>? onChanged,
    VoidCallback? onFocus,
    String? hint,
    String? label,
    String? errorText,
    bool isRequired = false,
    InputType type = InputType.dark,
    double? width,
    FocusNode? focusNode,
  }) =>
      UiDropdown(
        key: key,
        items: items,
        value: value,
        onChanged: onChanged,
        controller: controller,
        onFocus: onFocus,
        hint: hint,
        label: label,
        errorText: errorText,
        isRequired: isRequired,
        type: type,
        width: width,
        focusNode: focusNode,
      );

  Widget textInput({
    Key? key,
    String? hint,
    String? label,
    int? maxLines,
    int? maxLength,
    String? errorText,
    Widget? prefixIcon,
    Widget? suffixIcon,
    VoidCallback? onTap,
    bool isRequired = false,
    bool isReadOnly = false,
    bool obscureText = false,
    bool semiObscureText = false,
    bool semiObscureTextStart = false,
    bool semiObscureTextEnd = false,
    TextInputType? keyboardType,
    ValueChanged<String>? onChanged,
    Iterable<String>? autofillHints,
    InputType type = InputType.dark,
    TextEditingController? controller,
    String? Function(String?)? validator,
    List<TextInputFormatter>? inputFormatters,
  }) =>
      UiTextInput(
        key: key,
        hint: hint,
        type: type,
        label: label,
        onTap: onTap,
        maxLines: maxLines,
        maxLength: maxLength,
        validator: validator,
        errorText: errorText,
        onChanged: onChanged,
        controller: controller,
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        isRequired: isRequired,
        isReadOnly: isReadOnly,
        obscureText: obscureText,
        keyboardType: keyboardType,
        autofillHints: autofillHints,
        semiObscureText: semiObscureText,
        semiObscureTextStart: semiObscureTextStart,
        semiObscureTextEnd: semiObscureTextEnd,
        inputFormatters: inputFormatters,
      );

  /// Igual a [textInput] pero acepta un [focusNode] externo, para
  /// integrarlo a una cadena de foco explícita (p. ej. avanzar con Tab).
  Widget focusableTextInput({
    Key? key,
    String? hint,
    String? label,
    int? maxLines,
    int? maxLength,
    String? errorText,
    Widget? prefixIcon,
    Widget? suffixIcon,
    VoidCallback? onTap,
    FocusNode? focusNode,
    bool isRequired = false,
    bool isReadOnly = false,
    bool obscureText = false,
    TextInputType? keyboardType,
    ValueChanged<String>? onChanged,
    Iterable<String>? autofillHints,
    InputType type = InputType.dark,
    TextEditingController? controller,
    String? Function(String?)? validator,
    List<TextInputFormatter>? inputFormatters,
  }) =>
      UiFocusableTextInput(
        key: key,
        hint: hint,
        type: type,
        label: label,
        onTap: onTap,
        focusNode: focusNode,
        maxLines: maxLines,
        maxLength: maxLength,
        validator: validator,
        errorText: errorText,
        onChanged: onChanged,
        controller: controller,
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        isRequired: isRequired,
        isReadOnly: isReadOnly,
        obscureText: obscureText,
        keyboardType: keyboardType,
        autofillHints: autofillHints,
        inputFormatters: inputFormatters,
      );

  Widget passwordInput({
    Key? key,
    String? hint,
    String? label,
    InputType type = InputType.light,
    bool isRequired = false,
    String? errorText,
    TextEditingController? controller,
    ValueChanged<String>? onChanged,
    String? Function(String?)? validator,
    Iterable<String>? autofillHints,
  }) =>
      UiPasswordInput(
        key: key,
        hint: hint,
        label: label,
        type: type,
        isRequired: isRequired,
        errorText: errorText,
        controller: controller,
        onChanged: onChanged,
        validator: validator,
        autofillHints: autofillHints,
      );

  Widget resizableInput({
    Key? key,
    String? label,
    String? hintText,
    String? errorText,
    bool isRequired = false,
    required TextEditingController controller,
    int minLines = 5,
  }) =>
      ResizableInput(
        key: key,
        label: label,
        hintText: hintText,
        errorText: errorText,
        controller: controller,
        isRequired: isRequired,
        minLines: minLines,
      );

  /// Igual a [resizableInput] pero acepta un [focusNode] externo, para
  /// integrarlo a una cadena de foco explícita (p. ej. avanzar con Tab).
  Widget focusableResizableInput({
    Key? key,
    String? label,
    String? hintText,
    String? errorText,
    FocusNode? focusNode,
    bool isRequired = false,
    required TextEditingController controller,
    int minLines = 5,
  }) =>
      FocusableResizableInput(
        key: key,
        label: label,
        hintText: hintText,
        errorText: errorText,
        focusNode: focusNode,
        controller: controller,
        isRequired: isRequired,
        minLines: minLines,
      );

  Widget datePickerInput({
    Key? key,
    String? label,
    DateTime? firstDate,
    DateTime? lastDate,
    DateTime? initialDate,
    ValueNotifier<DateTime?>? selectedDateNotifier,
    ValueChanged<DateTime>? onDateSelected,
    bool isRequired = false,
    String? errorText,
    InputType type = InputType.dark,
  }) =>
      UiDatePickerInput(
        key: key,
        label: label,
        firstDate: firstDate,
        lastDate: lastDate,
        initialDate: initialDate,
        selectedDateNotifier: selectedDateNotifier,
        onDateSelected: onDateSelected,
        isRequired: isRequired,
        errorText: errorText,
        type: type,
      );

  Widget timePickerInput({
    Key? key,
    String? label,
    String? hintText,
    TimeOfDay? initialTime,
    ValueNotifier<TimeOfDay?>? selectedTimeNotifier,
    ValueChanged<TimeOfDay>? onTimeSelected,
    bool isRequired = false,
    String? errorText,
    InputType type = InputType.dark,
  }) =>
      UiTimePickerInput(
        key: key,
        label: label,
        hintText: hintText,
        initialTime: initialTime,
        selectedTimeNotifier: selectedTimeNotifier,
        onTimeSelected: onTimeSelected,
        isRequired: isRequired,
        errorText: errorText,
        type: type,
      );

  Widget identificationSelector({
    Key? key,
    ValueNotifier<String?>? selectedTypeNotifier,
    TextEditingController? numberController,
    ValueChanged<String?>? onTypeChanged,
    ValueChanged<String>? onNumberChanged,
    String? errorText,
    bool isRequired = false,
    bool readOnly = false,
    InputType type = InputType.dark,
    bool useColumnLayout = false,
    required List<String> identificationList,
  }) =>
      UiIdentificationSelector(
        key: key,
        useColumnLayout: useColumnLayout,
        selectedTypeNotifier: selectedTypeNotifier,
        numberController: numberController,
        onTypeChanged: onTypeChanged,
        onNumberChanged: onNumberChanged,
        errorText: errorText,
        isRequired: isRequired,
        readOnly: readOnly,
        type: type,
        identificationList: identificationList,
      );

  Widget genderSelector({
    Key? key,
    ValueNotifier<Gender?>? selectedGenderNotifier,
    ValueChanged<Gender?>? onChanged,
    String? errorText,
    bool isRequired = false,
    InputType type = InputType.dark,
  }) =>
      UiGenderSelector(
        key: key,
        selectedGenderNotifier: selectedGenderNotifier,
        onChanged: onChanged,
        errorText: errorText,
        isRequired: isRequired,
        type: type,
      );

  Widget biologicalSexSelector({
    Key? key,
    ValueNotifier<BiologicalSexType?>? selectedBiologicalSexNotifier,
    ValueChanged<BiologicalSexType?>? onChanged,
    String? errorText,
    bool isRequired = false,
    InputType type = InputType.dark,
  }) =>
      BiologicalSexSelector(
        key: key,
        selectedBiologicalSexNotifier: selectedBiologicalSexNotifier,
        onChanged: onChanged,
        errorText: errorText,
        isRequired: isRequired,
        type: type,
      );

  Widget bloodTypeSelector({
    Key? key,
    ValueNotifier<BloodType?>? selectedBloodTypeNotifier,
    ValueChanged<BloodType?>? onChanged,
    String? errorText,
    bool isRequired = false,
    InputType type = InputType.dark,
  }) =>
      UiBloodTypeSelector(
        key: key,
        selectedBloodTypeNotifier: selectedBloodTypeNotifier,
        onChanged: onChanged,
        errorText: errorText,
        isRequired: isRequired,
        type: type,
      );

  Widget imagePickerInput({
    Key? key,
    String? label,
    String? hint,
    String? errorText,
    dynamic selectedImage,
    required ValueChanged<dynamic> onImageSelected,
    bool isRequired = false,
    double? maxWidth,
    double? maxHeight,
    InputType type = InputType.dark,
  }) =>
      UiImagePickerInput(
        key: key,
        label: label,
        hint: hint,
        errorText: errorText,
        selectedImage: selectedImage,
        onImageSelected: onImageSelected,
        isRequired: isRequired,
        maxWidth: maxWidth,
        maxHeight: maxHeight,
        type: type,
      );

  Widget filePickerInput({
    Key? key,
    String? label,
    String? hint,
    String? errorText,
    dynamic selectedFile,
    required ValueChanged<dynamic> onFileSelected,
    bool isRequired = false,
    List<String>? allowedExtensions,
    String? fileName,
  }) =>
      UiFilePickerInput(
        key: key,
        label: label,
        hint: hint,
        errorText: errorText,
        selectedFile: selectedFile,
        onFileSelected: onFileSelected,
        isRequired: isRequired,
        allowedExtensions: allowedExtensions,
        fileName: fileName,
      );

  Widget addressAutocompleteInput({
    Key? key,
    String? hint,
    String? label,
    String? errorText,
    String? initialValue,
    TextEditingController? controller,
    required ValueChanged<String> onAddressSelected,
    required Future<PlaceDetails?> Function(String) getPlaceDetails,
    ValueChanged<PlaceDetails>? onPlaceDetailsSelected,
    required Future<List<AddressLocationModel>> Function(String)
        searchAddressWeb,
    bool isRequired = false,
    InputType type = InputType.dark,
  }) =>
      AddressAutocompleteInput(
        key: key,
        hint: hint,
        type: type,
        label: label,
        errorText: errorText,
        controller: controller,
        isRequired: isRequired,
        initialValue: initialValue,
        getPlaceDetails: getPlaceDetails,
        searchAddressWeb: searchAddressWeb,
        onAddressSelected: onAddressSelected,
        onPlaceDetailsSelected: onPlaceDetailsSelected,
      );

  Widget checkboxInput({
    Key? key,
    required String label,
    required bool value,
    ValueChanged<bool?>? onChanged,
    bool tristate = false,
  }) =>
      UiCheckboxInput(
        key: key,
        label: label,
        value: value,
        onChanged: onChanged,
        tristate: tristate,
      );

  Widget multiSelectDropdown<T>({
    Key? key,
    String? label,
    String? hint,
    required List<T> options,
    required List<T> selectedItems,
    required String Function(T) displayText,
    required ValueChanged<List<T>> onChanged,
    bool isRequired = false,
    bool isMultiselect = true,
    String? errorText,
    Future<void> Function(String)? onSearch,
    Widget Function(T)? children,
    VoidCallback? onAddElement,
    String? labelButton,
    TextEditingController? searchController,
    bool reverseSelectedOrder = false,
    FocusNode? focusNode,
  }) =>
      UiMultiSelectDropdown<T>(
        key: key,
        label: label,
        hint: hint,
        options: options,
        selectedItems: selectedItems,
        displayText: displayText,
        onChanged: onChanged,
        isRequired: isRequired,
        children: children,
        isMultiselect: isMultiselect,
        errorText: errorText,
        onSearch: onSearch,
        onAddElement: onAddElement,
        labelButton: labelButton,
        searchController: searchController,
        reverseSelectedOrder: reverseSelectedOrder,
        focusNode: focusNode,
      );

  Widget specializationSelector({
    Key? key,
    String? selectedSpecialization,
    required ValueChanged<String?> onChanged,
    required List<MedicalSpecialization> initialList,
    String? errorText,
    bool isRequired = false,
    InputType type = InputType.dark,
  }) =>
      SpecializationSelector(
        key: key,
        selectedSpecialization: selectedSpecialization,
        onChanged: onChanged,
        initialList: initialList,
        errorText: errorText,
        isRequired: isRequired,
        type: type,
      );
}

class UiLogo {
  Widget iatrosLogo({
    Key? key,
    double? width,
    double? height,
    bool showText = true,
    Color? textColor,
    double? textSize,
  }) =>
      UiIatrosLogo(
        key: key,
        width: width,
        height: height,
        showText: showText,
        textColor: textColor,
        textSize: textSize,
      );

  Widget iatrosLogoVertical({
    Key? key,
    double? width,
    double? height,
  }) =>
      UiIatrosLogoVertical(
        key: key,
        width: width,
        height: height,
      );

  Widget iatrosLogoIcon({
    Key? key,
    double? size,
    Color? color,
  }) =>
      UiIatrosLogoIcon(
        key: key,
        size: size,
        color: color,
      );
}

enum _FeedbackPopUpType { success, error, info }

class _ConfirmationPopUpContent extends StatelessWidget {
  const _ConfirmationPopUpContent({
    required this.title,
    this.description,
    required this.onConfirm,
    required this.onCancel,
    this.confirmLabel = 'Aceptar',
    this.cancelLabel = 'Cancelar',
    this.size = AlertSize.medium,
  });

  final String title;
  final String? description;
  final VoidCallback onConfirm;
  final VoidCallback onCancel;
  final String confirmLabel;
  final String cancelLabel;
  final AlertSize size;

  double get _iconSize {
    switch (size) {
      case AlertSize.short:
        return 40;
      case AlertSize.medium:
        return 56;
      case AlertSize.large:
        return 72;
      case AlertSize.xlarge:
        return 80;
    }
  }

  double get _maxWidthFactor {
    switch (size) {
      case AlertSize.short:
        return 0.65;
      case AlertSize.medium:
        return 0.85;
      case AlertSize.large:
        return 0.92;
      case AlertSize.xlarge:
        return 0.98;
    }
  }

  EdgeInsets get _padding {
    switch (size) {
      case AlertSize.short:
        return const EdgeInsets.symmetric(
          horizontal: AppSpacing.paddingMD,
          vertical: AppSpacing.paddingMD,
        );
      case AlertSize.medium:
        return const EdgeInsets.symmetric(
          horizontal: AppSpacing.paddingXL,
          vertical: AppSpacing.paddingLG,
        );
      case AlertSize.large:
        return const EdgeInsets.symmetric(
          horizontal: AppSpacing.paddingXL * 1.25,
          vertical: AppSpacing.paddingXL,
        );
      case AlertSize.xlarge:
        return const EdgeInsets.symmetric(
          horizontal: AppSpacing.paddingXL * 1.5,
          vertical: AppSpacing.paddingXL * 1.25,
        );
    }
  }

  double get _spacingAfterIcon {
    switch (size) {
      case AlertSize.short:
        return AppSpacing.sm;
      case AlertSize.medium:
        return AppSpacing.lg;
      case AlertSize.large:
        return AppSpacing.xl;
      case AlertSize.xlarge:
        return AppSpacing.xl;
    }
  }

  TextStyle get _titleStyle {
    switch (size) {
      case AlertSize.short:
        return AppTypography.bodyLarge.copyWith(
          color: AppColors.textPrimary,
          fontWeight: FontWeight.w600,
        );
      case AlertSize.medium:
        return AppTypography.h4.copyWith(color: AppColors.textPrimary);
      case AlertSize.large:
        return AppTypography.h3.copyWith(color: AppColors.textPrimary);
      case AlertSize.xlarge:
        return AppTypography.h2.copyWith(color: AppColors.textPrimary);
    }
  }

  TextStyle get _descriptionStyle {
    switch (size) {
      case AlertSize.short:
        return AppTypography.bodySmall.copyWith(
          color: AppColors.textSecondary,
        );
      case AlertSize.medium:
        return AppTypography.bodyMedium.copyWith(
          color: AppColors.textSecondary,
        );
      case AlertSize.large:
        return AppTypography.bodyLarge.copyWith(
          color: AppColors.textSecondary,
        );
      case AlertSize.xlarge:
        return AppTypography.bodyLarge.copyWith(
          color: AppColors.textSecondary,
        );
    }
  }

  double get _radius {
    switch (size) {
      case AlertSize.short:
        return AppSpacing.radiusSM;
      case AlertSize.medium:
        return AppSpacing.radiusMD;
      case AlertSize.large:
        return AppSpacing.radiusLG;
      case AlertSize.xlarge:
        return AppSpacing.radiusLG;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(
        maxWidth: context.sizeWidth(_maxWidthFactor),
      ),
      padding: _padding,
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(_radius),
        boxShadow: [
          BoxShadow(
            color: AppColors.black.withValues(alpha: 0.1),
            blurRadius: 16,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            Icons.help_outline,
            size: _iconSize,
            color: AppColors.primary,
          ),
          SizedBox(height: _spacingAfterIcon),
          Text(
            title,
            style: _titleStyle,
            textAlign: TextAlign.center,
          ),
          if (description != null && description!.isNotEmpty) ...[
            SizedBox(
                height:
                    size == AlertSize.short ? AppSpacing.xs : AppSpacing.sm),
            Text(
              description!,
              style: _descriptionStyle,
              textAlign: TextAlign.center,
            ),
          ],
          SizedBox(
              height: size == AlertSize.short ? AppSpacing.md : AppSpacing.xl),
          Row(
            children: [
              Expanded(
                child: UiSecondaryButton(
                  label: cancelLabel,
                  onPressed: onCancel,
                ),
              ),
              const SizedBox(width: AppSpacing.sm),
              Expanded(
                child: UiPrimaryButton(
                  label: confirmLabel,
                  onPressed: onConfirm,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

/// Tamaño visual del pop-up de alerta: [short], [medium], [large].
enum AlertSize {
  short,
  medium,
  large,
  xlarge,
}

class _FeedbackPopUpContent extends StatelessWidget {
  const _FeedbackPopUpContent({
    required this.type,
    required this.title,
    this.description,
    required this.onOk,
    this.okLabel = 'OK',
    this.size = AlertSize.medium,
  });

  final _FeedbackPopUpType type;
  final String title;
  final String? description;
  final VoidCallback onOk;
  final String okLabel;
  final AlertSize size;

  Color get _iconColor {
    switch (type) {
      case _FeedbackPopUpType.success:
        return AppColors.success;
      case _FeedbackPopUpType.error:
        return AppColors.error;
      case _FeedbackPopUpType.info:
        return AppColors.info;
    }
  }

  IconData get _icon {
    switch (type) {
      case _FeedbackPopUpType.success:
        return Icons.check_circle_outline;
      case _FeedbackPopUpType.error:
        return Icons.error_outline;
      case _FeedbackPopUpType.info:
        return Icons.info_outline;
    }
  }

  double get _iconSize {
    switch (size) {
      case AlertSize.short:
        return 40;
      case AlertSize.medium:
        return 56;
      case AlertSize.large:
        return 72;
      case AlertSize.xlarge:
        return 80;
    }
  }

  double get _maxWidthFactor {
    switch (size) {
      case AlertSize.short:
        return 0.65;
      case AlertSize.medium:
        return 0.85;
      case AlertSize.large:
        return 0.92;
      case AlertSize.xlarge:
        return 0.98;
    }
  }

  EdgeInsets get _padding {
    switch (size) {
      case AlertSize.short:
        return const EdgeInsets.symmetric(
          horizontal: AppSpacing.paddingMD,
          vertical: AppSpacing.paddingMD,
        );
      case AlertSize.medium:
        return const EdgeInsets.symmetric(
          horizontal: AppSpacing.paddingXL,
          vertical: AppSpacing.paddingLG,
        );
      case AlertSize.large:
        return const EdgeInsets.symmetric(
          horizontal: AppSpacing.paddingXL * 1.25,
          vertical: AppSpacing.paddingXL,
        );
      case AlertSize.xlarge:
        return const EdgeInsets.symmetric(
          horizontal: AppSpacing.paddingXL * 1.5,
          vertical: AppSpacing.paddingXL * 1.25,
        );
    }
  }

  double get _spacingAfterIcon {
    switch (size) {
      case AlertSize.short:
        return AppSpacing.sm;
      case AlertSize.medium:
        return AppSpacing.lg;
      case AlertSize.large:
        return AppSpacing.xl;
      case AlertSize.xlarge:
        return AppSpacing.xl;
    }
  }

  TextStyle get _titleStyle {
    switch (size) {
      case AlertSize.short:
        return AppTypography.bodyLarge.copyWith(
          color: AppColors.textPrimary,
          fontWeight: FontWeight.w600,
        );
      case AlertSize.medium:
        return AppTypography.h4.copyWith(color: AppColors.textPrimary);
      case AlertSize.large:
        return AppTypography.h3.copyWith(color: AppColors.textPrimary);
      case AlertSize.xlarge:
        return AppTypography.h2.copyWith(color: AppColors.textPrimary);
    }
  }

  TextStyle get _descriptionStyle {
    switch (size) {
      case AlertSize.short:
        return AppTypography.bodySmall.copyWith(
          color: AppColors.textSecondary,
        );
      case AlertSize.medium:
        return AppTypography.bodyMedium.copyWith(
          color: AppColors.textSecondary,
        );
      case AlertSize.large:
        return AppTypography.bodyLarge.copyWith(
          color: AppColors.textSecondary,
        );
      case AlertSize.xlarge:
        return AppTypography.bodyLarge.copyWith(
          color: AppColors.textSecondary,
        );
    }
  }

  double get _radius {
    switch (size) {
      case AlertSize.short:
        return AppSpacing.radiusSM;
      case AlertSize.medium:
        return AppSpacing.radiusMD;
      case AlertSize.large:
        return AppSpacing.radiusLG;
      case AlertSize.xlarge:
        return AppSpacing.radiusLG;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(
        maxWidth: context.sizeWidth(_maxWidthFactor),
      ),
      padding: _padding,
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(_radius),
        boxShadow: [
          BoxShadow(
            color: AppColors.black.withValues(alpha: 0.1),
            blurRadius: 16,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            _icon,
            size: _iconSize,
            color: _iconColor,
          ),
          SizedBox(height: _spacingAfterIcon),
          Text(
            title,
            style: _titleStyle,
            textAlign: TextAlign.center,
          ),
          if (description != null && description!.isNotEmpty) ...[
            SizedBox(
                height:
                    size == AlertSize.short ? AppSpacing.xs : AppSpacing.sm),
            Text(
              description!,
              style: _descriptionStyle,
              textAlign: TextAlign.center,
            ),
          ],
          SizedBox(
              height: size == AlertSize.short ? AppSpacing.md : AppSpacing.xl),
          UiPrimaryButton(
            label: okLabel,
            width: double.infinity,
            onPressed: onOk,
          ),
        ],
      ),
    );
  }
}

/// Un par etiqueta/valor mostrado en la grilla de [UiPopUp.showDetail] (ej.
/// "Obligaciones activas" / "4").
class UiDetailStat {
  final String label;
  final String value;

  const UiDetailStat({required this.label, required this.value});
}

class _DetailDialogContent extends StatelessWidget {
  const _DetailDialogContent({
    required this.initials,
    required this.title,
    this.subtitle,
    this.stats = const [],
    this.body,
    this.actionLabel,
    this.onActionPressed,
    this.tone = UiTone.neutral,
  });

  final String initials;
  final String title;
  final String? subtitle;
  final List<UiDetailStat> stats;
  final Widget? body;
  final String? actionLabel;
  final VoidCallback? onActionPressed;
  final UiTone tone;

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(
        maxWidth:
            context.sizeWidth(0.9) < 420 ? context.sizeWidth(0.9) : 420,
      ),
      padding: const EdgeInsets.all(AppSpacing.paddingLG),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(AppSpacing.radiusLG),
        boxShadow: [
          BoxShadow(
            color: AppColors.black.withValues(alpha: 0.15),
            blurRadius: 24,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 44,
                height: 44,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: tone.soft,
                  shape: BoxShape.circle,
                ),
                child: Text(
                  initials,
                  style: AppTypography.bodyLarge.copyWith(
                    color: tone.accent,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      title,
                      style: AppTypography.h5,
                    ),
                    if (subtitle != null)
                      Text(subtitle!, style: AppTypography.bodySmall),
                  ],
                ),
              ),
              IconButton(
                onPressed: () => Navigator.of(context).pop(),
                icon: const Icon(Icons.close),
                iconSize: 20,
                color: AppColors.textSecondary,
                style: IconButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(AppSpacing.radiusSM),
                  ),
                ),
              ),
            ],
          ),
          if (stats.isNotEmpty) ...[
            const SizedBox(height: AppSpacing.lg),
            Row(
              children: [
                for (var i = 0; i < stats.length; i++) ...[
                  if (i > 0) const SizedBox(width: AppSpacing.sm),
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.all(AppSpacing.paddingMD),
                      decoration: BoxDecoration(
                        color: AppColors.surfaceVariant,
                        borderRadius:
                            BorderRadius.circular(AppSpacing.radiusSM),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(stats[i].label, style: AppTypography.caption),
                          const SizedBox(height: 4),
                          Text(stats[i].value, style: AppTypography.h5),
                        ],
                      ),
                    ),
                  ),
                ],
              ],
            ),
          ],
          if (body != null) ...[
            const SizedBox(height: AppSpacing.lg),
            body!,
          ],
          if (actionLabel != null) ...[
            const SizedBox(height: AppSpacing.lg),
            UiPrimaryButton(
              label: actionLabel!,
              width: double.infinity,
              onPressed: onActionPressed ?? () => Navigator.of(context).pop(),
            ),
          ],
        ],
      ),
    );
  }
}

class UiPopUp {
  Widget loadingOverlay({
    Key? key,
    required bool isLoading,
    required Widget child,
  }) =>
      LoadingOverlay(
        key: key,
        isLoading: isLoading,
        child: child,
      );

  /// Muestra un pop-up de éxito (icono verde, título y descripción opcional).
  /// [size]: [AlertSize.short], [AlertSize.medium] o [AlertSize.large].
  /// Al tocar el fondo transparente se cierra el pop-up.
  Future<void> showSuccess(
    BuildContext context, {
    required String title,
    String? description,
    AlertSize size = AlertSize.medium,
  }) async {
    return showDialog(
      context: context,
      barrierDismissible: true,
      barrierColor: AppColors.black.withValues(alpha: 0.4),
      builder: (BuildContext context) {
        return Dialog(
          backgroundColor: Colors.transparent,
          elevation: 0,
          child: _FeedbackPopUpContent(
            type: _FeedbackPopUpType.success,
            title: title,
            description: description,
            onOk: () => Navigator.of(context).pop(),
            size: size,
          ),
        );
      },
    );
  }

  /// Muestra un pop-up de error (icono rojo, título y descripción opcional).
  /// [size]: [AlertSize.short], [AlertSize.medium] o [AlertSize.large].
  /// Al tocar el fondo transparente se cierra el pop-up.
  Future<void> showError(
    BuildContext context, {
    required String title,
    String? description,
    AlertSize size = AlertSize.medium,
  }) async {
    return showDialog(
      context: context,
      barrierDismissible: true,
      barrierColor: AppColors.black.withValues(alpha: 0.4),
      builder: (BuildContext context) {
        return Dialog(
          backgroundColor: Colors.transparent,
          elevation: 0,
          child: _FeedbackPopUpContent(
            type: _FeedbackPopUpType.error,
            title: title,
            description: description,
            onOk: () => Navigator.of(context).pop(),
            size: size,
          ),
        );
      },
    );
  }

  /// Muestra un pop-up de información (icono azul, título y descripción opcional).
  /// [size]: [AlertSize.short], [AlertSize.medium] o [AlertSize.large].
  /// Al tocar el fondo transparente se cierra el pop-up.
  Future<void> showInfo(
    BuildContext context, {
    required String title,
    String? description,
    String okLabel = 'OK',
    VoidCallback? onOkPressed,
    AlertSize size = AlertSize.medium,
  }) async {
    return showDialog(
      context: context,
      barrierDismissible: true,
      barrierColor: AppColors.black.withValues(alpha: 0.4),
      builder: (BuildContext context) {
        return Dialog(
          backgroundColor: Colors.transparent,
          elevation: 0,
          child: _FeedbackPopUpContent(
            type: _FeedbackPopUpType.info,
            title: title,
            description: description,
            onOk: () {
              Navigator.of(context).pop();
              onOkPressed?.call();
            },
            okLabel: okLabel,
            size: size,
          ),
        );
      },
    );
  }

  /// Muestra un pop-up de confirmación con botones Cancelar y Aceptar.
  /// [onConfirm] se invoca cuando el usuario toca Aceptar.
  /// El pop-up se cierra automáticamente antes de llamar a [onConfirm].
  Future<void> showConfirmation(
    BuildContext context, {
    required String title,
    String? description,
    required VoidCallback onConfirm,
    String confirmLabel = 'Aceptar',
    String cancelLabel = 'Cancelar',
    AlertSize size = AlertSize.medium,
  }) async {
    return showDialog(
      context: context,
      barrierDismissible: true,
      barrierColor: AppColors.black.withValues(alpha: 0.4),
      builder: (BuildContext context) {
        return Dialog(
          backgroundColor: Colors.transparent,
          elevation: 0,
          child: _ConfirmationPopUpContent(
            title: title,
            description: description,
            onConfirm: onConfirm,
            onCancel: () => Navigator.of(context).pop(),
            confirmLabel: confirmLabel,
            cancelLabel: cancelLabel,
            size: size,
          ),
        );
      },
    );
  }

  /// Muestra un pop-up de detalle: avatar con iniciales, título, subtítulo,
  /// botón de cerrar (X), una grilla opcional de estadísticas y un botón de
  /// acción a todo el ancho. Tomado del modal de detalle de cliente del
  /// diseño "tributa" (genérico: sirve para cualquier registro/entidad).
  Future<void> showDetail(
    BuildContext context, {
    required String initials,
    required String title,
    String? subtitle,
    List<UiDetailStat> stats = const [],
    Widget? body,
    String? actionLabel,
    VoidCallback? onActionPressed,
    UiTone tone = UiTone.neutral,
  }) async {
    return showDialog(
      context: context,
      barrierDismissible: true,
      barrierColor: AppColors.black.withValues(alpha: 0.3),
      builder: (BuildContext context) {
        return Dialog(
          backgroundColor: Colors.transparent,
          elevation: 0,
          child: _DetailDialogContent(
            initials: initials,
            title: title,
            subtitle: subtitle,
            stats: stats,
            body: body,
            actionLabel: actionLabel,
            onActionPressed: onActionPressed,
            tone: tone,
          ),
        );
      },
    );
  }
}

/// Agrupa todos los widgets del paquete.
class UiWidget {
  UiWidget._();
  static final UiWidget _instance = UiWidget._();
  factory UiWidget() => _instance;

  UiBackgrounds backgrounds = UiBackgrounds();
  UiButtons buttons = UiButtons();
  UiCards cards = UiCards();
  UiInputs inputs = UiInputs();
  UiLogo logo = UiLogo();
  UiPopUp popUp = UiPopUp();
  UiData data = UiData();
  UiNavigation navigation = UiNavigation();
}
