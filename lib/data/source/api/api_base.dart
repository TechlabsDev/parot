import 'package:get/get.dart';
import 'package:parot/domain/usecase/sign_in/get_auth_token.dart';

class ApiBase {
  ApiBase._privateConstructor();
  static final ApiBase _instance = ApiBase._privateConstructor();
  final _httpClient = GetHttpClient();
  final String _baseUrl = "https://5jt2c5z6xc.execute-api.ap-northeast-2.amazonaws.com/";

  factory ApiBase() {
    return _instance;
  }

  void _setBaseUrl({String? otherBaseUrl}) {
    if (otherBaseUrl == null) {
      _httpClient.baseUrl = _baseUrl;
    } else {
      _httpClient.baseUrl = otherBaseUrl;
    }
  }

  Future<Map<String, String>> _createHeader() async {
    String authToken = await GetAuthToken().call();
    return {"authorization": "Bearer $authToken"};
  }

  Future<Response> post({required String endPoint, required Map<String, dynamic> body, String? otherBaseUrl}) async {
    _setBaseUrl(otherBaseUrl: otherBaseUrl);
    return await _httpClient.post(endPoint, body: body, headers: await _createHeader());
  }

  Future<Response> get({required String endPoint, Map<String, String>? query, String? otherBaseUrl}) async {
    _setBaseUrl(otherBaseUrl: otherBaseUrl);
    return await _httpClient.get(endPoint, query: query, headers: await _createHeader());
  }
}
