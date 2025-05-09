import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:kaspa/core/navigation/navigator.dart';
import '../../../../core/navigation/route_constant.dart';
import '../../../../core/storage/istorage.dart';
import '../../../auth/presentation/bloc/user/user_cubit.dart';
import '../../../farmers/presentation/controller/register_farmer.dart';
import '../contract/homepage.dart';
import '../view/homepage.dart';

class HomePageScreen extends StatefulWidget {
  const HomePageScreen({super.key});

  @override
  State<HomePageScreen> createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen>
    implements HomePageControllerContract {
  late final HomePageViewContract view;

  @override
  late PageController pageController = PageController();

  @override
  int currentPage = 0;

  @override
  void initState() {
    context.read<UserCubit>().getUser;
    super.initState();
    pageController.addListener(() {
      int next = pageController.page!.round();
      if (currentPage != next) {
        setState(() {
          currentPage = next;
        });
      }
    });

    view = HomePageView(controller: this);
  }

  @override
  void dispose() {
    super.dispose();
    pageController.dispose();
  }

  @override
  void logout() {
    GetIt.I.get<LocalStorage>().setLoggedIn(false);
    context.goNamed(RouteConstant.login);
    GetIt.I.get<LocalStorage>().closeDb();
  }

  @override
  Widget build(BuildContext context) {
    return view.build(context);
  }

  @override
  void registerFarmer() {
    pushTo( RegisterFarmerScreen(), context);
  }

  @override
  void farmVisit() {
    pushTo( RegisterFarmerScreen(), context);
  }

  @override
  void priceUpdate() {
    pushTo( RegisterFarmerScreen(), context);
  }

  @override
  void report() {
    pushTo( RegisterFarmerScreen(), context);
  }

  @override
  void monitor(index) {
    setState(() {
      currentPage = index;
    });
  }
}
