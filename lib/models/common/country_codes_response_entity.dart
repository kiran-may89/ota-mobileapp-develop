import 'package:ota/generated/json/base/json_convert_content.dart';

class CountryCodesResponseEntity with JsonConvert<CountryCodesResponseEntity> {
  String message;
  bool isError;
  List<CountryCodesResponseResult> result;
}

class CountryCodesResponseResult with JsonConvert<CountryCodesResponseResult> {
  int id;
  String uid;
  String name;
  String alpha2Code;
  String alpha3Code;
  String telephoneCode;
  String currencyCode;
  String currencySymbol;
  String flagUrl;
  int latitude;
  int longitude;
  String region;
  String subRegion;
  String timeZone;
  bool isDeleted;
}
