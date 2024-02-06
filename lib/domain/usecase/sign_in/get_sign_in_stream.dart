import 'package:parot/domain/repository/sign_in_repository.dart';

class GetSignInStream {
  final _repository = SignInRepository();

  Future<Stream?> call() async => await _repository.getSignInStream();
}
