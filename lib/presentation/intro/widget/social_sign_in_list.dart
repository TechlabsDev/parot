import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:parot/presentation/intro/controller/intro_controller.dart';

import '../../../const/enum/sign_in_type.dart';

class SocialSignInList extends StatefulWidget {
  const SocialSignInList({Key? key}) : super(key: key);

  @override
  State<SocialSignInList> createState() => _SocialSignInListState();
}

class _SocialSignInListState extends State<SocialSignInList> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<IntroController>(
        init: Get.put(IntroController()),
        builder: (controller) {
          return Stack(
            clipBehavior: Clip.none,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: SignInType.values
                    .where((element) => element.engName.isNotEmpty) //SignInType.none을 제외
                    .map(
                      (value) => InkWell(
                        onTap: () => controller.signIn(value),
                        child: Image.asset(
                          "asset/social_login/${value.engName}_round.png",
                          width: 60,
                          height: 60,
                        ),
                      ),
                    )
                    .toList(),
              ),
              Positioned(
                top: 65,
                left: controller.getLastSignInBalloonPosition(),
                child: Image.asset(
                  "asset/social_login/last_sign_in_balloon_${controller.lastSignInType.value == SignInType.naver ? "left" : controller.lastSignInType.value == SignInType.apple ? "right" : "center"}.png",
                  width: 145,
                ),
              ),
            ],
          );
        });
  }
}
