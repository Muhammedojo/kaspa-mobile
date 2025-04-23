part of 'crop_cubit.dart';

sealed class CropState extends Equatable {
  const CropState();

  @override
  List<Object> get props => [];
}

class CropLoading extends CropState {}

class CropLoaded extends CropState {
  final List<Crop> cropList;

  const CropLoaded(this.cropList);

  @override
  List<Object> get props => [cropList];

  @override
  String toString() => 'CropLoaded { Crop: $cropList }';
}

class CropNotLoaded extends CropState {}

class CropFailure extends CropState {
  final String error;

  const CropFailure(this.error);

  @override
  List<Object> get props => [error];

  @override
  String toString() => 'CropFailure { error: $error }';
}
