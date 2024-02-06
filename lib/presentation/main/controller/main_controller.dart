import 'package:get/get.dart';
import 'package:parot/domain/usecase/sign_in/get_sign_in_stream.dart';
import 'package:parot/domain/usecase/sign_in/get_sign_in_type.dart';
import 'package:parot/domain/usecase/sign_in/sign_out.dart';

import '../../../const/enum/login_type.dart';
import '../../../const/route/path.dart';
import '../../../domain/usecase/sign_in/sign_in_with_kakao.dart';
import '../../../domain/usecase/sign_in/sign_in_with_naver.dart';

class MainController extends GetxController {
  Rx<SignInType> loginType = SignInType.none.obs;
  Stream? signInStream;
  @override
  void onInit() async {
    loginType.value = await GetSignInType().call();
    signInStream = await GetSignInStream().call();
    if (signInStream != null) {
      signInStream!.listen((event) {
        event as String;
        loginType.value = SignInType.values.byName(event);
      });
    }
    super.onInit();
  }

  Future handleKakaoSignIn() async {
    await SignInWithKakao().call();
  }

  Future handleNaverSignIn() async {
    if (GetPlatform.isWeb) {
      Get.toNamed(ParotPath.SIGN_IN_NAVER_WEB);
    } else {
      await SignInWithNaver().call();
    }
  }

  Future signOut() async {
    await SignOut().call();
  }
}
