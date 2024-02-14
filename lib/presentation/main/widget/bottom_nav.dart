import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:parot/presentation/main/controller/main_controller.dart';

import '../../design_component/parot_color.dart';

class BottomNav extends StatefulWidget {
  const BottomNav({Key? key}) : super(key: key);

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  @override
  Widget build(BuildContext context) {
    return GetX<MainController>(
        init: Get.put(MainController()),
        builder: (controller) {
          Map<int, Color> colorMap = {
            0: controller.currentBottomNavIndex.value == 0 ? ParotColor.gray800 : ParotColor.gray200,
            1: controller.currentBottomNavIndex.value == 1 ? ParotColor.gray800 : ParotColor.gray200,
            2: controller.currentBottomNavIndex.value == 2 ? ParotColor.gray800 : ParotColor.gray200,
            3: controller.currentBottomNavIndex.value == 3 ? ParotColor.gray800 : ParotColor.gray200,
          };

          Map<int, Image> iconMap = {
            0: Image.asset("asset/icon/fill_heart.png", height: 24, width: 24, color: colorMap[0]),
            1: Image.asset("asset/icon/fill_hotdeal.png", height: 24, width: 24, color: colorMap[1]),
            2: Image.asset("asset/icon/fill_community.png", height: 24, width: 24, color: colorMap[2]),
            3: Image.asset("asset/icon/fill_mypage.png", height: 24, width: 24, color: colorMap[3]),
          };

          Map<int, String> labelMap = {0: "찜", 1: "핫딜", 2: "커뮤니티", 3: "마이페이지"};

          List<BottomNavigationBarItem> itemList = List.generate(
            4,
            (index) => BottomNavigationBarItem(
              icon: Stack(
                clipBehavior: Clip.none,
                children: [
                  iconMap[index]!,
                  const Positioned(right: -5, top: -5, child: Badge(label: Text("9"), backgroundColor: ParotColor.red500)),
                ],
              ),
              label: labelMap[index],
            ),
          );
          return BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            selectedFontSize: 11,
            unselectedFontSize: 11,
            selectedLabelStyle: const TextStyle(fontWeight: FontWeight.w500),
            unselectedLabelStyle: const TextStyle(fontWeight: FontWeight.w500),
            selectedItemColor: ParotColor.gray800,
            unselectedItemColor: ParotColor.gray200,
            currentIndex: controller.currentBottomNavIndex.value,
            onTap: (selectedIndex) {
              controller.currentBottomNavIndex.value = selectedIndex;
            },
            items: itemList,
          );
        });
  }
}
