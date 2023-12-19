import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@injectable
class AppInterceptor extends Interceptor {
  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    options.queryParameters.putIfAbsent(
        'api_key',
        () =>
            'live_s5zIc0qGtYC92TCNO83wSX8izu8TRVvrNuzoKepWE808JeVcqqkinqKhRpqSxeEE');

    handler.next(options);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    log('$err');
    handler.next(err);
  }
}
