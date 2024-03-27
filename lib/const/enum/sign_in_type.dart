enum SignInType {
  kakao("카카오", "kakao"),
  naver("네이버", "naver"),
  google("구글", "google"),
  apple("애플", "apple"),
  none("", "");

  final String korName;
  final String engName;

  const SignInType(this.korName, this.engName);
}
