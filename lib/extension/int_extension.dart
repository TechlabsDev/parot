import 'package:intl/intl.dart';

extension IntExtension on int {
  String get to2Digits {
    if (this < 10) {
      return "0$this";
    } else {
      return "$this";
    }
  }

  //세자리마다 콤마 표기
  //ex. 10000 -> 10,000
  String get toCommaFormat {
    return NumberFormat('###,###,###,###').format(this);
  }
}
