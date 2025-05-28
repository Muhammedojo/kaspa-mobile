part of 'farm_visit_cubit.dart';


sealed class FarmVisitState extends Equatable {
  const FarmVisitState();

  @override
  List<Object> get props => [];
}

class FarmVisitLoading extends FarmVisitState {}

class FarmVisitLoaded extends FarmVisitState {
  final List<FarmVisit> farmVisitList;

  const FarmVisitLoaded(this.farmVisitList);

  @override
  List<Object> get props => [farmVisitList];

  @override
  String toString() => 'FarmVisitLoaded { Farm Visit: $farmVisitList }';
}

class FarmVisitNotLoaded extends FarmVisitState {}

class CreateVisitSuccess extends FarmVisitState {
  final FarmVisit farmVisit;
  const CreateVisitSuccess(this.farmVisit);

  @override
  List<Object> get props => [farmVisit];
}

class FarmVisitFailure extends FarmVisitState {
  final String error;

  const FarmVisitFailure({required this.error});

  @override
  List<Object> get props => [error];

  @override
  String toString() => 'FarmVisitFailure { error: $error }';
}
