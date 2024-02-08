import 'package:get/get.dart';

import '../../data/source/api/product_api.dart';
import '../../data/source/request/product_detail_request.dart';

class ProductRepository {
  final _productApi = ProductApi();

  Future<Response> insertProductDataToDB({required ProductDetailRequest request}) async {
    return await _productApi.insertProductDataToDB(request: request);
  }

  Future openCoupang({required String productId}) async {
    await _productApi.openCoupang(productId: productId);
  }
}
