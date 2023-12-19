import 'package:cat_app/presentation/pages/main/main_page.dart';
import 'package:cat_app/presentation/router/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../injection/di.dart';
import 'blocs/bottom_nav/bottom_nav_cubit.dart';

class App extends StatelessWidget {
  const App({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cat App',
      debugShowCheckedModeBanner: false,
      onGenerateRoute: AppRouter.onGenerateRoute,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.red),
        useMaterial3: true,
      ),
      home: BlocProvider(
        create: (context) => getIt<BottomNavCubit>(),
        child: const MainPage(),
      ),
    );
  }
}
