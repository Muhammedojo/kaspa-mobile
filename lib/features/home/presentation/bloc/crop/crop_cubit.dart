import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/api/api.dart';
import '../../../../../core/data/model/crop.dart';
import '../../../../../core/storage/istorage.dart';
import '../../../../../core/utils/global_variables.dart';
import '../../../repository/home_repository_contract.dart';
import '../api_request/api_request_bloc.dart';
import '../api_request/api_request_state.dart';

part 'crop_state.dart';

class CropCubit extends Cubit<CropState> {
  final IHomeRepository repository;
  final LocalStorage databaseManager;
  CropCubit({required this.databaseManager, required this.repository})
    : super(CropLoading());

  int currentPulledCount = 0;

  loadCrop({String? url}) async {
    try {
      emit(CropLoading());
      final response =
          url != null && url.isNotEmpty
              ? await repository.getCropList(endpoint: url)
              : await repository.getCropList();

      final state =
          BlocProvider.of<ApiRequestBloc>(
            GlobalVariables.rootNavigatorKey.currentContext!,
          ).state;
      if (state is ApiRequestStateCompleted) {
        loadCropsFromDb();
      } else {
        response.fold(
          (l) {
            GlobalVariables.rootNavigatorKey.currentContext!
                .read<ApiRequestBloc>()
                .add(ApiRequestCompleted());
            loadCropsFromDb();
          },
          (r) async {
            currentPulledCount += r.data?.length ?? 0;
            double progressPercent =
                (currentPulledCount.toDouble() /
                    double.parse((r.itemCount ?? 0).toString())) *
                100.0;

            GlobalVariables.rootNavigatorKey.currentContext!
                .read<ApiRequestBloc>()
                .add(
                  ApiRequestLoading(
                    identifier: cropListEndpoint,
                    progress: progressPercent,
                  ),
                );

            saveCropsToDb(r.data ?? []);
            if (r.nextUrl != null && (r.nextUrl ?? "").isNotEmpty) {
              loadCrop(url: r.nextUrl);
            } else {
              GlobalVariables.rootNavigatorKey.currentContext!
                  .read<ApiRequestBloc>()
                  .add(ApiRequestCompleted());
            }
          },
        );
      }
    } on Exception catch (e) {
      GlobalVariables.rootNavigatorKey.currentContext!
          .read<ApiRequestBloc>()
          .add(ApiRequestCompleted());
      loadCropsFromDb();
      debugPrint(e.toString());
    }
  }

  loadCropsFromDb() async {
    try {
      final response = await repository.getCrop();
      emit(CropLoaded(response));
    } catch (e) {
      emit(CropNotLoaded());
    }
  }

  saveCropsToDb(List<Crop> cropList) async {
    try {
      await repository.saveCrop(cropList);
      loadCropsFromDb();
    } on Error catch (e) {
      debugPrint(e.toString());
    }
  }

}
