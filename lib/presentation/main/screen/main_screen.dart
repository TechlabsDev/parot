import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:parot/presentation/main/controller/main_controller.dart';

import '../../../const/enum/login_type.dart';
import '../../design_component/price_graph.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return GetX<MainController>(
        init: MainController(),
        builder: (controller) {
          return Scaffold(
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const PriceGraph(),
                  const SizedBox(height: 20),
                  controller.loginType.value == SignInType.none
                      ? Column(
                          children: [
                            ElevatedButton(
                              onPressed: controller.handleKakaoSignIn,
                              child: const Text("카카오 로그인"),
                            ),
                            const SizedBox(height: 20),
                            ElevatedButton(
                              onPressed: controller.handleNaverSignIn,
                              child: const Text("네이버 로그인"),
                            ),
                          ],
                        )
                      : Column(
                          children: [
                            Text("${controller.loginType.value.korName}로 로그인 됨"),
                            ElevatedButton(
                              onPressed: controller.signOut,
                              child: const Text("로그아웃"),
                            ),
                          ],
                        ),
                ],
              ),
            ),
          );
        });
  }
}