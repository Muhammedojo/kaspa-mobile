part of 'ward_cubit.dart';

abstract class WardState extends Equatable {
  const WardState();

  @override
  List<Object> get props => [];
}

class WardLoading extends WardState {}

class WardLoaded extends WardState {
  final List<Ward> dataList;

  const WardLoaded(this.dataList);

  @override
  List<Object> get props => [dataList];

  @override
  String toString() => 'WardLoaded { Ward: $dataList }';
}

class WardNotLoaded extends WardState {}

class WardFailure extends WardState {
  final String error;

  const WardFailure(this.error);

  @override
  List<Object> get props => [error];

  @override
  String toString() => 'WardFailure { error: $error }';
}
