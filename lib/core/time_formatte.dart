String formatDateTime(String rawDate) {
  final dateTime = DateTime.parse(rawDate);

  final date =
      "${dateTime.year}-${dateTime.month.toString().padLeft(2, '0')}-${dateTime.day.toString().padLeft(2, '0')}";

  int hour = dateTime.hour % 12 == 0 ? 12 : dateTime.hour % 12;
  String minute = dateTime.minute.toString().padLeft(2, '0');
  String period = dateTime.hour >= 12 ? "PM" : "AM";

  final time = "$hour:$minute $period";

  return "$date $time";
}
