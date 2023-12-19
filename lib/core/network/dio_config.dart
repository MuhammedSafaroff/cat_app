import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import '../../core/constants/endpoints.dart';
import '../../core/network/app_interceptor.dart';
import '../../injection/di.dart';

@injectable
class DioConfiguration {
  final Set<String> environments;
  DioConfiguration(
    @Named(kEnvironmentsName) this.environments,
  );

  Dio dioConfig() => Dio()
    ..options = BaseOptions(
      baseUrl: environments.contains(Environment.dev)
          ? DevConfig().baseUrl
          : ProdConfig().baseUrl,
      connectTimeout: const Duration(seconds: 60),
      receiveTimeout: const Duration(seconds: 60),
      responseType: ResponseType.json,
      headers: environments.contains(Environment.dev)
          ? DevConfig().headers
          : ProdConfig().headers,
    )
    ..interceptors.addAll([
      if (kDebugMode)
        PrettyDioLogger(
          requestHeader: true,
          requestBody: true,
          responseBody: true,
          responseHeader: false,
          error: true,
          compact: true,
          maxWidth: 90,
        ),
      getIt.get<AppInterceptor>(),
    ]);
}
