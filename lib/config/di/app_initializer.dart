import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kaspa/features/auth/presentation/bloc/forgot_password/forgot_password_cubit.dart';
import '../../core/api/api_services.dart';
import '../../core/api/api_services_impl.dart';
import '../../core/api/network/network_info.dart';
import '../../core/api/services/contracts/api_client.dart';
import '../../core/api/services/dio_client.dart';
import '../../core/api/services/local_auth.dart';
import '../../core/api/services/local_auth_impl.dart';
import '../../core/storage/cache/shared_preference_impl.dart';
import '../../core/storage/database/isar_impl.dart';
import '../../core/storage/istorage.dart';
import '../../core/storage/storage_impl.dart';
import '../../features/auth/presentation/bloc/auth/auth_cubit.dart';
import '../../features/auth/presentation/bloc/user/user_cubit.dart';
import '../../features/auth/repository/auth_repository.dart';
import '../../features/auth/repository/auth_repository_contract.dart';
import '../../features/farmers/presentation/bloc/bloc.dart';
import '../../features/farmers/repository/farmer_repository.dart';
import '../../features/farmers/repository/farmer_repository_contract.dart';
import '../../features/home/presentation/bloc/api_request/api_request_bloc.dart';
import '../../features/home/presentation/bloc/bloc.dart';
import '../../features/home/repository/home_repository.dart';
import '../../features/home/repository/home_repository_contract.dart';

class AppInitializer {
  static late GetIt instanceLocator;
  AppInitializer._();

  static void close() {
    instanceLocator.reset();
  }

  static Future create() async {
    if (kDebugMode) {
      // Bloc.observer = AppBlocObserver();
    }
    WidgetsFlutterBinding.ensureInitialized();
    await ScreenUtil.ensureScreenSize();
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    await EasyLocalization.ensureInitialized();
    // setLocaleMessages('en', MyCustomMessages());

    initializeDi();
  }

  static dynamic initGetIt() async {
    instanceLocator = GetIt.I;
    instanceLocator.allowReassignment = true;
    await create();
  }

  static dynamic logout() async {
    try {
      await instanceLocator.reset();
      await initGetIt();
    } catch (_) {}
  }

  static initSecurity() {
    // instanceLocator.registerSingleton<ICryptoSystem>(
    //     AESCryptoSystem(key: KEY_ENCRYPTION_KEY, vector: KEY_ENCRYPTION_IV));
    // instanceLocator.registerSingleton<CryptoSystemImpl>(
    //     CryptoSystemImpl(cryptoSystem: instanceLocator()));
  }

  static initHelper() {
    // instanceLocator.registerSingleton<IWidgetHelper>(WidgetHelper());
  }

  static initBlocs() {
    instanceLocator.registerLazySingleton<ApiRequestBloc>(
      () => ApiRequestBloc(),
    );

    instanceLocator.registerLazySingleton<AuthCubit>(
      () => AuthCubit(repository: instanceLocator()),
    );

    instanceLocator.registerLazySingleton<CreateFarmerCubit>(
      () => CreateFarmerCubit(repository: instanceLocator()),
    );

    instanceLocator.registerLazySingleton<BankCubit>(
      () => BankCubit(
        repository: instanceLocator(),
        databaseManager: instanceLocator(),
      ),
    );

    instanceLocator.registerLazySingleton<CropCubit>(
      () => CropCubit(
        repository: instanceLocator(),
        databaseManager: instanceLocator(),
      ),
    );

    instanceLocator.registerLazySingleton<CooperativeCubit>(
      () => CooperativeCubit(
        repository: instanceLocator(),
        databaseManager: instanceLocator(),
      ),
    );

     instanceLocator.registerLazySingleton<ForgotPasswordCubit>(
      () => ForgotPasswordCubit(
        repository: instanceLocator(),
       
      ),
    );

    instanceLocator.registerLazySingleton<LgaCubit>(
      () => LgaCubit(
        repository: instanceLocator(),
        databaseManager: instanceLocator(),
      ),
    );

    instanceLocator.registerLazySingleton<WardCubit>(
      () => WardCubit(
        repository: instanceLocator(),
        databaseManager: instanceLocator(),
      ),
    );

    instanceLocator.registerLazySingleton<LivestockCubit>(
      () => LivestockCubit(repository: instanceLocator()),
    );

    instanceLocator.registerLazySingleton<GetFarmersCubit>(
      () => GetFarmersCubit(
        repository: instanceLocator(),
        databaseManager: instanceLocator(),
      ),
    );

    instanceLocator.registerLazySingleton<UserCubit>(
      () => UserCubit(repository: instanceLocator()),
    );
  }

  static initRepos() {
    instanceLocator.registerLazySingleton<IAuthRepository>(
      () => AuthRepository(
        localStorage: instanceLocator(),
        apiServices: instanceLocator(),
      ),
    );
    instanceLocator.registerLazySingleton<IFarmerRepository>(
      () => FarmerRepository(
        localStorage: instanceLocator(),
        apiServices: instanceLocator(),
      ),
    );
    instanceLocator.registerLazySingleton<IHomeRepository>(
      () => HomeRepository(
        localStorage: instanceLocator(),
        apiServices: instanceLocator(),
      ),
    );
  }

  static initLocalDataSources() {
    //data sources
    instanceLocator.registerLazySingleton<CacheStorage>(
      () => SharedPreferenceImpl(),
    );
    instanceLocator.registerLazySingleton<DatabaseStorage>(() => IsarImpl());
    instanceLocator.registerSingleton<LocalStorage>(
      LocalStorageImpl(
        cacheStorage: instanceLocator(),
        databaseStorage: instanceLocator(),
      ),
    );
  }

  static initRemoteDataSources() {
    //remote data sources
    instanceLocator.registerLazySingleton<NetworkInfo>(
      () => NetworkInfoImplementation(),
    );
    instanceLocator.registerLazySingleton<LocalAuth>(() => LocalAuthImpl());
    instanceLocator.registerLazySingleton<IApiClient>(
      () => DioClient(instanceLocator()),
    );
    instanceLocator.registerLazySingleton<ApiServices>(
      () => ApiServicesImpl(apiClient: instanceLocator()),
    );
  }

  static initializeDi() {
    initSecurity();
    initGlobalVariables();
    initLocalDataSources();
    initRemoteDataSources();
    initRepos();
    initBlocs();
    initHelper();
  }

  static initGlobalVariables() {
    instanceLocator.registerSingleton<String>(
      instanceName: "accessToken",
      "",
      signalsReady: true,
    );
    instanceLocator.registerSingleton<int>(
      instanceName: "userId",
      0,
      signalsReady: true,
    );
  }

  static void disposeInstance<T extends Bloc>(T blocInstance) {
    instanceLocator.unregister(instance: blocInstance);
  }
}
