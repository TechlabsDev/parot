import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:parot/presentation/design_component/parrot_color.dart';
import 'package:parot/presentation/design_component/parrot_depth_header.dart';
import 'package:parot/presentation/design_component/parrot_elavated_button.dart';
import 'package:parot/presentation/design_component/parrot_scaffold.dart';
import 'package:parot/presentation/sign_up/controller/sign_up_controller.dart';
import 'package:parot/presentation/sign_up/widget/sign_up_term_agree_list.dart';
import 'package:parot/presentation/sign_up/widget/sign_up_welcome_text.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<SignUpController>(
      init: Get.put(SignUpController()),
      builder: (controller) {
        return ParrotScaffold(
          horizontal16Padding: false,
          appBar: ParrotDepthHeader(
            title: "회원가입",
            actions: [],
            needHeaderBottomBorder: true,
          ),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 32.h),
              Padding(
                padding: const EdgeInsets.only(left: 16),
                child: Image.asset("asset/logo/logo2.png", width: 144),
              ),
              SizedBox(height: 32.h),
              const Padding(
                padding: EdgeInsets.only(left: 16),
                child: SignUpWelcomeText(),
              ),
              const Spacer(),
              const SignUpTermAgreeList(),
              SizedBox(height: 32.h),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: ParrotElevatedButton(
                  onPressed: () {},
                  backgroundColor: ParrotColor.red500,
                  borderColor: ParrotColor.red500,
                  text: "회원가입",
                  size: const Size(double.maxFinite, 52),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
