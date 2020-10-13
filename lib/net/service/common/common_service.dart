import 'package:ota/models/common/country_codes_response_entity.dart';
import 'package:ota/models/common/guest_auth_token.dart';

abstract class CommonService {
  Future<CountryCodesResponseEntity> getCountryCodes();
  Future<GuestAuthToken> getGuestToken();
  Future<void> refreshAccessToken(String value);
  Future<GuestAuthToken> logout();
}
