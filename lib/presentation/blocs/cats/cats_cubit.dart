import 'package:cat_app/core/bloc/pagination_state.dart';
import 'package:cat_app/data/models/response/cat_response.dart';
import 'package:cat_app/domain/use_cases/get_cats.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

typedef CatsState = PaginationState<List<CatResponse>, String>;

@injectable
class CatsCubit extends Cubit<CatsState> {
  CatsCubit({required this.getCats})
      : super(
          const PaginationState(data: []),
        );

  final GetCats getCats;
  int _currentPage = 0;
  bool isBusy = false;

  Future<void> fetchCats() async {
    _currentPage = 1;
    emit(state.copyWith(
        status: StateStatusTypes.progress, hasReachedToEnd: false));

    final result = await getCats(CatsParams(page: _currentPage, limit: 10));

    await result.when(
      error: (_) => emit(state.copyWith(status: StateStatusTypes.failure)),
      success: (result) async {
        if (result.isEmpty) {
          emit(state.copyWith(status: StateStatusTypes.success, isEmpty: true));
        } else {
          List<CatResponse> response = [...result];

          emit(
              state.copyWith(status: StateStatusTypes.success, data: response));
        }
      },
    );
  }

  Future<void> fetchCatsPagination() async {
    if (state.isInAgainProgress || state.hasReachedToEnd || isBusy) {
      return;
    }
    isBusy = true;

    emit(state.copyWith(isInAgainProgress: true));

    if ((state.data!.length % 10) == 0) {
      _currentPage++;
    } else {
      emit(state.copyWith(
          hasReachedToEnd: true, status: StateStatusTypes.success));
      return;
    }

    final result = await getCats(CatsParams(page: _currentPage, limit: 10));

    result.when(
      error: (_) {
        emit(state.copyWith(status: StateStatusTypes.failure));
      },
      success: (result) async {
        List<CatResponse> response = [...result];

        List<CatResponse> last = [...state.data!];

        last.addAll(response);

        emit(state.copyWith(status: StateStatusTypes.success, data: last));
      },
    ).then((value) => isBusy = false);
  }
}
