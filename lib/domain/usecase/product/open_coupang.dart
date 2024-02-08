import 'package:parot/domain/repository/product_repository.dart';

class OpenCoupang {
  final _repository = ProductRepository();
  Future call({required String productId}) async => await _repository.openCoupang(productId: productId);
}
