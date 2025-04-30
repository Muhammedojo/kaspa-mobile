import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/api/exceptions/api_exception.dart';
import '../../../../../core/data/model/farmer.dart';
import '../../../repository/farmer_repository_contract.dart';
import 'create_farmer_state.dart';


class CreateFarmerCubit extends Cubit<CreateFarmerState> {
  late final IFarmerRepository repository;

  CreateFarmerCubit({required this.repository}) : super(CreateFarmerInitial());

  createFarmer(Farmer data) async {
    try {
      emit(CreateFarmerLoading());
      final response = await repository.createFarmer(data);
      response.fold((l) => emit(CreateFarmerFailure(l)), (r) async {
        // GetIt.I
        //     .get<ApiRequestBloc>()
        //     .add(ApiRequestTriggered(apiRequestList: [ENDPOINT_GET_FARMERS]));
        emit(CreateFarmerSuccess());
      });
    } on Error catch (e) {
      emit(CreateFarmerFailure(UnknownFailure(message: e.toString())));
    }
  }

  editFarmer(Farmer data) async {
    try {
      emit(CreateFarmerLoading());
      final response = await repository.createFarmer(data);
      response.fold(
        (l) => emit(CreateFarmerFailure(l)),
        (r) => emit(CreateFarmerSuccess()),
      );
    } on Error catch (e) {
      emit(CreateFarmerFailure(UnknownFailure(message: e.toString())));
    }
  }
}
