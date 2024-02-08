import '../../repository/sign_in_repository.dart';

class SetAuthToken {
  final _repository = SignInRepository();
  Future<bool> call(String token) async => await _repository.setAuthToken(token);
}
