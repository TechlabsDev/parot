import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:parot/presentation/design_component/parrot_color.dart';
import 'package:parot/presentation/sign_up/controller/sign_up_controller.dart';

class SignUpCategoryPage extends StatefulWidget {
  const SignUpCategoryPage({Key? key}) : super(key: key);

  @override
  State<SignUpCategoryPage> createState() => _SignUpCategoryPageState();
}

class _SignUpCategoryPageState extends State<SignUpCategoryPage> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<SignUpController>(
        init: Get.put(SignUpController()),
        builder: (controller) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 32.h),
                const Text(
                  "쇼핑할 때 관심이 가\n카테고리 있나요?",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 8),
                const Text(
                  "관심 카테고리에 맞춰 상품을 추천해드릴게요.",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: ParrotColor.gray400,
                  ),
                ),
                SizedBox(height: 32.h),
              ],
            ),
          );
        });
  }
}
