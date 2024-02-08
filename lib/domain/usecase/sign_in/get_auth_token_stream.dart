import 'package:parot/domain/repository/sign_in_repository.dart';

class GetAuthTokenStream {
  final _repository = SignInRepository();
  Future<Stream?> call() async => await _repository.getAuthTokenStream();
}
