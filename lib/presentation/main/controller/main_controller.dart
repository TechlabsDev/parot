import 'package:get/get.dart';
import 'package:parot/domain/usecase/sign_in/get_sign_in_stream.dart';
import 'package:parot/domain/usecase/sign_in/get_sign_in_type.dart';
import 'package:parot/presentation/main/controller/main_sign_in.dart';

import '../../../const/enum/login_type.dart';

class MainController extends GetxController {
  Rx<SignInType> loginType = SignInType.none.obs;
  Stream? signInStream;
  MainSignIn signIn = MainSignIn();
  @override
  void onInit() async {
    loginType.value = await GetSignInType().call();
    signInStream = await GetSignInStream().call();
    if (signInStream != null) {
      signInStream!.listen((event) {
        event as String;
        loginType.value = SignInType.values.byName(event);
      });
    }
    super.onInit();
  }
}
