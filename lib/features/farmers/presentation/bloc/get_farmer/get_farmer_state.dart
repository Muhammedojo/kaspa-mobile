import 'package:equatable/equatable.dart';
import '../../../../../core/data/model/farmer.dart';

abstract class GetFarmersState extends Equatable {
  const GetFarmersState();

  @override
  List<Object> get props => [];
}

class FarmerListLoading extends GetFarmersState {}

class FarmerListLoaded extends GetFarmersState {
  final List<Farmer> dataList;

  const FarmerListLoaded(this.dataList);

  @override
  List<Object> get props => [dataList];

  @override
  String toString() => 'FarmerLoaded { farmers: $dataList}';
}

class FarmerListNotLoaded extends GetFarmersState {
  final String? message;
  const FarmerListNotLoaded([this.message]);

  @override
  String toString() => 'FarmerListFailure { error: $message }';
}

class FarmerListFailure extends GetFarmersState {
  final String error;

  const FarmerListFailure(this.error);

  @override
  List<Object> get props => [error];

  @override
  String toString() => 'FarmerListFailure { error: $error }';
}

class FarmerListProgress extends GetFarmersState {
  final double progress;

  const FarmerListProgress(this.progress);

  @override
  List<Object> get props => [progress];

  @override
  String toString() => 'FarmerListProgress { progress: $progress }';
}
