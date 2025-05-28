import 'package:equatable/equatable.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:isar/isar.dart';
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
            
            int totalCount = r.itemCount ?? 0;
            currentPulledCount += r.data?.length ?? 0;
            currentPulledCount = currentPulledCount.clamp(0, totalCount);
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

  loadCooperativesFromDb({
    String? searchTerm,
    List<WhereClause>? whereClauses,
    Sort? whereSort,
    FilterOperation? filter,
    List<SortProperty>? sortBy,
    bool? isSearching,
    bool? isFiltering,
  }) async {
    try {
      final response = await repository.getCooperative(
        searchTerm: searchTerm,
        whereClauses: whereClauses,
        whereSort: whereSort,
        sortBy: sortBy,
        isSearching: isSearching,
        isFiltering: isFiltering,
      );
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

  createCooperative(Cooperative data) async {
    try {
      emit(CooperativeLoading());
      final response = await repository.createCooperative(data);
      response.fold(
        (l) => emit(CooperativeFailure(error: l.failureMessage())),
        (r) async {
          if (r.data != null) {
            emit(CreateCooperativeSuccess(r.data!));

            GetIt.I.get<ApiRequestBloc>().add(
              ApiRequestTriggered(apiRequestList: [cooperativeListEndpoint]),
            );
          } else {
            emit(CooperativeFailure(error: 'Something went wrong'));
          }
        },
      );
    } on Error catch (e) {
      emit(CooperativeFailure(error: e.toString()));
    }
  }
}
