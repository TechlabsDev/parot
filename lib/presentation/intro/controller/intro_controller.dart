import 'package:get/get.dart';

import '../../../const/enum/sign_in_type.dart';

class IntroController extends GetxController {
  Rx<SignInType> lastSignInType = SignInType.apple.obs;
  @override
  void onInit() {
    print("intro controller init....!");
    super.onInit();
  }

  Future _signInWithGoogle() async {
    print("sign in with google...!");
  }

  Future _signInWithApple() async {
    print("sign in with apple...!");
  }

  Future _signInWithKakao() async {
    print("sign in with kakao...!");
  }

  Future _signInWithNaver() async {
    print("sign in with naver...!");
  }

  Future signIn(SignInType type) async {
    if (type == SignInType.apple) {
      await _signInWithApple();
    } else if (type == SignInType.google) {
      await _signInWithGoogle();
    } else if (type == SignInType.kakao) {
      await _signInWithKakao();
    } else if (type == SignInType.naver) {
      await _signInWithNaver();
    }
  }

  Future onTapSignInError() async {
    print("onTapSignInError...!");
  }

  double getLastSignInBalloonPosition() {
    if (lastSignInType.value == SignInType.naver) {
      return 0;
    }
    if (lastSignInType.value == SignInType.kakao) {
      return 50;
    }
    if (lastSignInType.value == SignInType.google) {
      return 140;
    }
    if (lastSignInType.value == SignInType.apple) {
      return 180;
    }
    return 0;
  }
}
