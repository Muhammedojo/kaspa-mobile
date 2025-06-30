part of 'farm_cubit.dart';

sealed class FarmState extends Equatable {
  const FarmState();

  @override
  List<Object> get props => [];
}

class FarmLoading extends FarmState {}

class FarmLoaded extends FarmState {
  final List<Farm> farmList;

  const FarmLoaded(this.farmList);

  @override
  List<Object> get props => [farmList];

  @override
  String toString() => 'FarmLoaded { Farm: $farmList }';
}

class FarmSuccess extends FarmState {
  final Farm farm;
  const FarmSuccess(this.farm);

  @override
  List<Object> get props => [farm];
}

class FarmNotLoaded extends FarmState {}

class FarmFailure extends FarmState {
  final String error;

  const FarmFailure({required this.error});

  @override
  List<Object> get props => [error];

  @override
  String toString() => 'FarmFailure { error: $error }';
}
