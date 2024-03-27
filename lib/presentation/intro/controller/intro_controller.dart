import 'package:get/get.dart';

import '../../../const/enum/sign_in_type.dart';

class IntroController extends GetxController {
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
}
