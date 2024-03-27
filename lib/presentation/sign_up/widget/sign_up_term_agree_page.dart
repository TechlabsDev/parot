import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:parot/presentation/sign_up/controller/sign_up_controller.dart';
import 'package:parot/presentation/sign_up/widget/sign_up_term_agree_list.dart';
import 'package:parot/presentation/sign_up/widget/sign_up_welcome_text.dart';

class SignUpTermAgreePage extends StatefulWidget {
  const SignUpTermAgreePage({Key? key}) : super(key: key);

  @override
  State<SignUpTermAgreePage> createState() => _SignUpTermAgreePageState();
}

class _SignUpTermAgreePageState extends State<SignUpTermAgreePage> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<SignUpController>(builder: (controller) {
      return Column(
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
        ],
      );
    });
  }
}
