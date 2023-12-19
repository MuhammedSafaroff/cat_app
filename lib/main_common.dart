import 'package:cat_app/injection/di.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'presentation/app.dart';

void mainCommon(String env) async {
  WidgetsFlutterBinding.ensureInitialized();
  configureDependencies(env);
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

  runApp(const App());
}
