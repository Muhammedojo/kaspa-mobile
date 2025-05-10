
import 'package:equatable/equatable.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/api/api.dart';
import '../../../../../core/data/model/market_data.dart';
import '../../../../../core/storage/istorage.dart';
import '../../../../../core/utils/global_variables.dart';
import '../../../repository/home_repository_contract.dart';
import '../api_request/api_request_bloc.dart';
import '../api_request/api_request_state.dart';

part 'market_price_state.dart';

class MarketPriceCubit extends Cubit<MarketPriceState> {
  final IHomeRepository repository;
  final LocalStorage databaseManager;
  MarketPriceCubit({required this.repository, required this.databaseManager})
    : super(MarketPriceLoading());

  int currentPulledCount = 0;

  loadMarketPrice({String? url}) async {
    try {
      emit(MarketPriceLoading());
      final response =
          url != null && url.isNotEmpty
              ? await repository.getMarketPriceList(endpoint: url)
              : await repository.getMarketPriceList();

      final state =
          BlocProvider.of<ApiRequestBloc>(
            GlobalVariables.rootNavigatorKey.currentContext!,
          ).state;
            if (state is ApiRequestStateCompleted) {
        loadMarketPricesFromDb();
      } else {
        response.fold(
          (l) {
            GlobalVariables.rootNavigatorKey.currentContext!
                .read<ApiRequestBloc>()
                .add(ApiRequestCompleted());
            loadMarketPricesFromDb();
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
                    identifier: marketPriceListEndpoint,
                    progress: progressPercent,
                  ),
                );

            saveMarketPricesToDb(r.data ?? []);
            if (r.nextUrl != null && (r.nextUrl ?? "").isNotEmpty) {
              loadMarketPrice(url: r.nextUrl);
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
      loadMarketPricesFromDb();
      debugPrint(e.toString());
    }
  }

    loadMarketPricesFromDb() async {
    try {
      final response = await repository.getMarketPrice();
      emit(MarketPriceLoaded(response));
    } catch (e) {
      emit(MarketPriceNotLoaded());
    }
  }

  saveMarketPricesToDb(List<MarketData> marketPriceList) async {
    try {
      await repository.saveMarketPrice(marketPriceList);
      loadMarketPricesFromDb();
    } on Error catch (e) {
      debugPrint(e.toString());
    }
  }
}
