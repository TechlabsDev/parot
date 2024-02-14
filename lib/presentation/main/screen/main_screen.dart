import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:parot/presentation/main/controller/main_controller.dart';

import '../../design_component/parot_scaffold.dart';
import '../widget/bottom_nav.dart';

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
          bottomNavigationBar: const BottomNav(),
        );
      },
    );
  }
}
