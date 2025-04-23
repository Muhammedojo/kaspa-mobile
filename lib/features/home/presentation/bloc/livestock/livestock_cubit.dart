import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/api/api.dart';
import '../../../../../core/data/model/livestock.dart';
import '../../../../../core/utils/global_variables.dart';
import '../../../repository/home_repository_contract.dart';
import '../api_request/api_request_bloc.dart';
import '../api_request/api_request_state.dart';

part 'livestock_state.dart';

class LivestockCubit extends Cubit<LivestockState> {
  final IHomeRepository repository;
  LivestockCubit({required this.repository}) : super(LivestockLoading());

  int currentPulledCount = 0;

  loadLivestock({String? url}) async {
   
        try {
     emit(LivestockLoading());
      final response =
          url != null && url.isNotEmpty
              ? await repository.getLivestockList(endpoint: url)
              : await repository.getLivestockList();

      final state =
          BlocProvider.of<ApiRequestBloc>(
            GlobalVariables.rootNavigatorKey.currentContext!,
          ).state;
      if (state is ApiRequestStateCompleted) {
        loadLivestocksFromDb();
      } else {
        response.fold(
          (l) {
            GlobalVariables.rootNavigatorKey.currentContext!
                .read<ApiRequestBloc>()
                .add(ApiRequestCompleted());
            loadLivestocksFromDb();
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
                    identifier: livestockListEndpoint,
                    progress: progressPercent,
                  ),
                );

            saveLivestocksToDb(r.data ?? []);
            if (r.nextUrl != null && (r.nextUrl ?? "").isNotEmpty) {
              loadLivestock(url: r.nextUrl);
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
      loadLivestocksFromDb();
      debugPrint(e.toString());
    }
  }

  loadLivestocksFromDb() async {
    try {
      final response = await repository.getLivestock();
      emit(LivestockLoaded(response));
    } catch (e) {
      emit(LivestockNotLoaded());
    }
  }

  saveLivestocksToDb(List<Livestock> livestockList) async {
    try {
      await repository.saveLivestock(livestockList);
      loadLivestocksFromDb();
    } on Error catch (e) {
      debugPrint(e.toString());
    }
  }
}
