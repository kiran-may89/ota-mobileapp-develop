import 'package:ota/models/common/country_codes_response_entity.dart';
import 'package:ota/models/onboard/response/user.dart';

class SessionManager {
  String _guestAuthToken;
  set setAuthToken(value) => _guestAuthToken = value;
  String get getAuthToken => _guestAuthToken;
  String _refreshToken;
  set setRefreshToekn(value) => _refreshToken = value;
  String get getRefreshToken => _refreshToken;
  bool isGuest = true;
  List<CountryCodesResponseResult> _countryCodes;
  User _user;
  set setUser(value) => _user = value;
  User get getUser => _user;
  static SessionManager _instance;
  static SessionManager getInstance() {
    return _instance ??= SessionManager._internal();
  }

  SessionManager._internal();
  set setCountryCodes(List<CountryCodesResponseResult> value) {
    _countryCodes = value;
  }


  List<CountryCodesResponseResult> get getCountryCodes => _countryCodes;
}
