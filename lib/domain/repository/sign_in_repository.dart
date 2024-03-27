import 'package:parot/const/enum/sign_in_type.dart';
import 'package:parot/data/source/local/shared_pref_manager.dart';

import '../../data/source/api/kakao_api.dart';
import '../../data/source/api/naver_api.dart';

class SignInRepository {
  final KakaoApi _kakao = KakaoApi();
  final NaverApi _naver = NaverApi();
  final SharedPrefManager _prefManager = SharedPrefManager();

  Future<bool> signInWithKakao() async {
    bool result = await _kakao.signIn();
    if (result) {
      // 로그인 성공 후 처리
      print("카카오 로그인 성공");
      await _prefManager.setSignInType(SignInType.kakao);
      print("카카오 로그인 pref 저장");
    }
    return result;
  }

  Future<bool> signInWithNaver() async {
    bool result = await _naver.signIn();
    if (result) {
      // 로그인 성공 후 처리
      await _prefManager.setSignInType(SignInType.naver);
    }
    return result;
  }

  Future<Stream?> getSignInStream() async {
    return await _prefManager.signInTypeChangeStream();
  }

  Future<SignInType> getSignInType() async {
    return _prefManager.getSignInType();
  }

  Future<bool> signOut() async {
    return await _prefManager.setSignInType(SignInType.none);
  }

  Future<bool> setAuthToken(String token) async {
    return await _prefManager.setAuthToken(token);
  }

  Future<String> getAuthToken() async {
    return await _prefManager.getAuthToken();
  }

  Future<Stream?> getAuthTokenStream() async {
    return await _prefManager.authTokenChangeStream();
  }
}
