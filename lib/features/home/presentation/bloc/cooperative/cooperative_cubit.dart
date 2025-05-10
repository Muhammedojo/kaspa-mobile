
import 'package:equatable/equatable.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/api/api.dart';
import '../../../../../core/data/model/cooperative.dart';
import '../../../../../core/storage/istorage.dart';
import '../../../../../core/utils/global_variables.dart';
import '../../../repository/home_repository_contract.dart';
import '../api_request/api_request_bloc.dart';
import '../api_request/api_request_state.dart';

part 'cooperative_state.dart';

class CooperativeCubit extends Cubit<CooperativeState> {
  final IHomeRepository repository;
  final LocalStorage databaseManager;
  CooperativeCubit({required this.repository, required this.databaseManager})
    : super(CooperativeLoading());

  int currentPulledCount = 0;

  loadCooperative({String? url}) async {
    try {
      emit(CooperativeLoading());
      debugPrint('Try calling cooperative');
      final response =
          url != null && url.isNotEmpty
              ? await repository.getCooperativeList(endpoint: url)
              : await repository.getCooperativeList();

      final state =
          BlocProvider.of<ApiRequestBloc>(
            GlobalVariables.rootNavigatorKey.currentContext!,
          ).state;
            if (state is ApiRequestStateCompleted) {
        loadCooperativesFromDb();
      } else {
        response.fold(
          (l) {
            GlobalVariables.rootNavigatorKey.currentContext!
                .read<ApiRequestBloc>()
                .add(ApiRequestCompleted());
            loadCooperativesFromDb();
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
                    identifier: cooperativeListEndpoint,
                    progress: progressPercent,
                  ),
                );

            saveCooperativesToDb(r.data ?? []);
            if (r.nextUrl != null && (r.nextUrl ?? "").isNotEmpty) {
              loadCooperative(url: r.nextUrl);
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
      loadCooperativesFromDb();
      debugPrint(e.toString());
    }
  }

    loadCooperativesFromDb() async {
    try {
      final response = await repository.getCooperative();
      emit(CooperativeLoaded(response));
    } catch (e) {
      emit(CooperativeNotLoaded());
    }
  }

  saveCooperativesToDb(List<Cooperative> cooperativeList) async {
    try {
      await repository.saveCooperative(cooperativeList);
      loadCooperativesFromDb();
    } on Error catch (e) {
      debugPrint(e.toString());
    }
  }
}
