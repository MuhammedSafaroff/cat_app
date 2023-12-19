// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../core/constants/endpoints.dart' as _i11;
import '../core/constants/i_config.dart' as _i10;
import '../core/network/app_interceptor.dart' as _i3;
import '../core/network/dio_config.dart' as _i8;
import '../data/data_source/remote/cats_data_source.dart' as _i5;
import '../data/repositories/cats_repository_impl.dart' as _i7;
import '../domain/repositories/cats_repository.dart' as _i6;
import '../domain/use_cases/get_cats.dart' as _i9;
import '../presentation/blocs/bottom_nav/bottom_nav_cubit.dart' as _i4;
import '../presentation/blocs/cats/cats_cubit.dart' as _i12;

const String _dev = 'dev';
const String _prod = 'prod';

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.factory<_i3.AppInterceptor>(() => _i3.AppInterceptor());
    gh.factory<_i4.BottomNavCubit>(() => _i4.BottomNavCubit());
    gh.factory<_i5.CatsDataSource>(() => _i5.CatsDataSourceImpl());
    gh.factory<_i6.CatsRepository>(
        () => _i7.CatsRepositoryImpl(catsDataSource: gh<_i5.CatsDataSource>()));
    gh.factory<_i8.DioConfiguration>(() => _i8.DioConfiguration(
        gh<Set<String>>(instanceName: '__environments__')));
    gh.lazySingleton<_i9.GetCats>(
        () => _i9.GetCats(catsRepository: gh<_i6.CatsRepository>()));
    gh.factory<_i10.IConfig>(
      () => _i11.DevConfig(),
      registerFor: {_dev},
    );
    gh.factory<_i10.IConfig>(
      () => _i11.ProdConfig(),
      registerFor: {_prod},
    );
    gh.factory<_i12.CatsCubit>(
        () => _i12.CatsCubit(getCats: gh<_i9.GetCats>()));
    return this;
  }
}
