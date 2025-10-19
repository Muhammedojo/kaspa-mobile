part of 'dod_cubit.dart';

sealed class DodState extends Equatable {
  const DodState();

  @override
  List<Object> get props => [];
}

class DodLoading extends DodState {}

class DodLoaded extends DodState {
  final List<DodChange> dodList;

  const DodLoaded(this.dodList);

  @override
  List<Object> get props => [dodList];

  @override
  String toString() => 'DodLoaded { Dod: $dodList }';
}

class DodNotLoaded extends DodState {}

class DodFailure extends DodState {
  final String error;

  const DodFailure(this.error);

  @override
  List<Object> get props => [error];

  @override
  String toString() => 'DodFailure { error: $error }';
}
