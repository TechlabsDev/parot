import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:parot/presentation/design_component/parot_color.dart';
import 'package:parot/presentation/main/controller/main_controller.dart';

import '../../design_component/parot_scaffold.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int bottomNavIndex = 0;
  @override
  Widget build(BuildContext context) {
    return GetBuilder<MainController>(
      init: Get.put(MainController()),
      builder: (controller) {
        return ParrotScaffold(
          body: Container(),
          bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            selectedFontSize: 11,
            unselectedFontSize: 11,
            selectedLabelStyle: const TextStyle(fontWeight: FontWeight.w500),
            unselectedLabelStyle: const TextStyle(fontWeight: FontWeight.w500),
            selectedItemColor: ParotColor.gray800,
            unselectedItemColor: ParotColor.gray200,
            currentIndex: bottomNavIndex,
            onTap: (selectedIndex) {
              setState(() {
                bottomNavIndex = selectedIndex;
              });
            },
            items: [
              BottomNavigationBarItem(
                icon: Image.asset(
                  "asset/icon/fill_heart.png",
                  height: 24,
                  width: 24,
                  color: bottomNavIndex == 0 ? ParotColor.gray800 : ParotColor.gray200,
                ),
                label: "찜",
              ),
              BottomNavigationBarItem(
                icon: Image.asset(
                  "asset/icon/fill_hotdeal.png",
                  height: 24,
                  width: 24,
                  color: bottomNavIndex == 1 ? ParotColor.gray800 : ParotColor.gray200,
                ),
                label: "핫딜",
              ),
              BottomNavigationBarItem(
                icon: Image.asset(
                  "asset/icon/fill_community.png",
                  height: 24,
                  width: 24,
                  color: bottomNavIndex == 2 ? ParotColor.gray800 : ParotColor.gray200,
                ),
                label: "커뮤니티",
              ),
              BottomNavigationBarItem(
                icon: Image.asset(
                  "asset/icon/fill_mypage.png",
                  height: 24,
                  width: 24,
                  color: bottomNavIndex == 3 ? ParotColor.gray800 : ParotColor.gray200,
                ),
                label: "마이페이지",
              ),
            ],
          ),
        );
      },
    );
  }
}
