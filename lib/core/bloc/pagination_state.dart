import 'package:equatable/equatable.dart';

enum StateStatusTypes { initial, progress, failure, success }

class PaginationState<Success, Error> extends Equatable {
  final StateStatusTypes status;
  final bool isInAgainProgress;
  final bool hasReachedToEnd;
  final bool isEmpty;
  final Success? data;
  final Error? error;

  const PaginationState({
    this.status = StateStatusTypes.initial,
    this.isInAgainProgress = false,
    this.hasReachedToEnd = false,
    this.isEmpty = false,
    this.data,
    this.error,
  });

  PaginationState<Success, Error> copyWith({
    final StateStatusTypes? status,
    final bool? isInAgainProgress,
    final bool? hasReachedToEnd,
    final bool? isEmpty,
    final Success? data,
    final Error? error,
  }) {
    return PaginationState(
      status: status ?? this.status,
      isInAgainProgress: isInAgainProgress ?? false,
      hasReachedToEnd: hasReachedToEnd ?? this.hasReachedToEnd,
      isEmpty: isEmpty ?? this.isEmpty,
      data: data ?? this.data,
      error: error ?? this.error,
    );
  }

  @override
  List<Object?> get props => [
        status,
        isInAgainProgress,
        hasReachedToEnd,
        isEmpty,
        error,
        data,
      ];
}
