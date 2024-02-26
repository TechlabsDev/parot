import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:parot/const/route/page.dart';
import 'package:parot/presentation/main/screen/main_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: '패럿패럿',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        splashColor: Colors.transparent, // 리플 이펙트 제거
        highlightColor: Colors.transparent, // 탭 하이라이트 색상 제거
        useMaterial3: true,
        bottomSheetTheme: const BottomSheetThemeData(
          backgroundColor: Colors.transparent,
          surfaceTintColor: Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.zero,
          ),
        ),
        fontFamily: "Pretendard", //기본 폰트는 Pretendard
      ),
      getPages: ParrotPage.pages,
      home: const MainScreen(),
    );
  }
}
