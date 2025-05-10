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
 // final String searchTerm;

  const FarmerListLoaded(this.dataList, 
  //this.searchTerm
  );

  @override
  List<Object> get props => [dataList, 
  //searchTerm
  ];

  @override
  String toString() =>
      'FarmerLoaded { farmers: $dataList}';
      // ,
      //  searchTerm: $searchTerm'
       //;
}

class FarmerListNotLoaded extends GetFarmersState {}

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
