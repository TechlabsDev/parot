import 'package:flutter/material.dart';

import '../../design_component/parrot_color.dart';

class SimpleStartText extends StatefulWidget {
  const SimpleStartText({Key? key}) : super(key: key);

  @override
  State<SimpleStartText> createState() => _SimpleStartTextState();
}

class _SimpleStartTextState extends State<SimpleStartText> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            color: ParrotColor.gray50,
            height: 1,
          ),
        ),
        const SizedBox(width: 10),
        const Text(
          "간편하게 시작하기",
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w500,
            color: ParrotColor.gray200,
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: Container(
            color: ParrotColor.gray50,
            height: 1,
          ),
        ),
      ],
    );
  }
}
