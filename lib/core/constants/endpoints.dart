import 'package:cat_app/core/constants/i_config.dart';
import 'package:injectable/injectable.dart';

@Environment('dev')
@Injectable(as: IConfig)
class DevConfig extends IConfig {
  @override
  String get baseUrl => "https://api.thecatapi.com/";

  @override
  Map<String, String> get headers => {};

  @override
  String get catSearch => 'v1/images/search';
}

@Environment('prod')
@Injectable(as: IConfig)
class ProdConfig extends IConfig {
  @override
  String get baseUrl => "https://api.thecatapi.com/";

  @override
  Map<String, String> get headers => {};

  @override
  String get catSearch => 'v1/images/search';
}
