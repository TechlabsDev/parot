import 'package:get/get.dart';
import 'package:parot/data/source/api/api_base.dart';
import 'package:parot/data/source/request/product_detail_request.dart';
import 'package:url_launcher/url_launcher.dart';

class ProductApi {
  final _apiBase = ApiBase();

  //쿠팡에서 받은 상품 데이터를 우리 DB에 저장하는 API.
  //언제나 모든 데이터를 크롤링하고 있을 순 없기 때문에, 사용자가 상품 상세 페이지 진입을 시도할 때 그 상품의 데이터를 우리 DB에 옮긴다.
  Future<Response> insertProductDataToDB({required ProductDetailRequest request}) async {
    return await _apiBase.post(endPoint: "default/submit", body: request.toJson());
  }

  Future openCoupang({required String productId}) async {
    if (GetPlatform.isWeb) {
      await launchUrl(Uri.parse("https://www.coupang.com/vp/products/$productId"));
    } else {
      await launchUrl(Uri.parse("coupang://product?pId=$productId"));
    }
  }
}
