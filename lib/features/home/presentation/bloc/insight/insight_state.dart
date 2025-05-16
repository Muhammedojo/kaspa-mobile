part of 'insight_cubit.dart';

sealed class InsightState extends Equatable {
  const InsightState();

  @override
  List<Object> get props => [];
}

class InsightLoading extends InsightState {}

class InsightLoaded extends InsightState {
  final List<Insight> insightList;

  const InsightLoaded(this.insightList);

  @override
  List<Object> get props => [insightList];

  @override
  String toString() => 'InsightLoaded { Insight: $insightList }';
}

class InsightNotLoaded extends InsightState {}

class InsightFailure extends InsightState {
  final String error;

  const InsightFailure(this.error);

  @override
  List<Object> get props => [error];

  @override
  String toString() => 'InsightFailure { error: $error }';
}
