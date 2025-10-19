import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'config/di/app_initializer.dart';
import 'core/navigation/app_router.dart';
import 'core/theme/bloc/theme_cubit.dart';
import 'core/theme/colors.dart';
import 'core/theme/theme.dart';
import 'features/auth/presentation/bloc/auth/auth_cubit.dart';
import 'features/auth/presentation/bloc/forgot_password/forgot_password_cubit.dart';
import 'features/auth/presentation/bloc/reset_password/reset_password_cubit.dart';
import 'features/auth/presentation/bloc/user/user_cubit.dart';
import 'features/farmers/presentation/bloc/bloc.dart';
import 'features/home/presentation/bloc/advisory/crop_advisory_cubit.dart';
import 'features/home/presentation/bloc/advisory_message/cubit.dart';
import 'features/home/presentation/bloc/api_request/api_request_bloc.dart';
import 'features/home/presentation/bloc/bloc.dart';
import 'features/home/presentation/bloc/crop_calendar/crop_calendar_cubit.dart';
import 'features/home/presentation/bloc/dod_change/dod_cubit.dart';
import 'features/home/presentation/bloc/farm/farm_cubit.dart';
import 'features/home/presentation/bloc/farm_crop_activity/farm_crop_activity_cubit.dart';
import 'features/home/presentation/bloc/farm_visit/farm_visit_cubit.dart';
import 'features/home/presentation/bloc/farmer_dashboard/farmer_dashboard_cubit.dart';
import 'features/home/presentation/bloc/incident_report/incident_report_cubit.dart';
import 'features/home/presentation/bloc/insight/insight_cubit.dart';
import 'features/home/presentation/bloc/market/cubit.dart';
import 'features/home/presentation/bloc/market_price/cubit.dart';
import 'features/home/presentation/bloc/notification/cubit.dart';
import 'features/home/presentation/bloc/plot/plot_cubit.dart';
import 'features/home/presentation/bloc/product/cubit.dart';
import 'features/home/presentation/bloc/weather/cubit.dart';
import 'features/home/presentation/bloc/weather_lga/cubit.dart';

class Kaspa extends StatelessWidget {
  const Kaspa({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create:
              (context) =>
                  AppInitializer.instanceLocator.get<CropAdvisoryCubit>(),
        ),
        BlocProvider(
          create:
              (context) => AppInitializer.instanceLocator.get<ApiRequestBloc>(),
        ),
        BlocProvider(
          create: (context) => AppInitializer.instanceLocator.get<AuthCubit>(),
        ),
        BlocProvider(
          create:
              (context) =>
                  AppInitializer.instanceLocator.get<AdvisoryMessageCubit>(),
        ),
        BlocProvider(
          create: (context) => AppInitializer.instanceLocator.get<BankCubit>(),
        ),
        BlocProvider(
          create:
              (context) =>
                  AppInitializer.instanceLocator.get<GetFarmersCubit>(),
        ),

        BlocProvider(
          create:
              (context) =>
                  AppInitializer.instanceLocator.get<CreateFarmerCubit>(),
        ),
        BlocProvider(
          create: (context) => AppInitializer.instanceLocator.get<CropCubit>(),
        ),
        BlocProvider(
          create: (context) => AppInitializer.instanceLocator.get<DodCubit>(),
        ),
        BlocProvider(
          create:
              (context) =>
                  AppInitializer.instanceLocator.get<CooperativeCubit>(),
        ),
        BlocProvider(
          create:
              (context) =>
                  AppInitializer.instanceLocator.get<CropCalendarCubit>(),
        ),
        BlocProvider(
          create:
              (context) => AppInitializer.instanceLocator.get<DashboardCubit>(),
        ),
        BlocProvider(
          create:
              (context) =>
                  AppInitializer.instanceLocator.get<FarmCropActivityCubit>(),
        ),
        BlocProvider(
          create:
              (context) => AppInitializer.instanceLocator.get<FarmVisitCubit>(),
        ),
        BlocProvider(
          create: (context) => AppInitializer.instanceLocator.get<FarmCubit>(),
        ),
        BlocProvider(
          create:
              (context) =>
                  AppInitializer.instanceLocator.get<ForgotPasswordCubit>(),
        ),
        BlocProvider(
          create:
              (context) => AppInitializer.instanceLocator.get<LivestockCubit>(),
        ),
        BlocProvider(
          create: (context) => AppInitializer.instanceLocator.get<LgaCubit>(),
        ),

        BlocProvider(
          create:
              (context) =>
                  AppInitializer.instanceLocator.get<LgaWeatherCubit>(),
        ),

        BlocProvider(
          create:
              (context) => AppInitializer.instanceLocator.get<InsightCubit>(),
        ),

        BlocProvider(
          create:
              (context) => AppInitializer.instanceLocator.get<IncidentCubit>(),
        ),

        BlocProvider(
          create: (context) => AppInitializer.instanceLocator.get<PlotCubit>(),
        ),

        BlocProvider(
          create:
              (context) => AppInitializer.instanceLocator.get<ProductCubit>(),
        ),

        BlocProvider(
          create:
              (context) => AppInitializer.instanceLocator.get<MarketCubit>(),
        ),

        BlocProvider(
          create:
              (context) =>
                  AppInitializer.instanceLocator.get<MarketPriceCubit>(),
        ),

        BlocProvider(
          create:
              (context) =>
                  AppInitializer.instanceLocator.get<NotificationCubit>(),
        ),

        BlocProvider(
          create:
              (context) =>
                  AppInitializer.instanceLocator.get<ResetPasswordCubit>(),
        ),

        BlocProvider(
          create: (context) => AppInitializer.instanceLocator.get<ThemeCubit>(),
        ),

        BlocProvider(
          create: (context) => AppInitializer.instanceLocator.get<WardCubit>(),
        ),

        BlocProvider(
          create:
              (context) => AppInitializer.instanceLocator.get<WeatherCubit>(),
        ),

        BlocProvider(
          create: (context) => AppInitializer.instanceLocator.get<UserCubit>(),
        ),
      ],
      child: ScreenUtilInit(
        designSize: const Size(428, 926),
        minTextAdapt: true,
        splitScreenMode: true,
        useInheritedMediaQuery: false,
        ensureScreenSize: true,
        fontSizeResolver: FontSizeResolvers.height,
        rebuildFactor: (old, data) => true,
        builder: (context, child) {
          final appTheme = AppTheme();
          return GlobalLoaderOverlay(
            overlayColor: Colors.white.withAlpha((0.51 * 255).toInt()),
            overlayWholeScreen: true,
            child: MaterialApp.router(
              debugShowCheckedModeBanner: false,
              title: 'Kaspa',
              color: AppColors.primaryGreen,
              themeMode: ThemeMode.light,
              theme: appTheme.lightTheme,
              darkTheme: appTheme.darkTheme,
              routerConfig: AppRouter.router,
              supportedLocales: context.supportedLocales,
              localizationsDelegates: context.localizationDelegates,
              locale: context.locale,
              builder: (context, child) {
                ResponsiveBreakpoints.builder(
                  child: child!,
                  breakpoints: [
                    const Breakpoint(start: 0, end: 450, name: MOBILE),
                    const Breakpoint(start: 451, end: 800, name: TABLET),
                    const Breakpoint(start: 801, end: 1920, name: DESKTOP),
                    const Breakpoint(
                      start: 1921,
                      end: double.infinity,
                      name: '4K',
                    ),
                  ],
                );
                return MediaQuery(
                  data: MediaQuery.of(context).copyWith(
                    textScaler: TextScaler.linear(
                      MediaQuery.of(context).size.width > 428 ? 1 : 1.12,
                    ),
                  ),
                  child: child,
                );
              },
            ),
          );
        },
      ),
    );
  }
}
