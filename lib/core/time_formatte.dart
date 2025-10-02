import 'package:flutter/material.dart';
import 'package:pollution/generated/l10n.dart';

String formatDateTime(String rawDate, BuildContext context) {
  final dateTime = DateTime.parse(rawDate);

  final date =
      "${dateTime.year}-${dateTime.month.toString().padLeft(2, '0')}-${dateTime.day.toString().padLeft(2, '0')}";

  int hour = dateTime.hour % 12 == 0 ? 12 : dateTime.hour % 12;
  String minute = dateTime.minute.toString().padLeft(2, '0');
  String period = dateTime.hour >= 12 ? S.of(context).PM : S.of(context).AM;

  final time = "$hour:$minute $period";

  return "$date $time";
}
