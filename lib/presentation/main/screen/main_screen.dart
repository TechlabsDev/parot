import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
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
              titleWidget: headerTitleMap[controller.currentBottomNavIndex.value]!,
              onNotiTap: () {},
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
