extension DateTimeExtension on DateTime {
  // "2024.01.30. 10:30",
  String get YYYYMMDDhhmmWithColon {
    return "${this.year}.${this.month.toString().padLeft(2, '0')}.${this.day.toString().padLeft(2, '0')}. ${this.hour.toString().padLeft(2, '0')}:${this.minute.toString().padLeft(2, '0')}";
  }

  //3시간 전, 방금 전, 1일 전...
  String get timeAgo {
    final now = DateTime.now();
    final difference = now.difference(this);
    if (difference.inDays > 0) {
      return "${difference.inDays}일 전";
    } else if (difference.inHours > 0) {
      return "${difference.inHours}시간 전";
    } else if (difference.inMinutes > 0) {
      return "${difference.inMinutes}분 전";
    } else {
      return "방금 전";
    }
  }
}
