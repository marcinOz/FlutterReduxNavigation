import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:squashy/localization.dart';

class DateTodayFormatter {
  final DateTime _dateTime;
  DateTime _todayMidnight;

  DateTodayFormatter(this._dateTime) {
    _todayMidnight = _getTodayMidnight();
  }

  DateTime _getTodayMidnight() {
    final now = DateTime.now();
    return now.subtract(Duration(hours: now.hour,
        minutes: now.minute,
        seconds: now.second,
        milliseconds: now.millisecond));
  }

  bool _checkIfToday() =>
      _dateTime.isAfter(_todayMidnight) &&
          _dateTime.isBefore(_todayMidnight.add(Duration(days: 1)));

  bool _checkIfTomorrow() =>
      _dateTime.isAfter(_todayMidnight.add(Duration(days: 1))) &&
          _dateTime.isBefore(_todayMidnight.add(Duration(days: 2)));

  bool _checkIfYesterday() =>
      _dateTime.isAfter(_todayMidnight.subtract(Duration(days: 1))) &&
          _dateTime.isBefore(_todayMidnight);

  String format(BuildContext context) {
    String result;
    if (_checkIfToday()) {
      result = AppLocalizations.of(context).today;
    } else if (_checkIfTomorrow()) {
      result = AppLocalizations.of(context).tomorrow;
    } else if (_checkIfYesterday()) {
      result = AppLocalizations.of(context).yesterday;
    } else {
      result = DateFormat.yMMMd().format(_dateTime);
    }
    return result;
  }
}
