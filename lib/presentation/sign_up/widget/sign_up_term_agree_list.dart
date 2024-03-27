import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:parot/presentation/sign_up/controller/sign_up_controller.dart';

import '../../design_component/parrot_check_circle_in_row.dart';
import '../../design_component/parrot_color.dart';

class SignUpTermAgreeList extends StatefulWidget {
  const SignUpTermAgreeList({Key? key}) : super(key: key);

  @override
  State<SignUpTermAgreeList> createState() => _SignUpTermAgreeListState();
}

class _SignUpTermAgreeListState extends State<SignUpTermAgreeList> {
  @override
  Widget build(BuildContext context) {
    final controller = Get.find<SignUpController>();
    Map<int, String> indexToTextMap = {
      0: "(필수) 이용약관 동의",
      1: "(필수) 개인정보 수집 및 이용 동의",
      2: "(선택) 개인정보 마케팅 활용 동의",
    };
    Map<int, RxBool> indexToRxValue = {
      0: controller.termAgree, //"(필수) 이용약관 동의"
      1: controller.privacyCollectAndUseAgree, //"(필수) 개인정보 수집 및 이용 동의"
      2: controller.privacyMarketingUseAgree, //"(선택) 개인정보 마케팅 활용 동의"
    };
    //항목을 동의/비동의 했을 때
    Map<int, Function(bool)> indexToFunctionMap = {
      0: controller.setTermAgree, //"(필수) 이용약관 동의"
      1: controller.setPrivacyCollectAndUseAgree, //"(필수) 개인정보 수집 및 이용 동의"
      2: controller.setPrivacyMarketingUseAgree, //"(선택) 개인정보 마케팅 활용 동의"
    };
    //[보기] 버튼 눌렀을 때
    Map<int, Function> indexToTrailFunctionMap = {
      0: () {}, //"(필수) 이용약관 동의"
      1: () {}, //"(필수) 개인정보 수집 및 이용 동의"
      2: () {}, //"(선택) 개인정보 마케팅 활용 동의"
    };
    return GetX<SignUpController>(
        init: Get.put(SignUpController()),
        builder: (controller) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 16),
                child: ParrotCheckCircleInRow(
                  value: controller.allTermAgree.value,
                  onChanged: controller.setAllTermAgree,
                  titleText: const Text(
                    "전체 약관 동의",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
              const Divider(color: ParrotColor.gray50, height: 40),
              for (int i = 0; i < 3; i++)
                Padding(
                  padding: EdgeInsets.only(left: 16, bottom: i == 2 ? 0 : 16, top: i == 0 ? 0 : 16, right: 16),
                  child: ParrotCheckCircleInRow(
                    value: indexToRxValue[i]!.value,
                    onChanged: indexToFunctionMap[i]!,
                    titleText: Text(
                      indexToTextMap[i]!,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    trailing: InkWell(
                      onTap: () => indexToTrailFunctionMap[i]!,
                      child: const Text(
                        "보기",
                        style: TextStyle(
                          fontSize: 11,
                          fontWeight: FontWeight.w500,
                          color: ParrotColor.gray300,
                        ),
                      ),
                    ),
                  ),
                ),
            ],
          );
        });
  }
}
