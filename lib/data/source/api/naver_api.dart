import 'package:flutter_naver_login/flutter_naver_login.dart';
import 'package:parot/const/key/naver_key.dart';

class NaverApi {
  Future<bool> signIn() async {
    try {
      await FlutterNaverLogin.initSdk(clientId: naverClientID, clientName: naverClientID, clientSecret: naverClientSecret);

      if (await FlutterNaverLogin.isLoggedIn) {
        //사용자가 다른 네이버 계정을 사용하고 싶을 수도 있으니, 자동 로그인 해제
        await FlutterNaverLogin.logOutAndDeleteToken();
      }
      NaverLoginResult res = await FlutterNaverLogin.logIn();
      return true;
    } catch (e) {
      return false;
    }
  }
}
