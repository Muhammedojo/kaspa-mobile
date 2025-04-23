part of 'cooperative_cubit.dart';


sealed class CooperativeState extends Equatable {
  const CooperativeState();

  @override
  List<Object> get props => [];
}

class CooperativeLoading extends CooperativeState {}

class CooperativeLoaded extends CooperativeState {
  final List<Cooperative> cooperativeList;

  const CooperativeLoaded(this.cooperativeList);

  @override
  List<Object> get props => [cooperativeList];

  @override
  String toString() => 'CooperativeLoaded { Cooperative: $cooperativeList }';
}

class CooperativeNotLoaded extends CooperativeState {}

class CooperativeFailure extends CooperativeState {
  final String error;

  const CooperativeFailure(this.error);

  @override
  List<Object> get props => [error];

  @override
  String toString() => 'CooperativeFailure { error: $error }';
}
