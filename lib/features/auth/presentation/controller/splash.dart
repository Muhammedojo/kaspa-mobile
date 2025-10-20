import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/navigation/navigator.dart';
import '../../../../features/auth/presentation/view/auth_options.dart';
import '../../../../core/data/model/login.dart';
import '../../../../core/navigation/route_constant.dart';
import '../../../../core/storage/istorage.dart';
import '../../../home/presentation/bloc/bloc.dart';
import '../bloc/user/user_cubit.dart';
import '../contract/splash.dart';
import '../view/splash.dart';

class SplashScreen extends StatefulWidget {
  static const route = '/';
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    implements SplashControllerContract {
  late final SplashViewContract view;

  @override
  void initState() {
    super.initState();

    view = SplashView(
      controller: this,
    );
  
    onAnimationComplete();
  }


    void onAnimationComplete() {
    Future.delayed(const Duration(seconds: 5), () async {
      if (mounted) {
        GetIt.I.get<UserCubit>().getUser();
      }
      bool? hasUserLoggedIn = await GetIt.I.get<LocalStorage>().isLoggedIn();
      if (hasUserLoggedIn != null && hasUserLoggedIn) {
        Login user = await GetIt.I.get<LocalStorage>().getLoggedInUser();
       // debugPrint('User ${user.fullname}');
        await showHomeScreen(user);
      } else {
        if (mounted) {
          // context.goNamed(RouteConstant.authOption);
          pushTo(Auths(), context);
        }
      }
    });
  }

   Future<void> showHomeScreen(Login user) async{
    await GetIt.I.get<LocalStorage>().openDb(user.username ?? "defaultUsername");
    refreshLocalData();
    if (mounted) {
      context.goNamed(RouteConstant.homePage);
    }
  }

  void refreshLocalData(){
    GetIt.I.get<BankCubit>().loadBanksFromDb();
    GetIt.I.get<CropCubit>().loadCropsFromDb();
    GetIt.I.get<CooperativeCubit>().loadCooperativesFromDb();
    GetIt.I.get<LivestockCubit>().loadLivestocksFromDb();
    GetIt.I.get<LgaCubit>().loadLgasFromDb();
    GetIt.I.get<WardCubit>().loadWardsFromDb();
    
  }



  @override
  Widget build(BuildContext context) {
    return view.build(context);
  }
}
