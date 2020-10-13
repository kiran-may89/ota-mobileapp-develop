import 'dart:convert';

import 'package:dio/dio.dart';

import 'package:ota/models/common/country_codes_response_entity.dart';
import 'package:ota/models/common/guest_auth_token.dart';
import 'package:ota/models/onboard/response/login_response.dart';
import 'package:ota/models/onboard/response/user.dart';
import 'package:ota/net/service/common/common_service.dart';
import 'package:ota/prefs/session_manager.dart';
import 'package:ota/prefs/shared_prefernce.dart';

class CommonServiceImpl extends CommonService {
  Dio apiConnector;

  final String _GET_COUNTRY_CODES = "common/api/v1/countries";
  static final String GET_GUEST_AUTH_TOKEN = "auth/api/v1/Account/GetGuestTocken";
  static final String REFRESH_TOKEN = "/auth/api/v1/Authenticate/MobileRefreshToken";

  CommonServiceImpl(this.apiConnector);

  @override
  Future<CountryCodesResponseEntity> getCountryCodes() async {
    try {
      Response response = await apiConnector.get(
        _GET_COUNTRY_CODES,
      );

      var data = response.data;

      CountryCodesResponseEntity results = CountryCodesResponseEntity();

      results.fromJson(data);
      SessionManager.getInstance().setCountryCodes = results.result;

      return results;
    } catch (error, stacktrace) {
      CountryCodesResponseEntity results = CountryCodesResponseEntity();

      print(error.toString());
      //results.setException(error: error);

      return results;
    }
  }

  @override
  Future<GuestAuthToken> getGuestToken() async {
    try {
      Response response = await apiConnector.get(GET_GUEST_AUTH_TOKEN);
      var data = response.data;
      GuestAuthToken results = GuestAuthToken.fromJson(data);
      SessionManager.getInstance().setAuthToken = results.result;
      setUser(results.result);
      SessionManager.getInstance().isGuest = true;
      return results;
    } catch (error, stacktrace) {
      GuestAuthToken results = GuestAuthToken();
      if (error is DioError) {}

      return results;
    }
  }

  @override
  Future<void> refreshAccessToken(String value) async {

    try {
      //var token = await   getGuestToken();
      Map<String, dynamic> params = Map();
      params['refreshToken'] = value;
      Response response = await apiConnector.get(REFRESH_TOKEN,queryParameters:params);
      var data = response.data;
      LoginResponse loginResponse = LoginResponse.fromJson(data);
      Pref prefs = Pref.getInstnace();
      prefs.saveAccessToken(loginResponse.result.accesToken);
      prefs.saveRefreshToken(loginResponse.result.refreshToken);
      setUser(loginResponse.result.accesToken);
      SessionManager.getInstance().isGuest = false;
    } catch (e, s) {
      getGuestToken();

    }
  }

  void setUser(String idToken) {
    final List<String> parts = idToken.split('.');
    assert(parts.length == 3);

    var json = jsonDecode(
        utf8.decode(base64Url.decode(base64Url.normalize(parts[1]))));
    User user = User.fromJson(json);
    SessionManager.getInstance().setUser = user;

  }

  @override
  Future<GuestAuthToken> logout() async {
    await Pref.getInstnace().logout();
    return getGuestToken();
  }
}
