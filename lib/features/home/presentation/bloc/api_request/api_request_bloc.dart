import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../config/di/app_initializer.dart';
import '../../../../../core/api/api.dart';
import '../../../../../core/utils/global_variables.dart';
import '../../../../farmers/presentation/bloc/bloc.dart';
import '../advisory_message/cubit.dart';
import '../bloc.dart';
import '../crop_calendar/crop_calendar_cubit.dart';
import '../dod_change/dod_cubit.dart';
import '../farm_crop_activity/farm_crop_activity_cubit.dart';
import '../farm_visit/farm_visit_cubit.dart';
import '../farmer_dashboard/farmer_dashboard_cubit.dart';
import '../incident_report/incident_report_cubit.dart';
import '../insight/insight_cubit.dart';
import '../market/cubit.dart';
import '../market_price/cubit.dart';
import '../plot/plot_cubit.dart';
import '../product/cubit.dart';
import '../weather_lga/cubit.dart';
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
      add(ApiRequestSyncStarted());
    } else {
      apiRequestList.addAll(event.apiRequestList);
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
    emit(ApiRequestStateCompleted());
  }

  _triggerApiCalling(String apiRequestName) {
    add(ApiRequestLoading(identifier: apiRequestName, progress: 0.0));
    switch (apiRequestName) {
      case farmersListEndpoint:
        AppInitializer.instanceLocator.get<GetFarmersCubit>().loadFarmers();
        break;

      case farmCropActivityListEndpoint:
        AppInitializer.instanceLocator
            .get<FarmCropActivityCubit>()
            .loadFarmCropActivity();
        break;

      case farmVisitListEndpoint:
        AppInitializer.instanceLocator.get<FarmVisitCubit>().loadFarmVisit();
        break;

      case lgaListEndpoint:
        AppInitializer.instanceLocator.get<LgaCubit>().loadLga();
        break;

      case lgaWeatherListEndpoint:
        AppInitializer.instanceLocator.get<LgaWeatherCubit>().loadLgaWeather();
        break;

      case livestockListEndpoint:
        AppInitializer.instanceLocator.get<LivestockCubit>().loadLivestock();
        break;

      case bankListEndpoint:
        AppInitializer.instanceLocator.get<BankCubit>().loadBank();
        break;

      case dashboardEndpoint:
        AppInitializer.instanceLocator.get<InsightCubit>().loadInsight();
        break;

      case incidentReportListEndpoint:
        AppInitializer.instanceLocator.get<IncidentCubit>().loadIncident();
        break;

      case dashboardFarmerEndpoint:
        AppInitializer.instanceLocator.get<DashboardCubit>().loadDashboard();
        break;

      case productListEndpoint:
        AppInitializer.instanceLocator.get<ProductCubit>().loadProduct();
        break;

      case plotListEndpoint:
        AppInitializer.instanceLocator.get<PlotCubit>().loadPlot();
        break;

      case advisoryMessageListEndpoint:
        AppInitializer.instanceLocator
            .get<AdvisoryMessageCubit>()
            .loadAdvisoryMessage();
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

      case dodChangeListEndpoint:
        AppInitializer.instanceLocator.get<DodCubit>().loadDod();
        break;

      case cropCalendarListEndpoint:
        AppInitializer.instanceLocator
            .get<CropCalendarCubit>()
            .loadCropCalendar();
        break;

      // case weatherListEndpoint:
      //   AppInitializer.instanceLocator.get<WeatherCubit>().loadWeather();
      //   break;

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
