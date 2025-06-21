part of 'farm_crop_activity_cubit.dart';

sealed class FarmCropActivityState extends Equatable {
  const FarmCropActivityState();

  @override
  List<Object> get props => [];
}

class FarmCropActivityLoading extends FarmCropActivityState {}

class FarmCropActivityLoaded extends FarmCropActivityState {
  final List<CropActivities> farmCropActivityList;

  const FarmCropActivityLoaded(this.farmCropActivityList);

  @override
  List<Object> get props => [farmCropActivityList];

  @override
  String toString() => 'FarmCropActivityLoaded { FarmCropActivity: $farmCropActivityList }';
}

class FarmCropActivityNotLoaded extends FarmCropActivityState {}

class FarmCropActivityFailure extends FarmCropActivityState {
  final String error;

  const FarmCropActivityFailure({required this.error});

  @override
  List<Object> get props => [error];

  @override
  String toString() => 'FarmCropActivityFailure { error: $error }';
}
