import 'package:barcodes/config/logger.dart';
import 'package:dio/dio.dart';

abstract class BaseService {
  BaseService(BaseOptions options) {
    dio = Dio(options)
      ..interceptors.add(
        QueuedInterceptorsWrapper(
          onRequest: (RequestOptions options,
              RequestInterceptorHandler requestInterceptorHandler) async {
            Logger.d('--> ${options.method} ${options.uri}');
            for (final MapEntry<String, dynamic> header
            in options.headers.entries) {
              Logger.d('${header.key} : ${header.value}');
            }
            Logger.d('${options.data}');
            Logger.d('--> END ${options.method}');
            return requestInterceptorHandler.next(options);
          },
          onResponse: (Response<dynamic> response,
              ResponseInterceptorHandler responseInterceptorHandler) async {
            Logger.d(
                '<-- ${response.statusCode} ${response.requestOptions.uri}');
            for (final MapEntry<String, dynamic> header
            in response.headers.map.entries) {
              Logger.d('${header.key} : ${header.value}');
            }
            Logger.d('${response.data}');
            Logger.d('<-- END HTTP');
            Logger.d(
                '<-- ${response.statusCode} ${response.requestOptions.uri}');
            return responseInterceptorHandler.next(response);
          },
          onError: (DioError e,
              ErrorInterceptorHandler errorInterceptorHandler) async {
            if (e.response != null) {
              Logger.d(
                  '<-- HTTP FAILED ${e.response!.statusCode} ${e.response!.statusMessage}');
              Logger.d('${e.response!.data}');
              Logger.d('<-- END HTTP');
              Logger.d(
                  '<-- ${e.response!.statusCode} ${e.response!.requestOptions.uri}');
            } else {
              Logger.d('<-- HTTP error ${e.error.toString()}');
            }
            return errorInterceptorHandler.next(e);
          },
        ),
      );
  }

  late Dio dio;
}
