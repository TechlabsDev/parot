import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../design_component/parrot_color.dart';

class SignUpFinishPage extends StatefulWidget {
  const SignUpFinishPage({Key? key}) : super(key: key);

  @override
  State<SignUpFinishPage> createState() => _SignUpFinishPageState();
}

class _SignUpFinishPageState extends State<SignUpFinishPage> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 94.h),
          Row(
            children: [
              const Text(
                "From.",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: ParrotColor.gray600,
                ),
              ),
              const SizedBox(width: 4),
              Image.asset("asset/logo/logo2.png", width: 144),
            ],
          ),
          SizedBox(height: 80.h),
          const Text(
            "상품 가격이 변한다는 사실!\n알고계셨나요?\n\n비싸게 사서 속상한 경험\n내가 산 뒤로 가격이 떨어진 경\n\n구매 타이밍을 알려드릴게요!\n패럿패럿 함께 현명한 소비하세요!",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: ParrotColor.gray600,
            ),
          ),
          const SizedBox(height: 32),
          const Row(
            children: [
              Text(
                "To.",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: ParrotColor.gray600,
                ),
              ),
              SizedBox(width: 4),
              Text(
                "패럿패럿 유저님",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  color: ParrotColor.gray800,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
