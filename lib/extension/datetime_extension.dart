extension DateTimeExtension on DateTime {
  // "2024.01.30. 10:30",
  String get commentCellDate {
    return "${this.year}.${this.month.toString().padLeft(2, '0')}.${this.day.toString().padLeft(2, '0')}. ${this.hour.toString().padLeft(2, '0')}:${this.minute.toString().padLeft(2, '0')}";
  }
}
