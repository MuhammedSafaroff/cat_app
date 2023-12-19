import 'dart:async';

import 'package:cat_app/data/models/response/cat_response.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

import '../../core/either.dart';
import '../../core/error/failure.dart';
import '../../core/use_case/use_case.dart';
import '../repositories/cats_repository.dart';

@lazySingleton
class GetCats extends UseCase<List<CatResponse>, CatsParams> {
  final CatsRepository catsRepository;

  GetCats({required this.catsRepository});

  @override
  Future<Either<Failure, List<CatResponse>>> call(CatsParams params) {
    return catsRepository.fetchCats(params.page, params.limit);
  }
}

class CatsParams extends Equatable {
  final int page;
  final int limit;

  const CatsParams({
    required this.page,
    required this.limit,
  });

  @override
  List<Object?> get props => [page, limit];
}
