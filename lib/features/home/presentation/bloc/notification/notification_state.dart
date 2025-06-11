part of 'notification_cubit.dart';

sealed class NotificationState extends Equatable {
  const NotificationState();

  @override
  List<Object> get props => [];
}

class NotificationLoading extends NotificationState {}

class NotificationLoaded extends NotificationState {
  final List<Notifications> notificationList;

  const NotificationLoaded(this.notificationList);

  @override
  List<Object> get props => [notificationList];

  @override
  String toString() => 'NotificationLoaded { Notification: $notificationList }';
}

class NotificationNotLoaded extends NotificationState {}

class NotificationFailure extends NotificationState {
  final String error;

  const NotificationFailure(this.error);

  @override
  List<Object> get props => [error];

  @override
  String toString() => 'NotificationFailure { error: $error }';
}
