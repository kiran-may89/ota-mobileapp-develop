import 'dart:async';
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:ota/crypto/crypto_helper.dart';
import 'package:ota/models/crypto/raw_crypto.dart';
import 'package:ota/net/service/common/common_service_impl.dart';
import 'package:ota/net/service/onboarding/onboard_repo.dart';
import 'package:ota/prefs/session_manager.dart';
import 'package:ota/prefs/shared_prefernce.dart';
import 'package:ota/utils/constants.dart';

class NetworkInterceptor extends InterceptorsWrapper {
  NetworkInterceptor({InterceptorErrorCallback onError})
      : super(onError: onError);

  @override
  Future onRequest(RequestOptions options) {
    if(options.path == CommonServiceImpl.REFRESH_TOKEN){
      return super.onRequest(options);
    }
    SessionManager sessionManager = SessionManager.getInstance();
    String authHeader = options.headers["Authorization"];
    String apiKey = options.headers[Constants.OTA_API_KEY];
    String platform = options.headers[Constants.OTA_PLAT_FORM];
    String timeStamp = options.headers[Constants.X_OTA_TIMESTAMP];

    if (timeStamp == null) {
      timeStamp = (DateTime.now().millisecondsSinceEpoch ~/ Duration.millisecondsPerSecond).toString();
      options.headers.addAll({
        Constants.X_OTA_TIMESTAMP: timeStamp
      });
    } else {
      options.headers[Constants.X_OTA_TIMESTAMP] =
          (DateTime.now().millisecondsSinceEpoch ~/ Duration.millisecondsPerSecond).toString();
    }

    if (apiKey == null) {
      options.headers.addAll(
          {Constants.OTA_API_KEY: "3fa85f64-5717-4562-b3fc-2c963f66afa6"});
    }
    if (platform == null) {
      options.headers.addAll({Constants.OTA_PLAT_FORM: "MOBILE"});
    }

    if (options.path != CommonServiceImpl.GET_GUEST_AUTH_TOKEN &&sessionManager.getAuthToken != null &&
        sessionManager.getAuthToken.isNotEmpty &&
        authHeader == null) {
      options.headers
          .addAll({"Authorization": "Bearer ${sessionManager.getAuthToken}"});
    }

    if (options.path != CommonServiceImpl.GET_GUEST_AUTH_TOKEN &&
        options.method != "GET" &&
        options.data != null) {
      var jsonencoder = JsonEncoder();

      var data = doEncrypt(
          options.data.toString(),
          SessionManager.getInstance().getAuthToken,timeStamp);
      options.contentType = "text/plain";
      options.responseType = ResponseType.plain;
      options.data = data;
    }
    return super.onRequest(options);
  }

  @override
  Future onResponse(Response response) {
    if(response.request.path == CommonServiceImpl.REFRESH_TOKEN){
      return super.onResponse(response);
    }

    if (response.request.path != CommonServiceImpl.GET_GUEST_AUTH_TOKEN ) {
      try {
        var encryptedData;

        try {
          encryptedData = rawCryptoFromJson(response
          .data);
        } catch (e) {
          print(e);
        }

        var timeStamp = response.headers[Constants.X_OTA_TIMESTAMP];
        var accessToken = SessionManager
        .getInstance()
        .getAuthToken;


        var decrypted =
        doDecrypt(encryptedData
        .result, accessToken, timeStamp[0]
        .toString());
        response.data = jsonDecode(decrypted);
      }catch(e){
        print(e);
      }



    }

    return super.onResponse(response);
  }


}
