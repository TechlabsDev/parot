import 'package:intl/intl.dart';

extension IntExtension on int {
  String get to2Digits {
    if (this < 10) {
      return "0$this";
    } else {
      return "$this";
    }
  }

  String get toCommaFormat {
    return NumberFormat('###,###,###,###').format(this);
  }
}
