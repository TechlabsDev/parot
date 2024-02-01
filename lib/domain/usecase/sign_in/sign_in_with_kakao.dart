import 'package:parot/domain/repository/sign_in_repository.dart';

class SignInWithKakao {
  final _repository = SignInRepository();
  Future<bool> call() async => await _repository.signInWithKakao();
}
