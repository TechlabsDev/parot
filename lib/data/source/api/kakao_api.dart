import 'package:get/utils.dart';
import 'package:kakao_flutter_sdk/kakao_flutter_sdk.dart' as kakaoSdk;
import 'package:parot/const/key/kakao_key.dart';

class KakaoApi {
  Future<bool> signIn() async {
    kakaoSdk.KakaoSdk.init(
      nativeAppKey: kakaoNativeKey,
      javaScriptAppKey: kakaoRestApiKey,
    );
    bool kakaotalkInstalled = await kakaoSdk.isKakaoTalkInstalled();
    if (GetPlatform.isWeb) {
      try {
        if (kakaotalkInstalled) {
          await kakaoSdk.AuthCodeClient.instance.authorizeWithTalk(redirectUri: "https://parot-fe322.web.app");
        } else {
          await kakaoSdk.AuthCodeClient.instance.authorize(redirectUri: "https://parot-fe322.web.app");
        }
        return true;
      } catch (_) {
        return false;
      }
    }
    try {
      if (kakaotalkInstalled) {
        //카카오톡이 설치 된 경우, 카카오톡 앱으로 전환 돼 로그인 진행
        try {
          await kakaoSdk.UserApi.instance.loginWithKakaoTalk();

          ///로그인 성공 후 처리 여기서 함
        } catch (error) {
          return false;
        }
      }
      if (!kakaotalkInstalled) {
        //카카오톡이 설치 되지 않은 경우, 카카오톡 계정 창을 띄워 로그인 진행
        try {
          await kakaoSdk.UserApi.instance.loginWithKakaoAccount();

          ///로그인 성공 후 처리 여기서 함
        } catch (error) {
          return false;
        }
      }
      return true;
    } catch (_) {
      return false;
    }
  }
}
