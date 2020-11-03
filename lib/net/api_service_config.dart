import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';
import 'package:ota/crypto/crypto_helper.dart';
import 'package:ota/models/crypto/raw_crypto.dart';
import 'package:ota/net/logging_interceptor.dart';
import 'package:ota/net/network_interceptor.dart';
import 'package:ota/net/service/common/common_service.dart';
import 'package:ota/net/service/common/common_service_impl.dart';
import 'package:ota/prefs/session_manager.dart';
import 'package:ota/productflavors/flavor_package.dart';
import 'package:ota/utils/constants.dart';

import 'connectivity_retry.dart';

class ApiServiceConfig {
  static ApiServiceConfig _instance;
  Dio _dio;
  Dio get dio => _dio;

  static ApiServiceConfig get instance {
    _instance ??= ApiServiceConfig._internal();

    return _instance;
  }

  Dio createDio() {
    var dio = Dio(BaseOptions(connectTimeout: 1000000, receiveTimeout: 1000000, baseUrl: FlavourConfig.instance.values.baseUrl));

    return addInterceptors(dio)..interceptors.add(LoggingInterceptor());
  }

  ApiServiceConfig._internal() {
    _dio = createDio();
  }

  Dio addInterceptors(Dio dio) {
    return dio
      ..interceptors.add(
        NetworkInterceptor(onError: (error) async {
          print("StatusCode${error.response.statusCode.toString()}");

          print("Error${error.message}");

          if (error.response?.statusCode == 403 || error.response?.statusCode == 401) {
            CommonService commonService = GetIt.instance<CommonService>();
            String refrestoken = SessionManager.getInstance().getRefreshToken;
            await commonService.refreshAccessToken(refrestoken);
            return _retry(error.request);
          }else{
            if (error.request.path != CommonServiceImpl.REFRESH_TOKEN && error.request.path != CommonServiceImpl.GET_GUEST_AUTH_TOKEN && error.response.data != null) {
              var encryptedData = rawCryptoFromJson(error.response.data);

              var timeStamp = error.response.headers[Constants.X_OTA_TIMESTAMP];
              var accessToken = SessionManager.getInstance().getAuthToken;
              var decrypted =
              doDecrypt(encryptedData.result, accessToken, timeStamp[0].toString());
              error.response.data = jsonDecode(decrypted);
            }

          }
          return error.response;
        }),
      );
  }

  Future<Response<dynamic>> _retry(RequestOptions requestOptions) async {
    final options = new Options(
      method: requestOptions.method,
      headers: requestOptions.headers,
    );
    return this
        ._dio
        .request<dynamic>(requestOptions.path, data: requestOptions.data, queryParameters: requestOptions.queryParameters, options: options);
  }
}

class RetryOnConnectionChangeInterceptor extends Interceptor {
  final DioConnectivityRequestRetrier requestRetrier;

  RetryOnConnectionChangeInterceptor({
    @required this.requestRetrier,
  });

  @override
  Future onError(DioError err) async {
    if (_shouldRetry(err)) {
      try {
        return requestRetrier.scheduleRequestRetry(err.request);
      } catch (e) {
        return e;
      }
    }

    return err;
  }

  bool _shouldRetry(DioError err) {
    return err.type == DioErrorType.DEFAULT && err.error != null && err.error is SocketException;
  }
}
