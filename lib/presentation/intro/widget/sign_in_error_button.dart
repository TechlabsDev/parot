import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:parot/presentation/intro/controller/intro_controller.dart';

import '../../design_component/parrot_color.dart';

class SignInErrorButton extends StatefulWidget {
  const SignInErrorButton({Key? key}) : super(key: key);

  @override
  State<SignInErrorButton> createState() => _SignInErrorButtonState();
}

class _SignInErrorButtonState extends State<SignInErrorButton> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<IntroController>(
        init: Get.put(IntroController()),
        builder: (controller) {
          return ElevatedButton(
            style: ButtonStyle(
              splashFactory: NoSplash.splashFactory,
              elevation: MaterialStateProperty.all<double>(0),
              backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20), //피그마 수치엔 17로 나와있는데, 17을 사용하면 디자인과 다르게 각지게 나온다. 20을 해야 디자인과 똑같이 나온다.
                  side: const BorderSide(color: ParrotColor.gray200),
                ),
              ),
            ),
            onPressed: controller.onTapSignInError,
            child: const Text(
              "로그인에 문제가 있으신가요?",
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: ParrotColor.gray200,
              ),
            ),
          );
        });
  }
}
