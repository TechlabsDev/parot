import 'package:parot/const/enum/sign_in_type.dart';
import 'package:parot/const/key/pref_key.dart';
import 'package:streaming_shared_preferences/streaming_shared_preferences.dart';

class SharedPrefManager {
  SharedPrefManager._privateConstructor();
  static final SharedPrefManager _instance = SharedPrefManager._privateConstructor();

  StreamingSharedPreferences? pref;

  Future init() async {
    if (pref != null) {
      return;
    }
    pref = await StreamingSharedPreferences.instance;
  }

  factory SharedPrefManager() {
    return _instance;
  }

  Future<bool> setSignInType(SignInType type) async {
    await init();
    try {
      await pref!.setString(PrefKey.signInType, type.name);
      return true;
    } catch (_) {
      return false;
    }
  }

  Future<SignInType> getSignInType() async {
    await init();
    try {
      String str = pref!.getString(PrefKey.signInType, defaultValue: SignInType.none.name).getValue();
      return SignInType.values.byName(str);
    } catch (_) {
      return SignInType.none;
    }
  }

  Future<Stream?> signInTypeChangeStream() async {
    await init();
    try {
      Preference<String> stream = pref!.getString(PrefKey.signInType, defaultValue: SignInType.none.name);
      return stream;
    } catch (_) {
      return null;
    }
  }

  Future<bool> setAuthToken(String token) async {
    await init();
    try {
      await pref!.setString(PrefKey.authToken, token);
      return true;
    } catch (_) {
      return false;
    }
  }

  Future<String> getAuthToken() async {
    await init();
    try {
      String str = pref!.getString(PrefKey.authToken, defaultValue: "").getValue();
      return str;
    } catch (_) {
      return "";
    }
  }

  Future<Stream?> authTokenChangeStream() async {
    await init();
    try {
      Preference<String> stream = pref!.getString(PrefKey.authToken, defaultValue: "");
      return stream;
    } catch (_) {
      return null;
    }
  }
}
