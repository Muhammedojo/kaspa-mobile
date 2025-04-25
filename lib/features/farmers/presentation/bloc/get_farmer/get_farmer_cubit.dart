import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kaspa/features/farmers/repository/farmer_repository_contract.dart';

import '../../../../../core/storage/istorage.dart';
import 'get_farmer_state.dart';

class GetFarmersCubit extends Cubit<GetFarmersState> {
  final IFarmerRepository repository;
  final LocalStorage databaseManager;
  GetFarmersCubit({required this.repository,required this.databaseManager}) : super(FarmerListLoading());

  loadFarmers() async {
    emit(FarmerListLoading());
  }
}
