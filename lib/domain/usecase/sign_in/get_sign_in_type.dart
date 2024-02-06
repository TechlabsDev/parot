import 'package:parot/domain/repository/sign_in_repository.dart';

import '../../../const/enum/login_type.dart';

class GetSignInType {
  final _repository = SignInRepository();

  Future<SignInType> call() async => await _repository.getSignInType();
}
