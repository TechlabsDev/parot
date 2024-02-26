import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:parot/const/route/path_base.dart';
import 'package:parot/presentation/design_component/parrot_elavated_button.dart';
import 'package:parot/presentation/design_component/parrot_header.dart';
import 'package:parot/presentation/main/controller/main_controller.dart';

import '../../design_component/parrot_scaffold.dart';
import '../../design_component/parrot_text_style.dart';
import '../widget/bottom_nav_widget/bottom_nav.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int bottomNavIndex = 0;
  @override
  Widget build(BuildContext context) {
    return GetX<MainController>(
        init: Get.put(MainController()),
        builder: (controller) {
          Map<int, Widget> headerTitleMap = {
            0: Image.asset("asset/logo/logo.png", width: 144, height: 32),
            1: Text("핫딜", style: parrotHeaderStyle),
            2: Text("커뮤니티", style: parrotHeaderStyle),
            3: Text("마이페이지", style: parrotHeaderStyle),
          };
          return ParrotScaffold(
            appBar: ParrotHeader(
              title: headerTitleMap[controller.currentBottomNavIndex.value]!,
              onNotiTap: () => Get.toNamed(ParrotPath.TEMP.SWITCH_TEMP_PATH),
              onSearchTap: () => Get.toNamed(ParrotPath.TEMP.SEARCH_TEMP_PATH),
            ),
            body: Center(
              child: ParrotElevatedButton(
                enabled: true,
                leadingIcon: Image.asset("asset/icon/stroke_refresh.png", width: 16, height: 16, color: Colors.white),
                trailingIcon: Image.asset("asset/icon/stroke_next.png", width: 16, height: 16, color: Colors.white),
                onPressed: () => showPopup(content: "필터 적용하기 버튼 터치"),
                textColor: Colors.white,
                text: "필터 적용하기",
              ),
            ),
            bottomNavigationBar: const BottomNav(),
          );
        });
  }

  void showPopup({required String content}) {
    Get.dialog(
      CupertinoAlertDialog(
        title: const Text("알림"),
        content: Text(content),
        actions: [
          CupertinoDialogAction(
            child: const Text("확인"),
            onPressed: () {
              Get.back();
            },
          ),
        ],
      ),
    );
  }
}
