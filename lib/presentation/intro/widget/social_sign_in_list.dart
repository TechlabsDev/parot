import 'package:flutter/material.dart';

import '../../../const/enum/sign_in_type.dart';

class SocialSignInList extends StatefulWidget {
  const SocialSignInList({Key? key}) : super(key: key);

  @override
  State<SocialSignInList> createState() => _SocialSignInListState();
}

class _SocialSignInListState extends State<SocialSignInList> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: SignInType.values
          .where((element) => element.engName.isNotEmpty) //SignInType.none을 제외
          .map(
            (value) => Image.asset(
              "asset/social_login/${value.engName}_round.png",
              width: 60,
              height: 60,
            ),
          )
          .toList(),
    );
  }
}
