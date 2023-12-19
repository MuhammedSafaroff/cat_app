import 'package:cat_app/data/models/response/cat_response.dart';

import '../../core/either.dart';
import '../../core/error/failure.dart';

abstract class CatsRepository {
  Future<Either<Failure, List<CatResponse>>> fetchCats(int page, int limit);
}
