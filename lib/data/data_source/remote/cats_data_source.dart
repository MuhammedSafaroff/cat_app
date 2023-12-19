import 'package:cat_app/core/constants/i_config.dart';
import 'package:cat_app/core/network/dio_config.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../../../core/constants/endpoints.dart';
import '../../../injection/di.dart';
import '../../models/response/cat_response.dart';

abstract class CatsDataSource {
  Future<List<CatResponse>> fetchCats(int page, int limit);
}

@Injectable(as: CatsDataSource)
class CatsDataSourceImpl implements CatsDataSource {
  final Dio _dio = getIt<DioConfiguration>().dioConfig();

  @override
  Future<List<CatResponse>> fetchCats(
    int page,
    int limit,
  ) async {
    final queryParameters = <String, dynamic>{
      r'page': page,
      r'limit': limit,
    };
    final result = await _dio
        .fetch<List<dynamic>>(_setStreamType<List<CatResponse>>(Options(
      method: 'GET',
    )
            .compose(
              _dio.options,
              getPath().catSearch,
              queryParameters: queryParameters,
            )
            .copyWith(baseUrl: Uri.parse(_dio.options.baseUrl).toString())));
    var value = result.data!
        .map((dynamic i) => CatResponse.fromJson(i as Map<String, dynamic>))
        .toList();
    return value;
  }

  RequestOptions _setStreamType<T>(RequestOptions requestOptions) {
    if (T != dynamic &&
        !(requestOptions.responseType == ResponseType.bytes ||
            requestOptions.responseType == ResponseType.stream)) {
      if (T == String) {
        requestOptions.responseType = ResponseType.plain;
      } else {
        requestOptions.responseType = ResponseType.json;
      }
    }
    return requestOptions;
  }

  IConfig getPath() {
    bool env = getIt<DioConfiguration>().environments.contains(Environment.dev);
    if (env) {
      return DevConfig();
    } else {
      return ProdConfig();
    }
  }
}
