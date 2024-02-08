import 'package:get/get_connect/http/src/response/response.dart';
import 'package:parot/data/source/request/product_detail_request.dart';

import '../../repository/product_repository.dart';

class InsertProductDataToDB {
  final _repository = ProductRepository();
  Future<Response> call({required ProductDetailRequest request}) async => await _repository.insertProductDataToDB(request: request);
}
