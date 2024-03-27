import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:parot/presentation/design_component/parrot_color.dart';
import 'package:parot/presentation/design_component/parrot_scaffold.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({Key? key}) : super(key: key);

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  @override
  Widget build(BuildContext context) {
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
          Row(
            children: [],
          ),
        ],
      ),
    );
  }
}
