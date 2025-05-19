part of 'crop_calendar_cubit.dart';

sealed class CropCalendarState extends Equatable {
  const CropCalendarState();

  @override
  List<Object> get props => [];
}

class CropCalendarLoading extends CropCalendarState {}

class CropCalendarLoaded extends CropCalendarState {
  final List<CropCalendar> cropCalendarList;

  const CropCalendarLoaded(this.cropCalendarList);

  @override
  List<Object> get props => [cropCalendarList];

  @override
  String toString() => 'CropCalendarLoaded { CropCalendar: $cropCalendarList }';
}

class CropCalendarNotLoaded extends CropCalendarState {}

class CropCalendarFailure extends CropCalendarState {
  final Failure error;

  const CropCalendarFailure(this.error);

  @override
  List<Object> get props => [error];

  @override
  String toString() => 'CropCalendarFailure { error: $error }';
}
