import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

import '../../const/key/naver_key.dart';
import '../../const/route/parot_url.dart';

class SignInWithNaverWeb extends StatefulWidget {
  const SignInWithNaverWeb({Key? key}) : super(key: key);

  @override
  State<SignInWithNaverWeb> createState() => _SignInWithNaverWebState();
}

class _SignInWithNaverWebState extends State<SignInWithNaverWeb> {
  String url = "https://nid.naver.com/oauth2.0/authorize?response_type=code&client_id=$naverClientID&redirect_uri=$PAROT_URL&state=1234";
  String callbackUrl =
      "https://nid.naver.com/oauth2.0/token?grant_type=authorization_code&client_id=$naverClientID&client_secret=$naverClientSecret&redirect_uri=$PAROT_URL&code=12345&state=1234";
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        InAppWebView(
          initialUrlRequest: URLRequest(
            url: WebUri.uri(
              Uri.parse(url),
            ),
            headers: {
              'Content-Type': 'text/html;charset=utf-8',
            },
          ),
          onLoadStop: (controller, url) {},
          onReceivedError: (controller, error, url) {
            print(error);
          },
          onReceivedHttpError: (controller, request, response) {
            print(response);
          },
        ),
        Center(child: Material(child: SelectableText(url, style: const TextStyle(fontSize: 15)))),
      ],
    );
  }
}
