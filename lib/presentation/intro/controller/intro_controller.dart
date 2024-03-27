import 'dart:async';
import 'dart:math';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../const/enum/sign_in_type.dart';
import '../../../const/route/path_base.dart';

class IntroController extends GetxController {
  Rx<SignInType> lastSignInType = SignInType.apple.obs;
  @override
  void onInit() {
    print("intro controller init....!");
    Timer.periodic(const Duration(seconds: 2), (timer) {
      lastSignInType.value = SignInType.values[Random().nextInt(4)];
    });
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
    Get.toNamed(ParrotPath.SIGN_UP);
  }

  Future onTapSignInError() async {
    print("onTapSignInError...!");
  }

  //$1 : top, $2 : left
  (double, double) getLastSignInBalloonPosition() {
    if (lastSignInType.value == SignInType.naver) {
      return (60.h + (Get.height < 670 ? 10.h : 0.h), 0.w);
    }
    if (lastSignInType.value == SignInType.kakao) {
      return (60.h + (Get.height < 670 ? 10.h : 0.h), 50.w);
    }
    if (lastSignInType.value == SignInType.google) {
      return (60.h + (Get.height < 670 ? 10.h : 0.h), 140.w);
    }
    if (lastSignInType.value == SignInType.apple) {
      return (60.h + (Get.height < 670 ? 10.h : 0.h), 180.w);
    }
    return (0, 0);
  }
}
