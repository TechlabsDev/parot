import 'package:flutter/material.dart';
import 'package:styled_text/tags/styled_text_tag.dart';
import 'package:styled_text/widgets/styled_text.dart';

import '../../design_component/parrot_color.dart';

class SignUpWelcomeText extends StatefulWidget {
  const SignUpWelcomeText({Key? key}) : super(key: key);

  @override
  State<SignUpWelcomeText> createState() => _SignUpWelcomeTextState();
}

class _SignUpWelcomeTextState extends State<SignUpWelcomeText> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
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
    );
  }
}
