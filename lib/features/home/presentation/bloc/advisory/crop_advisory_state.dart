part of 'crop_advisory_cubit.dart';


sealed class CropAdvisoryState extends Equatable {
  const CropAdvisoryState();

  @override
  List<Object> get props => [];
}

class CropAdvisoryInitial extends CropAdvisoryState {}

class CropAdvisoryLoading extends CropAdvisoryState {}

class CropAdvisoryLoaded extends CropAdvisoryState {
  final String advisory;
 const CropAdvisoryLoaded(this.advisory);
}

class CropAdvisoryFailure extends CropAdvisoryState {
  final String error;

 const CropAdvisoryFailure(this.error);

   @override
  List<Object> get props => [error];

  @override
  String toString() => 'CropAdvisoryFailure { error: $error }';
}
