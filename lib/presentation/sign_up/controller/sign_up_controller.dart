import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:parot/const/enum/sign_up_step.dart';

import '../../../const/route/path_base.dart';

class SignUpController extends GetxController {
  RxBool privacyCollectAndUseAgree = false.obs; //(필수) 개인정보 수집 및 이용 동의
  RxBool privacyMarketingUseAgree = false.obs; //(선택) 개인정보 마케팅 활용 동의
  RxBool termAgree = false.obs; //(필수) 이용약관 동의
  RxBool allTermAgree = false.obs; //전체 약관 동의
  RxBool requiredTermAgree = false.obs; //필수 약관 동의

  final pageController = PageController();
  Rx<SignUpStep> step = SignUpStep.term.obs;
  @override
  void onInit() {
    super.onInit();
  }

  void setPrivacyCollectAndUseAgree(bool value) {
    privacyCollectAndUseAgree.value = value;
    checkAllAgreed();
  }

  void setPrivacyMarketingUseAgree(bool value) {
    privacyMarketingUseAgree.value = value;
    checkAllAgreed();
  }

  void setTermAgree(bool value) {
    termAgree.value = value;
    checkAllAgreed();
  }

  void setAllTermAgree(v) {
    allTermAgree.value = v;
    privacyCollectAndUseAgree.value = v;
    privacyMarketingUseAgree.value = v;
    termAgree.value = v;
    requiredTermAgree.value = v;
  }

  void checkAllAgreed() {
    if (privacyCollectAndUseAgree.isTrue && termAgree.isTrue) {
      requiredTermAgree.value = true;
    } else {
      requiredTermAgree.value = false;
    }
    if (privacyMarketingUseAgree.isTrue && privacyCollectAndUseAgree.isTrue && termAgree.isTrue) {
      allTermAgree.value = true;
    } else {
      allTermAgree.value = false;
    }
  }

  void onBack() {
    if (step.value == SignUpStep.term) {
      print("go back");
      Get.offAllNamed(ParrotPath.INTRO);
      return;
    }
    if (step.value == SignUpStep.finish) {
      print("go to term");
      step.value = SignUpStep.term;
      pageController.animateToPage(0, duration: const Duration(milliseconds: 150), curve: Curves.easeIn);
      return;
    }
  }
}
