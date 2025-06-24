part of 'crop_advisory_cubit.dart';


@immutable
abstract class CropAdvisoryState {}

class CropAdvisoryInitial extends CropAdvisoryState {}

class CropAdvisoryLoading extends CropAdvisoryState {}

class CropAdvisoryLoaded extends CropAdvisoryState {
  final String advisory;
  CropAdvisoryLoaded(this.advisory);
}

class CropAdvisoryFailure extends CropAdvisoryState {
  final String error;
  CropAdvisoryFailure(this.error);
}
