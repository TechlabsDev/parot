import '../../data/source/api/kakao_api.dart';

class SignInRepository {
  final KakaoApi _kakao = KakaoApi();

  Future<bool> signInWithKakao() async => await _kakao.signInWithKakao();
}
