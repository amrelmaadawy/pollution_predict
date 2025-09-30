String formatDateTime(String rawDate) {
  final dateTime = DateTime.parse(rawDate);

  // التاريخ (yyyy-MM-dd)
  final date = "${dateTime.year}-${dateTime.month.toString().padLeft(2, '0')}-${dateTime.day.toString().padLeft(2, '0')}";

  // الوقت (HH:mm)
  final time = "${dateTime.hour.toString().padLeft(2, '0')}:${dateTime.minute.toString().padLeft(2, '0')}";

  return "$date $time";
}
