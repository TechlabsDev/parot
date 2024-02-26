import 'package:parot/const/route/sign_in_path.dart';
import 'package:parot/const/route/temp_path.dart';

/// '/'는 앞에 붙인다. String 끝에 붙이지 말 것
class ParotPath {
  static const String MAIN = "/";
  static final SignInPath SIGN_IN = SignInPath();
  static final TempPath TEMP = TempPath();
}
