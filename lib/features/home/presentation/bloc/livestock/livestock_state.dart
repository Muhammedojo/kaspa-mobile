part of 'livestock_cubit.dart';

sealed class LivestockState extends Equatable {
  const LivestockState();

  @override
  List<Object> get props => [];
}

class LivestockLoading extends LivestockState {}

class LivestockLoaded extends LivestockState {
  final List<Livestock> livestockList;

  const LivestockLoaded(this.livestockList);

  @override
  List<Object> get props => [livestockList];

  @override
  String toString() => 'LivestockLoaded { Livestock: $livestockList }';
}

class LivestockNotLoaded extends LivestockState {}

class LivestockFailure extends LivestockState {
  final String error;

  const LivestockFailure(this.error);

  @override
  List<Object> get props => [error];

  @override
  String toString() => 'LivestockFailure { error: $error }';
}
