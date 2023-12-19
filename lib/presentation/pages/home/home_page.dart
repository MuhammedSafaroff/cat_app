import 'package:cat_app/core/bloc/pagination_state.dart';
import 'package:cat_app/data/models/response/cat_response.dart';
import 'package:cat_app/presentation/blocs/cats/cats_cubit.dart';
import 'package:cat_app/presentation/widgets/home_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/constants/routes.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ScrollController scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: BlocBuilder<CatsCubit, PaginationState<List<CatResponse>, String>>(
        builder: (context, state) {
          if (state.status == StateStatusTypes.progress &&
              !state.isInAgainProgress) {
            return const Center(
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: CircularProgressIndicator.adaptive(),
              ),
            );
          } else if (state.status == StateStatusTypes.failure) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.error,
                    color: Colors.red,
                    size: 60,
                  ),
                  const SizedBox(height: 30),
                  Text(
                    state.error ?? "Error",
                    style: const TextStyle(fontSize: 30),
                  )
                ],
              ),
            );
          } else if (state.status == StateStatusTypes.success) {
            if (state.isEmpty) {
              return const Center(
                child: Text(
                  "Empty",
                  style: TextStyle(fontSize: 30),
                ),
              );
            }
            return CustomScrollView(
              controller: scrollController
                ..addListener(() async {
                  if (scrollController.offset >=
                      scrollController.position.maxScrollExtent) {
                    await context.read<CatsCubit>().fetchCatsPagination();
                  }
                }),
              slivers: [
                SliverGrid(
                  delegate: SliverChildBuilderDelegate((context, index) {
                    CatResponse cats = state.data![index];
                    return HomeItem(
                      item: cats,
                      onTap: () {
                        Navigator.pushNamed(
                          context,
                          AppRoutes.catDetails,
                          arguments: cats,
                        );
                      },
                    );
                  }, childCount: state.data!.length),
                  gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: width / 2 - 15,
                    mainAxisExtent: 300,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                  ),
                ),
                if (!state.hasReachedToEnd)
                  const SliverToBoxAdapter(
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: CupertinoActivityIndicator(
                        radius: 15,
                      ),
                    ),
                  )
              ],
            );
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}
