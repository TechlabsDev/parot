import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:parot/presentation/sign_up/controller/sign_up_controller.dart';

import '../../../const/enum/sign_up_step.dart';
import '../../design_component/parrot_color.dart';
import '../../design_component/parrot_elavated_button.dart';

class SignUpBottomButton extends StatefulWidget {
  const SignUpBottomButton({Key? key}) : super(key: key);

  @override
  State<SignUpBottomButton> createState() => _SignUpBottomButtonState();
}

class _SignUpBottomButtonState extends State<SignUpBottomButton> {
  @override
  Widget build(BuildContext context) {
    return GetX<SignUpController>(builder: (controller) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: ParrotElevatedButton(
          enabled: controller.step.value == SignUpStep.term
              ? controller.requiredTermAgree.isTrue
              : controller.step.value == SignUpStep.selectCategory
                  ? controller.selectedCategory.isNotEmpty
                  : controller.step.value == SignUpStep.finish
                      ? true
                      : false,
          onPressed: () {
            int nextIndex = controller.pageController.page!.toInt() + 1;
            controller.pageController.animateToPage(nextIndex, duration: const Duration(milliseconds: 150), curve: Curves.easeIn);
          },
          backgroundColor: ParrotColor.red500,
          borderColor: ParrotColor.red500,
          text: controller.step.value == SignUpStep.term
              ? "다음"
              : controller.step.value == SignUpStep.selectCategory
                  ? "회원가입"
                  : controller.step.value == SignUpStep.finish
                      ? "시작하기"
                      : "",
          size: const Size(double.maxFinite, 52),
        ),
      );
    });
  }
}
