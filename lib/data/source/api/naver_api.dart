import 'package:flutter_naver_login/flutter_naver_login.dart';

class NaverApi {
  Future<bool> signInWithNaver() async {
    try {
      // 네이버 로그인
      NaverLoginResult res = await FlutterNaverLogin.logIn();
      return true;
    } catch (e) {
      return false;
    }
  }
}
