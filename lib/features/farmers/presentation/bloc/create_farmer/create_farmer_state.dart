import 'package:equatable/equatable.dart';
import '../../../../../core/api/exceptions/contracts/failure.dart';

abstract class CreateFarmerState extends Equatable {
  const CreateFarmerState();

  @override
  List<Object> get props => [];
}

class CreateFarmerInitial extends CreateFarmerState {}

class CreateFarmerLoading extends CreateFarmerState {}

class CreateFarmerSuccess extends CreateFarmerState {}

class CreateFarmerFailure extends CreateFarmerState {
  final Failure error;

  const CreateFarmerFailure(this.error);

  @override
  List<Object> get props => [error];

  @override
  String toString() => 'CreateFarmerFailure { error: $error }';
}
