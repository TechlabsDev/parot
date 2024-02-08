import 'package:get/get.dart';

class ApiBase {
  ApiBase._privateConstructor();
  static final ApiBase _instance = ApiBase._privateConstructor();
  final _httpClient = GetHttpClient();
  final String _baseUrl = "https://5jt2c5z6xc.execute-api.ap-northeast-2.amazonaws.com";

  factory ApiBase() {
    return _instance;
  }

  Future<Response> post({required String endPoint, required Map<String, dynamic> body, String? otherBaseUrl}) async {
    String url = "";
    if (otherBaseUrl != null) {
      url = "$otherBaseUrl/$endPoint";
    } else {
      url = "$_baseUrl/$endPoint";
    }
    return await _httpClient.post(url, body: body);
  }

  Future<Response> get({required String endPoint, Map<String, String>? query, String? otherBaseUrl}) async {
    String url = "";
    if (otherBaseUrl != null) {
      url = "$otherBaseUrl/$endPoint";
    } else {
      url = "$_baseUrl/$endPoint";
    }
    return await _httpClient.get(url, query: query);
  }
}
