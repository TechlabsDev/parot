import 'package:get/get.dart';
import 'package:parot/const/route/path_base.dart';
import 'package:parot/presentation/intro/screen/intro_screen.dart';
import 'package:parot/presentation/main/screen/main_screen.dart';
import 'package:parot/presentation/sign_up/screen/sign_up_screen.dart';

class ParrotPage {
  static List<GetPage> pages = [
    GetPage(
      name: ParrotPath.MAIN,
      page: () => const MainScreen(),
    ),
    GetPage(
      name: ParrotPath.INTRO,
      transition: Transition.noTransition,
      page: () => const IntroScreen(),
    ),
    GetPage(
      name: ParrotPath.SIGN_UP,
      page: () => const SignUpScreen(),
    ),
  ];
}
