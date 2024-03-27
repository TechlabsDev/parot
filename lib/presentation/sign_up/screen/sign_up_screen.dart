import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:parot/const/route/path_base.dart';
import 'package:parot/presentation/design_component/parrot_depth_header.dart';
import 'package:parot/presentation/design_component/parrot_scaffold.dart';
import 'package:parot/presentation/sign_up/controller/sign_up_controller.dart';
import 'package:parot/presentation/sign_up/widget/sign_up_term_agree_page.dart';

import '../../../const/enum/sign_up_step.dart';

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
    return GetX<SignUpController>(
      init: Get.put(SignUpController()),
      builder: (controller) {
        return GestureDetector(
          onHorizontalDragUpdate: (details) {
            print(details.delta.dx);
            if (details.delta.dx > 50) {
              if (controller.step.value == SignUpStep.term) {
                Get.offAllNamed(ParrotPath.INTRO);
              }
            }
          },
          child: ParrotScaffold(
            horizontal16Padding: false,
            appBar: ParrotDepthHeader(
              title: "회원가입",
              actions: [],
              onBackTap: controller.onBack,
              needHeaderBottomBorder: true,
            ),
            // body: controller.step.value == SignUpStep.term ? SignUpTermAgreePage() : Container(),
            body: PageView(
              controller: controller.pageController,
              physics: controller.step.value == SignUpStep.term ? const NeverScrollableScrollPhysics() : const ClampingScrollPhysics(),
              onPageChanged: (index) {
                if (index == 0) {
                  controller.step.value = SignUpStep.term;
                }
                if (index == 1) {
                  controller.step.value = SignUpStep.finish;
                }
              },
              children: [
                const SignUpTermAgreePage(),
                Container(),
              ],
            ),
          ),
        );
      },
    );
  }
}
