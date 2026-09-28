import 'package:flutter/widgets.dart';
import 'package:tax10_uikit/tax10_uikit.dart';
import 'package:simple_speed_dial/simple_speed_dial.dart';

SpeedDialChild customSpeedDialChild(
  IconData icon,
  String label,
  VoidCallback onPressed,
) {
  return SpeedDialChild(
    label: label,
    child: Icon(icon),
    onPressed: onPressed,
    foregroundColor: AppColors.white,
    backgroundColor: AppColors.primary,
  );
}
