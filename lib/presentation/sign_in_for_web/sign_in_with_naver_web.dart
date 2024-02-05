import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

import '../../const/key/naver_key.dart';

class SignInWithNaverWeb extends StatefulWidget {
  const SignInWithNaverWeb({Key? key}) : super(key: key);

  @override
  State<SignInWithNaverWeb> createState() => _SignInWithNaverWebState();
}

class _SignInWithNaverWebState extends State<SignInWithNaverWeb> {
  String url =
      'https://nid.naver.com/oauth2.0/authorize?response_type=code&client_id=$naverClientID&redirect_uri=https://techlabs.co.kr&state=1234';
  @override
  Widget build(BuildContext context) {
    return InAppWebView(
        initialUrlRequest: URLRequest(
      url: WebUri.uri(
        Uri.parse(url),
      ),
    ));
  }
}
