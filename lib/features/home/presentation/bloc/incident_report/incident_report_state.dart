part of 'incident_report_cubit.dart';

sealed class IncidentState extends Equatable {
  const IncidentState();

  @override
  List<Object> get props => [];
}

class IncidentLoading extends IncidentState {}

class IncidentLoaded extends IncidentState {
  final List<IncidentReport> incidentList;

  const IncidentLoaded(this.incidentList);

  @override
  List<Object> get props => [incidentList];

  @override
  String toString() => 'IncidentLoaded { Incident: $incidentList }';
}

class ReportIncidentSuccess extends IncidentState {
  final IncidentReport incident;
  const ReportIncidentSuccess(this.incident);

  @override
  List<Object> get props => [incident];
}

class IncidentNotLoaded extends IncidentState {}

class IncidentFailure extends IncidentState {
  final Failure error;

  const IncidentFailure(this.error);

  @override
  List<Object> get props => [error];

  @override
  String toString() => 'IncidentFailure { error: $error }';
}
