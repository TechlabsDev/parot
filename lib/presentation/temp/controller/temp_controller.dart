import 'package:get/get.dart';

//아직 디자인이 덜 나왔을 때, 컴포넌트만 개발할 때 임시로 쓸 두번째 화면 컨트롤러
class TempController extends GetxController {
  RxBool switchValue = true.obs;
  RxBool checkCircleValue = true.obs;
  RxBool checkCircleInRowValue = true.obs;
  RxBool checkCircleInRowValue2 = true.obs;
  @override
  void onInit() {
    super.onInit();
  }
}
