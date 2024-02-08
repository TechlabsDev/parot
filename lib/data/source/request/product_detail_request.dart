class ProductDetailRequest {
  final String productId;
  final String itemId;

  ProductDetailRequest({required this.productId, required this.itemId});
  ProductDetailRequest.fromJson(Map<String, dynamic> json)
      : productId = json['productId'],
        itemId = json['itemId'];
  Map<String, String> toJson() {
    return {
      'productId': productId,
      'itemId': itemId,
    };
  }
}
