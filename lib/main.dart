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
        useMaterial3: true,
        fontFamily: "Pretendard", //기본 폰트는 Pretendard
      ),
      getPages: ParotPage.pages,
      home: const MainScreen(),
    );
  }
}
