part of 'lga_cubit.dart';

sealed  class LgaState extends Equatable {
  const LgaState();

  @override
  List<Object> get props => [];
}


class LgaLoading extends LgaState {}

class LgaLoaded extends LgaState {
  final List<Lga> dataList;

  const LgaLoaded(this.dataList);

  @override
  List<Object> get props => [dataList];

  @override
  String toString() => 'LgaLoaded { LGA: $dataList }';
}


class LgaNotLoaded extends LgaState {}

class LgaFailure extends LgaState {
  final String error;

  const LgaFailure(this.error);

  @override
  List<Object> get props => [error];

  @override
  String toString() => 'LgaFailure { error: $error }';
}
