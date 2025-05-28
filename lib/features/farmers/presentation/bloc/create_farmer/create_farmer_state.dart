import 'package:equatable/equatable.dart';

abstract class CreateFarmerState extends Equatable {
  const CreateFarmerState();

  @override
  List<Object> get props => [];
}

class CreateFarmerInitial extends CreateFarmerState {}

class CreateFarmerLoading extends CreateFarmerState {}

class CreateFarmerSuccess extends CreateFarmerState {}

class CreateFarmerFailure extends CreateFarmerState {
  final String error;

  const CreateFarmerFailure({required this.error});

  @override
  List<Object> get props => [error];

  @override
  String toString() => 'CreateFarmerFailure { error: $error }';
}
