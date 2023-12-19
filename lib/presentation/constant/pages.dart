import 'package:cat_app/presentation/pages/home/home_page.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../injection/di.dart';
import '../blocs/cats/cats_cubit.dart';

class AppPages {
  static List<Widget> pages = [
    BlocProvider(
      create: (context) => getIt<CatsCubit>()..fetchCats(),
      child: const HomePage(),
    ),
    const SizedBox(
      child: Center(
        child: Text(
          "Profile",
          style: TextStyle(fontSize: 30),
        ),
      ),
    ),
  ];
  static List<String> titles = [
    "Home",
    "Favorite",
  ];
}
