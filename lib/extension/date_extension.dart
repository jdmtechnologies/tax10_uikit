import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../enum/days_week_enum.dart';

extension DateExtension on DateTime {
  DaysWeekEnum get toDaysWeekEnum {
    return DaysWeekEnum.values[weekday - 1];
  }

  String get toDayMonthYear => DateFormat('dd/MM/yyyy').format(this);
  String get toDayMonthYearV2 => DateFormat("EEEE, d 'de' MMMM 'de' yyyy", 'es').format(this);

  String get toDayMonthYearHourMinute =>
      DateFormat('dd/MM/yyyy hh:mm a').format(this).toLowerCase();

  String get toDayMonthYearHourMinuteSecond =>
      DateFormat('dd/MM/yyyy hh:mm:ss a').format(this).toLowerCase();

  String get toDayMonthYearHourMinuteSecondWithOutAmPm =>
      DateFormat('dd/MM/yyyy hh:mm:ss').format(this);

  String get toDayMonthYearWithOutAmPm => DateFormat('dd/MM/yyyy').format(this);

  String get toTimeAmPm => DateFormat('hh:mm a').format(this).toLowerCase();
}

extension TimeExtension on TimeOfDay {
  String get toHour {
    int hour = this.hour;
    int minute = this.minute;
    String period = hour >= 12 ? 'PM' : 'AM';
    int displayHour = hour == 0 ? 12 : (hour > 12 ? hour - 12 : hour);
    String minuteStr = minute.toString().padLeft(2, '0');
    return '$displayHour:$minuteStr $period';
  }
}
