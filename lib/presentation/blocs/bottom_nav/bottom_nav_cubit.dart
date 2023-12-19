import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

ValueNotifier<int> navigationCurrentIndex = ValueNotifier<int>(0);

@injectable
class BottomNavCubit extends Cubit<int> {
  BottomNavCubit() : super(0);

  void changeIndex(int index) {
    navigationCurrentIndex.value = index;
    emit(index);
  }
}
