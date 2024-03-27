import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:parot/presentation/design_component/parrot_color.dart';
import 'package:parot/presentation/design_component/parrot_depth_header.dart';
import 'package:parot/presentation/design_component/parrot_scaffold.dart';
import 'package:parot/presentation/sign_up/controller/sign_up_controller.dart';
import 'package:styled_text/styled_text.dart';

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
          appBar: ParrotDepthHeader(
            title: "회원가입",
            actions: [],
            needHeaderBottomBorder: true,
          ),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 32.h),
              Image.asset("asset/logo/logo2.png", width: 144),
              SizedBox(height: 32.h),
              StyledText(
                text: "안녕하세요, 패럿<r>패럿</r>입니다",
                tags: {
                  "r": StyledTextTag(
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                      color: ParrotColor.red500,
                    ),
                  ),
                },
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  color: ParrotColor.gray800,
                ),
              ),
              const SizedBox(height: 4),
              const Text(
                "좀 더 정확한 가격 정보 제공을 위해\n약관 동의가 필요합니다.",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: ParrotColor.gray400,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
