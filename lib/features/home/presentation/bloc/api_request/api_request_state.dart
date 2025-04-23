import 'package:equatable/equatable.dart';

abstract class ApiRequestState extends Equatable {
  const ApiRequestState();

  @override
  List<Object> get props => [];
}

class ApiRequestStateInitial extends ApiRequestState {}

class ApiRequestStateLoading extends ApiRequestState {
  final String identifier;
  final double progress;
  final double totalCompleted;
  final Set<String> pulledEndPoints;
  final int cooperativeId;

  const ApiRequestStateLoading(
      {required this.identifier,
      required this.progress,
      required this.totalCompleted,
      required this.pulledEndPoints,
      required this.cooperativeId});

  @override
  List<Object> get props => [identifier, progress];
}

class ApiRequestStateProgress extends ApiRequestState {
  final String identifier;
  final double progress;
  final double totalCompleted;
  final int cooperativeId;

  const ApiRequestStateProgress(
      {required this.identifier,
      required this.progress,
      required this.totalCompleted,
      required this.cooperativeId});

  @override
  List<Object> get props => [identifier];
}

class ApiRequestStateStarted extends ApiRequestState {
  final int cooperativeId;

  const ApiRequestStateStarted({required this.cooperativeId});

  @override
  List<Object> get props => [];
}

class ApiRequestStateCompleted extends ApiRequestState {}
