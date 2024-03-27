import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:parot/presentation/design_component/parrot_color.dart';
import 'package:parot/presentation/design_component/parrot_scaffold.dart';
import 'package:parot/presentation/intro/controller/intro_controller.dart';
import 'package:parot/presentation/intro/widget/social_sign_in_list.dart';

import '../widget/sign_in_error_button.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({Key? key}) : super(key: key);

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<IntroController>(
      init: Get.put(IntroController()),
      builder: (controller) {
        return ParrotScaffold(
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 108.h,
              ),
              Image.asset("asset/logo/logo2.png", width: 201, height: 40),
              const SizedBox(height: 16),
              const Text(
                "최저가 정보 받고\n현명한 소비를 시작하세요!",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: ParrotColor.gray400,
                ),
              ),
              const Spacer(),
              const Center(
                child: Text(
                  "간편하게 시작하기",
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: ParrotColor.gray200,
                  ),
                ),
              ),
              const SizedBox(height: 24),
              const Padding(
                padding: EdgeInsets.only(left: 8), //parrot_scaffold가 가진 좌측 기본 패딩 16에 8을 더해서 24를 만든다.
                child: SocialSignInList(),
              ),
              SizedBox(height: 80.h),
              const Center(
                child: SignInErrorButton(),
              ),
            ],
          ),
        );
      },
    );
  }
}
