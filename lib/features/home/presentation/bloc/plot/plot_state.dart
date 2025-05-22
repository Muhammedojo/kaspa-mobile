part of 'plot_cubit.dart';

sealed class PlotState extends Equatable {
  const PlotState();

  @override
  List<Object> get props => [];
}

class PlotLoading extends PlotState {}

class PlotLoaded extends PlotState {
  final List<Plot> plotList;

  const PlotLoaded(this.plotList);

  @override
  List<Object> get props => [plotList];

  @override
  String toString() => 'PlotLoaded { Plot: $plotList }';
}

class PlotNotLoaded extends PlotState {}

class PlotFailure extends PlotState {
  final String error;

  const PlotFailure(this.error);

  @override
  List<Object> get props => [error];

  @override
  String toString() => 'PlotFailure { error: $error }';
}
