import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:parot/const/route/path_base.dart';
import 'package:parot/presentation/design_component/parrot_depth_header.dart';
import 'package:parot/presentation/design_component/parrot_scaffold.dart';
import 'package:parot/presentation/sign_up/controller/sign_up_controller.dart';
import 'package:parot/presentation/sign_up/widget/sign_up_bottom_button.dart';
import 'package:parot/presentation/sign_up/widget/sign_up_category_page.dart';
import 'package:parot/presentation/sign_up/widget/sign_up_term_agree_page.dart';

import '../../../const/enum/sign_up_step.dart';
import '../widget/sign_up_finish_page.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SignUpController>(
      init: Get.put(SignUpController()),
      builder: (controller) {
        return GestureDetector(
          onHorizontalDragUpdate: (details) {
            print(details.delta.dx);

            if (details.delta.dx > 50) {
              //스와이프로 뒤로가기
              if (controller.step.value == SignUpStep.term) {
                Get.offAllNamed(ParrotPath.INTRO);
                return;
              }
              int prevIndex = controller.pageController.page!.toInt() - 1;
              controller.pageController.animateToPage(prevIndex, duration: const Duration(milliseconds: 150), curve: Curves.easeIn);
            }
          },
          child: ParrotScaffold(
            horizontal16Padding: false,
            bottomSheet: const SignUpBottomButton(),
            appBar: ParrotDepthHeader(
              title: "회원가입",
              actions: [],
              onBackTap: controller.onBack,
              needHeaderBottomBorder: true,
            ),
            body: Column(
              children: [
                Expanded(
                  child: PageView(
                    controller: controller.pageController,
                    physics: const NeverScrollableScrollPhysics(),
                    onPageChanged: (index) {
                      if (index == 0) {
                        controller.step.value = SignUpStep.term;
                      }
                      if (index == 1) {
                        controller.step.value = SignUpStep.selectCategory;
                      }
                      if (index == 2) {
                        controller.step.value = SignUpStep.finish;
                      }
                    },
                    children: const [
                      SignUpTermAgreePage(),
                      SignUpCategoryPage(),
                      SignUpFinishPage(),
                    ],
                  ),
                ),
                const SizedBox(height: 80),
              ],
            ),
          ),
        );
      },
    );
  }
}
