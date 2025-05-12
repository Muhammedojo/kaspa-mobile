import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../config/di/app_initializer.dart';
import '../../../../../core/api/api.dart';
import '../../../../../core/utils/global_variables.dart';
import '../../../../farmers/presentation/bloc/bloc.dart';
import '../bloc.dart';
import '../market/cubit.dart';
import '../market_price/cubit.dart';
import '../product/cubit.dart';
import '../weather/cubit.dart';
import 'api_request_state.dart';
part 'api_request_event.dart';

class ApiRequestBloc extends Bloc<ApiRequestEvent, ApiRequestState> {
  List<String> apiRequestList = [];
  List<String> apiRequestListCompleted = [];
  bool isCurrentlyRequestingFromServer = false;
  String currentEndpointPulled = "";
  int cooperativeId = 0;

  ApiRequestBloc() : super(ApiRequestStateInitial()) {
    on<ApiRequestTriggered>(_onApiRequestTriggered);
    on<ApiRequestLoading>(_onApiRequestLoading);
    on<ApiRequestProgress>(_onApiRequestProgress);
    on<ApiRequestCompleted>(_onApiRequestCompleted);
    on<ApiRequestSyncStarted>(_onApiRequestSyncStarted);
    on<ApiRequestSyncCompleted>(_onApiRequestSyncCompleted);
  }

  void _onApiRequestTriggered(
    ApiRequestTriggered event,
    Emitter<ApiRequestState> state,
  ) async {
    if (apiRequestList.isEmpty && !isCurrentlyRequestingFromServer) {
      apiRequestList.addAll(event.apiRequestList);
      cooperativeId = event.cooperativeId ?? 0;
      isCurrentlyRequestingFromServer = true;
      currentEndpointPulled = apiRequestList.first;
      // debugPrint("first api request list: $apiRequestList");
      add(ApiRequestSyncStarted());
    } else {
      apiRequestList.addAll(event.apiRequestList);

      //debugPrint("subsequent api request list: $apiRequestList");
    }
  }

  void _onApiRequestLoading(
    ApiRequestLoading event,
    Emitter<ApiRequestState> emit,
  ) async {
    if (isClosed) return;

    double total = (apiRequestListCompleted.length / apiRequestList.length);
    emit(
      ApiRequestStateLoading(
        identifier: event.identifier,
        progress: event.progress,
        cooperativeId: cooperativeId,
        totalCompleted: total,
        pulledEndPoints: apiRequestListCompleted.toSet(),
      ),
    );
  }
  

  void _onApiRequestProgress(
    ApiRequestProgress event,
    Emitter<ApiRequestState> emit,
  ) async {
    double total = (apiRequestListCompleted.length / apiRequestList.length);

    emit(
      ApiRequestStateProgress(
        progress: event.progress,
        identifier: event.identifier,
        cooperativeId: cooperativeId,
        totalCompleted: total,
      ),
    );
  }

  void _onApiRequestCompleted(
    ApiRequestCompleted event,
    Emitter<ApiRequestState> state,
  ) async {
    apiRequestListCompleted.add(currentEndpointPulled);
    GlobalVariables.pulledSyncItems.add(currentEndpointPulled);
    apiRequestList.remove(currentEndpointPulled);
    if (apiRequestList.isNotEmpty) {
      String currentApiRequest = apiRequestList.first;
      currentEndpointPulled = currentApiRequest;
      // debugPrint("after request is completed api request list: $apiRequestList");
      _triggerApiCalling(currentApiRequest);
    } else {
      currentEndpointPulled = "";
      add(ApiRequestSyncCompleted());
    }
  }

  void _onApiRequestSyncStarted(
    ApiRequestSyncStarted event,
    Emitter<ApiRequestState> emit,
  ) async {
    emit(ApiRequestStateStarted(cooperativeId: cooperativeId));
    _triggerApiCalling(currentEndpointPulled);
  }

  void _onApiRequestSyncCompleted(
    ApiRequestSyncCompleted event,
    Emitter<ApiRequestState> emit,
  ) async {
    currentEndpointPulled = "";
    isCurrentlyRequestingFromServer = false;
    apiRequestListCompleted.clear();
    apiRequestList.clear();
    cooperativeId = 0;
    GlobalVariables.selectedSyncItems.clear();
    GlobalVariables.pulledSyncItems.clear();
    // debugPrint("sync completed......");
    emit(ApiRequestStateCompleted());
  }

  _triggerApiCalling(String apiRequestName) {
    add(ApiRequestLoading(identifier: apiRequestName, progress: 0.0));
    switch (apiRequestName) {
      case farmersListEndpoint:
        AppInitializer.instanceLocator.get<GetFarmersCubit>().loadFarmers();
        break;

      case lgaListEndpoint:
        AppInitializer.instanceLocator.get<LgaCubit>().loadLga();
        break;

      case livestockListEndpoint:
        AppInitializer.instanceLocator.get<LivestockCubit>().loadLivestock();
        break;

      case bankListEndpoint:
        AppInitializer.instanceLocator.get<BankCubit>().loadBank();
        break;

        case productListEndpoint:
        AppInitializer.instanceLocator.get<ProductCubit>().loadProduct();
        break;

      case cooperativeListEndpoint:
        AppInitializer.instanceLocator
            .get<CooperativeCubit>()
            .loadCooperative();
        break;

      case wardListEndpoint:
        AppInitializer.instanceLocator.get<WardCubit>().loadWard();
        break;

      case cropListEndpoint:
        AppInitializer.instanceLocator.get<CropCubit>().loadCrop();
        break;

      // case usersListEndpoint:
      //   AppInitializer.instanceLocator.get<UserCubit>().loadUser();
      //   break;
      case weatherListEndpoint:
        AppInitializer.instanceLocator.get<WeatherCubit>().loadWeather();
        break;

      case marketListEndpoint:
        AppInitializer.instanceLocator.get<MarketCubit>().loadMarket();
        break;

      case marketPriceListEndpoint:
        AppInitializer.instanceLocator
            .get<MarketPriceCubit>()
            .loadMarketPrice();
        break;

      default:
        add(ApiRequestCompleted());
        break;
    }
  }
}
