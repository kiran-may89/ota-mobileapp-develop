import 'package:shared_preferences/shared_preferences.dart';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:ota/prefs/session_manager.dart';

class Pref {
  final String FCM_TOKEN = "FCM_TOKEN";
  static final String _USERNAME = "USER_NAME";
  static final String HEADERS = "HEADERS";
  FlutterSecureStorage _secureStorage;
  Future<SharedPreferences> _prefs;
  final String _accessToken = "access_token";
  final String _refreshToken = "refresh_token";

  Pref._privateConstrutor() {
    _prefs = SharedPreferences.getInstance();
    _secureStorage = FlutterSecureStorage();
  }
  Pref();

  static Pref _instance;

  static Pref getInstnace() {
    if (_instance == null) {
      _instance = Pref._privateConstrutor();
    }

    return _instance;
  }

  void saveHeader(String token) async {
    final SharedPreferences prefs = await _prefs;
    prefs.setString(HEADERS, token);
  }

  Future<String> getHeaders(String headers) async {
    final SharedPreferences prefs = await _prefs;
    prefs.getString(HEADERS);
  }

  void saveAccessToken(String value) {
    _secureStorage.write(key: _accessToken, value: value);
    SessionManager.getInstance().setAuthToken = value;
  }

  Future<String> getAccessToken() async {
    String acesstoken = await _secureStorage.read(key: _accessToken);
    return acesstoken;
  }

  void saveRefreshToken(String value) {
    if (value != null && value.isNotEmpty) {
      SessionManager.getInstance().setRefreshToekn = value;
      _secureStorage.write(key: _refreshToken, value: value);
    }
  }

  Future<String> getRefreshToken() {
    return _secureStorage.read(key: _refreshToken);
  }



  void saveData(String key, String value) async{
    final SharedPreferences prefs = await _prefs;
    prefs.setString(key, value);

  }

  Future<String>  getData(String key) async{
    final SharedPreferences prefs = await _prefs;
    return  prefs.getString(key);

  }


  Future<void> logout() async {
    SessionManager.getInstance().isGuest = true;
    await _secureStorage.delete(key: _accessToken);
    await _secureStorage.delete(key: _refreshToken);
  }
}
