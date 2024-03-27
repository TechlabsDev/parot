import 'package:get/get.dart';

class SignUpController extends GetxController {
  RxBool privacyCollectAndUseAgree = false.obs; //(필수) 개인정보 수집 및 이용 동의
  RxBool privacyMarketingUseAgree = false.obs; //(선택) 개인정보 마케팅 활용 동의
  RxBool termAgree = false.obs; //(필수) 이용약관 동의
  RxBool allTermAgree = false.obs; //전체 약관 동의
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
  }

  void checkAllAgreed() {
    if (privacyMarketingUseAgree.isTrue && privacyCollectAndUseAgree.isTrue && termAgree.isTrue) {
      allTermAgree.value = true;
    } else {
      allTermAgree.value = false;
    }
  }
}
