import '../../data/source/api/kakao_api.dart';
import '../../data/source/api/naver_api.dart';

class SignInRepository {
  final KakaoApi _kakao = KakaoApi();
  final NaverApi _naver = NaverApi();

  Future<bool> signInWithKakao() async => await _kakao.signInWithKakao();
  Future<bool> signInWithNaver() async => await _naver.signInWithNaver();
}
