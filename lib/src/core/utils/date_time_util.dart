import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

/// Utility class for date and time formatting and manipulation.
class DateTimeUtil {
  /// Default format for dates: yyyy-MM-dd
  static const String defaultDateFormat = 'yyyy-MM-dd';

  /// Default format for parsing date-time: yyyy-MM-dd HH:mm
  static const String defaultDateTimeParseFormat = 'yyyy-MM-dd HH:mm';

  /// Default format for displaying date-time: yyyy-MM-dd hh:mm a
  static const String defaultDateTimeFormat = 'yyyy-MM-dd hh:mm a';

  /// Long date-time format with seconds.
  static const String formatDayMonthYearHourMinSec = 'dd MMM yyyy hh:mm:ss a';

  /// Standard sortable date-time format.
  static const String formatYearMonthDayHourMinSec = 'yyyy-MM-dd HH:mm:ss';

  /// Detailed format including weekday.
  static const String formatWeekDayMonthYear = 'EEEE, dd MMMM yyyy';

  /// US standard date format.
  static const String formatMMDDYYYY = 'MM/dd/yyyy';

  /// 12-hour time format with AM/PM.
  static const String formatHourMinAmPm = 'hh:mm a';

  /// International standard date format.
  static const String formatDDMMYYY = 'dd/MM/yyyy';

  /// Short month/day format.
  static const String formatMMDD = 'MM/dd';

  /// Short month name format.
  static const String formatMMM = 'MMM';

  /// Converts a UTC [DateTime] to local time.
  static DateTime convertDateToLocal(DateTime dateTime) {
    return DateTime.parse('$dateTime${'Z'}').toLocal();
  }

  /// Returns a formatted date string.
  static String getFormattedDate(
    DateTime? dateTime, {
    String format = defaultDateTimeFormat,
    bool localized = true,
    String? locale,
  }) {
    try {
      return getFormatDayMonthYearHourMinSec(
        dateTime.toString(),
        format: format,
        localized: localized,
        locale: locale,
      );
    } catch (_) {}
    return dateTime?.toString() ?? '';
  }

  /// Parses and formats a date string.
  static String getFormatDayMonthYearHourMinSec(
    String? dateTime, {
    String format = defaultDateTimeFormat,
    bool localized = true,
    String? locale,
  }) {
    try {
      if (dateTime != null) {
        return DateFormat(
          format,
          locale,
        ).format(DateTime.parse('$dateTime${localized ? 'Z' : ''}').toLocal());
      }
    } catch (_) {}
    return dateTime ?? '';
  }

  /// Formats a [DateTime] using [formatYearMonthDayHourMinSec].
  static String getFormatYearMonthDayHourMinSec(DateTime dateTime) {
    return DateFormat(formatYearMonthDayHourMinSec).format(dateTime);
  }

  /// Adds a number of months to a [DateTime].
  static DateTime addMonthsDateTime(DateTime dateTime, int months) {
    return dateTime.isUtc
        ? DateTime.utc(
            dateTime.year,
            dateTime.month + months,
            dateTime.day,
            dateTime.hour,
            dateTime.minute,
            dateTime.second,
            dateTime.millisecond,
          )
        : DateTime(
            dateTime.year,
            dateTime.month + months,
            dateTime.day,
            dateTime.hour,
            dateTime.minute,
            dateTime.second,
            dateTime.millisecond,
          );
  }

  /// Returns the current local time formatted as [formatHourMinAmPm].
  static String getCurrentHourMin() {
    return DateFormat(formatHourMinAmPm).format(DateTime.now().toLocal());
  }

  /// Returns the current UTC time formatted as [defaultDateTimeParseFormat].
  static String getCurrentUTCDateTime() {
    return DateFormat(defaultDateTimeParseFormat).format(DateTime.timestamp());
  }

  /// Checks if two dates fall in the same month and year.
  static bool isSameMonthAndYear(DateTime firstDate, DateTime secondDate) {
    return firstDate.month == secondDate.month &&
        firstDate.year == secondDate.year;
  }

  /// Checks if two dates represent the same day.
  static bool isSameDay(DateTime firstDate, DateTime secondDate) {
    return firstDate.month == secondDate.month &&
        firstDate.year == secondDate.year &&
        firstDate.day == secondDate.day;
  }

  /// Checks if two dates represent the same day and hour.
  static bool isSameDayAndHour(DateTime firstDate, DateTime secondDate) {
    return isSameDay(firstDate, secondDate) &&
        firstDate.hour == secondDate.hour;
  }

  /// Find the first date of the week which contains the provided date.
  static DateTime findFirstDateOfTheWeek(DateTime dateTime) {
    return dateTime.subtract(Duration(days: dateTime.weekday - 1));
  }

  /// Find last date of the week which contains provided date.
  static DateTime findLastDateOfTheWeek(DateTime dateTime) {
    return dateTime.add(
      Duration(days: DateTime.daysPerWeek - dateTime.weekday),
    );
  }

  /// Find the first date of the month which contains the provided date.
  static DateTime findFirstDateOfTheMonth(DateTime dateTime) {
    return DateTime(dateTime.year, dateTime.month, 1);
  }

  /// Find last date of the month which contains provided date.
  static DateTime findLastDateOfTheMonth(DateTime dateTime) {
    return dateTime.month < 12
        ? DateTime(dateTime.year, dateTime.month + 1, 0)
        : DateTime(dateTime.year + 1, 1, 0);
  }

  /// Returns the date one day before [dateTime].
  static DateTime getOneDayBackward(DateTime dateTime) {
    return DateTime(dateTime.year, dateTime.month, dateTime.day - 1);
  }

  /// Returns the date one day after [dateTime].
  static DateTime getOneDayForward(DateTime dateTime) {
    return DateTime(dateTime.year, dateTime.month, dateTime.day + 1);
  }

  /// Returns a [DateTimeRange] for quick-filter keys:
  /// `today`, `yesterday`, `last_week`, `last_month`, `last_quarter`.
  static DateTimeRange getDateRangeByType(String type) {
    final now = DateTime.now();
    DateTime start;
    DateTime end;

    switch (type) {
      case 'today':
        start = end = DateTime(now.year, now.month, now.day);
        break;
      case 'yesterday':
        final y = now.subtract(const Duration(days: 1));
        start = end = DateTime(y.year, y.month, y.day);
        break;
      case 'last_week':
        final lastMonday = now.subtract(Duration(days: now.weekday + 6));
        start = DateTime(lastMonday.year, lastMonday.month, lastMonday.day);
        end = start.add(const Duration(days: 6));
        break;
      case 'last_month':
        start = DateTime(now.year, now.month - 1, 1);
        end = DateTime(now.year, now.month, 0);
        break;
      case 'last_quarter':
        final currentQuarter = ((now.month - 1) ~/ 3) + 1;
        final startMonth = (currentQuarter - 2) * 3 + 1;
        start = DateTime(now.year, startMonth, 1);
        end = DateTime(now.year, startMonth + 3, 0);
        break;
      default:
        start = end = DateTime(now.year, now.month, now.day);
    }

    return DateTimeRange(start: start, end: end);
  }

  /// Returns string in calendar format "yyyyMMdd".
  static String convertBandReadableCalender(DateTime dateTime) {
    String calenderDate = DateFormat('yyyyMMdd').format(dateTime);
    return calenderDate;
  }

  /// Parses band calendar strings produced by [convertBandReadableCalender].
  static DateTime parseBandReadableCalender(String calender) {
    return DateFormat('yyyyMMdd').parse(calender.trim());
  }

  /// Converts minutes to "HH:mm" format.
  static String getTimeByIntegerMin(int minutes) {
    int hour = minutes ~/ 60;
    int min = minutes % 60;
    return '${hour.toString().padLeft(2, "0")}:${min.toString().padLeft(2, "0")}';
  }

  /// Formats a [Duration] as "HH:mm:ss".
  static String formatDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, "0");
    String hours = twoDigits(duration.inHours);
    String minutes = twoDigits(duration.inMinutes.remainder(60));
    String seconds = twoDigits(duration.inSeconds.remainder(60));
    return "$hours:$minutes:$seconds";
  }

  /// Formats a number with comma separators.
  static String formatNumber(int number) {
    var f = NumberFormat("#,###", "en_US");
    return f.format(number);
  }
}
