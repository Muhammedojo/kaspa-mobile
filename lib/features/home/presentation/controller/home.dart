import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/utils/global_variables.dart';
import '../../../agronomy/presentation/controller/agronomy.dart';
import '../../../farmers/presentation/controller/farmer.dart';
import '../../../insights/presentation/controller/insight.dart';
import '../bloc/api_request/api_request_bloc.dart';
import '../contract/home.dart';
import '../view/home.dart';
import 'homepage.dart';

class HomeScreen extends StatefulWidget {
  final StatefulNavigationShell navigationShell;
  const HomeScreen({super.key, required this.navigationShell});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    implements HomeControllerContract {
  late final HomeViewContract view;

  @override
  int selectedIndex = 0;

  @override
  List<Widget> widgetOptions = <Widget>[
    HomePageScreen(),
    FarmerScreen(),
    AgronomyScreen(),
    InsightScreen(),
  ];

  @override
  void onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) async {
       loadDataFromServer();
    });
    view = HomeView(controller: this);
  }

  @override
  loadDataFromServer() async {
    var hasUserLoggedInBefore = true;
    if (hasUserLoggedInBefore) {
      setState(() {
        GlobalVariables
            .selectedSyncItems
            .addAll(GlobalVariables().syncItemList);
      });
      context.read<ApiRequestBloc>().add(
          ApiRequestTriggered(apiRequestList: GlobalVariables().syncItemList));
    }
  }

  @override
  Widget build(BuildContext context) {
    return view.build(context);
  }
}
