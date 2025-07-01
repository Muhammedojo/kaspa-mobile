import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:isar/isar.dart';
import 'package:kaspa/features/farmers/repository/farmer_repository_contract.dart';

import '../../../../../core/api/api.dart';
import '../../../../../core/data/model/model.dart';
import '../../../../../core/storage/istorage.dart';
import '../../../../../core/utils/global_variables.dart';
import '../../../../home/presentation/bloc/api_request/api_request_bloc.dart';
import '../../../../home/presentation/bloc/api_request/api_request_state.dart';
import 'get_farmer_state.dart';

class GetFarmersCubit extends Cubit<GetFarmersState> {
  final IFarmerRepository repository;
  final LocalStorage databaseManager;
  GetFarmersCubit({required this.repository, required this.databaseManager})
    : super(FarmerListLoading());

  int currentPulledCount = 0;

  loadFarmers({String? url}) async {
    try {
      emit(FarmerListLoading());

      final response =
          url != null && url.isNotEmpty
              ? await repository.getFarmerList(endpoint: url)
              : await repository.getFarmerList();
      final state =
          BlocProvider.of<ApiRequestBloc>(
            GlobalVariables.rootNavigatorKey.currentContext!,
          ).state;
      if (state is ApiRequestStateCompleted) {
        loadFarmersFromDb();
      } else {
        response.fold(
          (l) {
            GlobalVariables.rootNavigatorKey.currentContext!
                .read<ApiRequestBloc>()
                .add(ApiRequestCompleted());
            loadFarmersFromDb();
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
                    identifier: farmersListEndpoint,
                    progress: progressPercent,
                  ),
                );

            saveFarmersToDb(r.data ?? []);
            if (r.nextUrl != null && (r.nextUrl ?? "").isNotEmpty) {
              loadFarmers(url: r.nextUrl);
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
      loadFarmersFromDb();
      debugPrint(e.toString());
    }
  }

  loadFarmersFromDb({
    String? searchTerm,
    List<WhereClause>? whereClauses,
    Sort? whereSort,
    FilterOperation? filter,
    List<SortProperty>? sortBy,
    bool? isSearching,
    bool? isFiltering,
  }) async {
    try {
      final response = await repository.getFarmer(
        searchTerm: searchTerm,
        whereClauses: whereClauses,
        whereSort: whereSort,
        sortBy: sortBy,
        isSearching: isSearching,
        isFiltering: isFiltering,
      );
      emit(FarmerListLoaded(response));
    } catch (e) {
      emit(FarmerListNotLoaded(e.toString()));
    }
  }

  saveFarmersToDb(List<Farmer> farmerList) async {
    try {
      for (final farmer in farmerList) {
        final plots = farmer.farmerFarms;
        if (plots != null && plots.isNotEmpty) {
          for (final plot in plots) {
            plot.updatePolygonJson();
          }
        }
      }

      await repository.saveFarmer(farmerList);
      loadFarmersFromDb();
    } on Error catch (e) {
      debugPrint(e.toString());
    }
  }
}
