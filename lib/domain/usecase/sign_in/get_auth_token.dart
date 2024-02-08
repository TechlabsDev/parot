import '../../repository/sign_in_repository.dart';

class GetAuthToken {
  final _repository = SignInRepository();
  Future<String> call() async => await _repository.getAuthToken();
}
