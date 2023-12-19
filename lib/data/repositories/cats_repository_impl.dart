import 'package:cat_app/data/models/response/cat_response.dart';
import 'package:cat_app/domain/repositories/cats_repository.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../../core/either.dart';
import '../../core/error/failure.dart';
import '../data_source/remote/cats_data_source.dart';

@Injectable(as: CatsRepository)
class CatsRepositoryImpl implements CatsRepository {
  const CatsRepositoryImpl({required this.catsDataSource});

  final CatsDataSource catsDataSource;

  @override
  Future<Either<Failure, List<CatResponse>>> fetchCats(
      int page, int limit) async {
    try {
      return Success(await catsDataSource.fetchCats(page, limit));
    } on DioException catch (e) {
      if (e.response?.data != null) {
        return Error(Failure.network(e.message));
      } else {
        return const Error(Failure.network());
      }
    } catch (e) {
      return const Error(Failure.other());
    }
  }
}
