part of 'advisory_message_cubit.dart';

sealed class AdvisoryMessageState extends Equatable {
  const AdvisoryMessageState();

  @override
  List<Object> get props => [];
}

class AdvisoryMessageLoading extends AdvisoryMessageState {}

class AdvisoryMessageLoaded extends AdvisoryMessageState {
  final List<Advisory> advisoryList;

  const AdvisoryMessageLoaded(this.advisoryList);

  @override
  List<Object> get props => [advisoryList];

  @override
  String toString() => 'AdvisoryMessageLoaded { AdvisoryMessage: $advisoryList }';
}

class AdvisoryMessageNotLoaded extends AdvisoryMessageState {}

class AdvisoryMessageFailure extends AdvisoryMessageState {
  final String error;

  const AdvisoryMessageFailure(this.error);

  @override
  List<Object> get props => [error];

  @override
  String toString() => 'AdvisoryMessageFailure { error: $error }';
}
