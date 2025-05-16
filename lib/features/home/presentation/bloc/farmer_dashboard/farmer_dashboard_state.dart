part of 'farmer_dashboard_cubit.dart';

sealed class DashboardState extends Equatable {
  const DashboardState();

  @override
  List<Object> get props => [];
}

class DashboardLoading extends DashboardState {}

class DashboardLoaded extends DashboardState {
  final List<DashboardData> dashboardList;

  const DashboardLoaded(this.dashboardList);

  @override
  List<Object> get props => [dashboardList];

  @override
  String toString() => 'DashboardLoaded { Dashboard: $dashboardList }';
}

class DashboardNotLoaded extends DashboardState {}

class DashboardFailure extends DashboardState {
  final String error;

  const DashboardFailure(this.error);

  @override
  List<Object> get props => [error];

  @override
  String toString() => 'DashboardFailure { error: $error }';
}
