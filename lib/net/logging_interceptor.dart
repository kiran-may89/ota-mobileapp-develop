import 'package:dio/dio.dart';

class LoggingInterceptor extends Interceptor{

int _maxCharactersPerLine = 500;

@override
Future onRequest(RequestOptions options) {
  print("--> ${options.method} ${options.path}");
  print("Content type: ${options.contentType}");
  print("Headers: ${options.headers}");
  print("Request Url: ${options.uri.toString()}");
  print("Request Url: ${options.data.toString()}");
  print("<-- END HTTP");
  return super.onRequest(options);
}

@override
Future onResponse(Response response) {
  print(
      "<-- ${response.statusCode} ${response.request.method} ${response.request.path}");
  String responseAsString = response.data.toString();
  if (responseAsString.length > _maxCharactersPerLine) {
    int iterations =
    (responseAsString.length / _maxCharactersPerLine).floor();
    for (int i = 0; i <= iterations; i++) {
      int endingIndex = i * _maxCharactersPerLine + _maxCharactersPerLine;
      if (endingIndex > responseAsString.length) {
        endingIndex = responseAsString.length;
      }
      print(responseAsString.substring(
          i * _maxCharactersPerLine, endingIndex));
    }
  } else {
    print(response.data);
  }
  print("<-- END HTTP");

  return super.onResponse(response);
 // 5b80ce58-9cfd-4715-aada-4516d09365b5
 // 94a78e9e-0b36-451d-a6e4-1df049df2c1c
}

@override
Future onError(DioError err) {
  print("<-- Error -->");
  print(err.error);
  print(err.message);
  return super.onError(err);
}

}