
import 'package:equatable/equatable.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/api/api.dart';
import '../../../../../core/data/model/market.dart';
import '../../../../../core/storage/istorage.dart';
import '../../../../../core/utils/global_variables.dart';
import '../../../repository/home_repository_contract.dart';
import '../api_request/api_request_bloc.dart';
import '../api_request/api_request_state.dart';

part 'market_state.dart';

class MarketCubit extends Cubit<MarketState> {
  final IHomeRepository repository;
  final LocalStorage databaseManager;
  MarketCubit({required this.repository, required this.databaseManager})
    : super(MarketLoading());

  int currentPulledCount = 0;

  loadMarket({String? url}) async {
    try {
      emit(MarketLoading());
      final response =
          url != null && url.isNotEmpty
              ? await repository.getMarketList(endpoint: url)
              : await repository.getMarketList();

      final state =
          BlocProvider.of<ApiRequestBloc>(
            GlobalVariables.rootNavigatorKey.currentContext!,
          ).state;
            if (state is ApiRequestStateCompleted) {
        loadMarketsFromDb();
      } else {
        response.fold(
          (l) {
            GlobalVariables.rootNavigatorKey.currentContext!
                .read<ApiRequestBloc>()
                .add(ApiRequestCompleted());
            loadMarketsFromDb();
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
                    identifier: marketListEndpoint,
                    progress: progressPercent,
                  ),
                );

            saveMarketsToDb(r.data ?? []);
            if (r.nextUrl != null && (r.nextUrl ?? "").isNotEmpty) {
              loadMarket(url: r.nextUrl);
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
      loadMarketsFromDb();
      debugPrint(e.toString());
    }
  }

    loadMarketsFromDb() async {
    try {
      final response = await repository.getMarket();
      emit(MarketLoaded(response));
    } catch (e) {
      emit(MarketNotLoaded());
    }
  }

  saveMarketsToDb(List<Market> marketList) async {
    try {
      await repository.saveMarket(marketList);
      loadMarketsFromDb();
    } on Error catch (e) {
      debugPrint(e.toString());
    }
  }
}
