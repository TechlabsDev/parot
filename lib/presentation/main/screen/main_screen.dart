import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:parot/presentation/design_component/one_depth_header.dart';
import 'package:parot/presentation/main/controller/main_controller.dart';

import '../../design_component/parot_scaffold.dart';
import '../../design_component/parot_text_style.dart';
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
          1: Text("핫딜", style: oneDepthHeaderStyle),
          2: Text("커뮤니티", style: oneDepthHeaderStyle),
          3: Text("마이페이지", style: oneDepthHeaderStyle),
        };
        return ParrotScaffold(
          appBar: OneDepthHeader(
            title: headerTitleMap[controller.currentBottomNavIndex.value]!,
            onNotiTap: () {
              print("noti tap");
            },
            onSearchTap: () {
              print("search tap");
            },
          ),
          body: Container(),
          bottomNavigationBar: const BottomNav(),
        );
      },
    );
  }
}
