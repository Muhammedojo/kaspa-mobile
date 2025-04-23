part of 'api_request_bloc.dart';

abstract class ApiRequestEvent extends Equatable {
  const ApiRequestEvent();

  @override
  List<Object> get props => [];
}

class ApiRequestTriggered extends ApiRequestEvent {
  final List<String> apiRequestList;
  final int? cooperativeId;

  const ApiRequestTriggered({required this.apiRequestList, this.cooperativeId});

  @override
  List<Object> get props => [apiRequestList, cooperativeId ?? 0];
}

//class ApiRequestStarted extends ApiRequestEvent {}

class ApiRequestLoading extends ApiRequestEvent {
  final String identifier;
  final double progress;

  const ApiRequestLoading({required this.identifier, required this.progress});

  @override
  List<Object> get props => [identifier, progress];
}

class ApiRequestProgress extends ApiRequestEvent {
  final String identifier;
  final double progress;

  const ApiRequestProgress({required this.identifier, required this.progress});

  @override
  List<Object> get props => [identifier, progress];
}

class ApiRequestCompleted extends ApiRequestEvent {}

class ApiRequestSyncStarted extends ApiRequestEvent {}

class ApiRequestSyncCompleted extends ApiRequestEvent {}
