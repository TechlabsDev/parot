import 'package:get/get.dart';

import '../../../const/route/path_base.dart';
import '../../../domain/usecase/sign_in/sign_in_with_kakao.dart';
import '../../../domain/usecase/sign_in/sign_in_with_naver.dart';
import '../../../domain/usecase/sign_in/sign_out.dart';

//로그인, 로그아웃 관련 함수들을 따로 정리한 클래스
class MainSignIn {
  Future handleKakaoSignIn() async {
    await SignInWithKakao().call();
  }

  Future handleNaverSignIn() async {
    if (GetPlatform.isWeb) {
      Get.toNamed(ParrotPath.SIGN_IN.WITH_NAVER_WEB);
    } else {
      await SignInWithNaver().call();
    }
  }

  Future signOut() async {
    await SignOut().call();
  }
}
