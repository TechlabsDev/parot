import 'package:get/get.dart';
import 'package:parot/const/route/path.dart';
import 'package:parot/presentation/main/screen/main_screen.dart';
import 'package:parot/presentation/sign_in_for_web/sign_in_with_kakao_web.dart';
import 'package:parot/presentation/sign_in_for_web/sign_in_with_naver_web.dart';

class ParotPage {
  static List<GetPage> pages = [
    GetPage(
      name: ParotPath.MAIN,
      page: () => const MainScreen(),
    ),
    GetPage(
      name: ParotPath.SIGN_IN_KAKAO_WEB,
      page: () => const SignInWithKakaoWeb(),
    ),
    GetPage(
      name: ParotPath.SIGN_IN_NAVER_WEB,
      page: () => const SignInWithNaverWeb(),
      transition: Transition.fadeIn,
    ),
  ];
}
