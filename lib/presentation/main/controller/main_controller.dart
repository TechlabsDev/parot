import 'package:get/get.dart';

import '../../../const/enum/login_type.dart';
import '../../../const/route/path.dart';
import '../../../domain/usecase/sign_in/sign_in_with_kakao.dart';
import '../../../domain/usecase/sign_in/sign_in_with_naver.dart';

class MainController extends GetxController {
  Rx<LoginType> loginType = LoginType.none.obs;
  @override
  void onInit() {
    super.onInit();
  }

  Future handleKakaoSignIn() async {
    bool result = await SignInWithKakao().call();
    if (result) {
      loginType.value = LoginType.kakao;
    }
  }

  Future handleNaverSignIn() async {
    if (GetPlatform.isWeb) {
      Get.toNamed(ParotPath.SIGN_IN_NAVER_WEB);
    } else {
      bool result = await SignInWithNaver().call();
      if (result) {
        loginType.value = LoginType.naver;
      }
    }
  }

  Future signOut() async {
    loginType.value = LoginType.none;
  }
}
