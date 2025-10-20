import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../home/presentation/bloc/farm_visit/farm_visit_cubit.dart';
import '../contract/farm_visit.dart';
import '../view/farm_visit.dart';

class FarmVisitScreen extends StatefulWidget {
  const FarmVisitScreen({super.key});

  @override
  State<FarmVisitScreen> createState() => _FarmVisitScreenState();
}

class _FarmVisitScreenState extends State<FarmVisitScreen>
    with WidgetsBindingObserver
    implements FarmVisitControllerContract {
  late final FarmVisitViewContract view;

  @override
  late bool isSearching = false;
  @override
  late TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    isSearching = false;
    super.initState();
    view = FarmVisitView(controller: this);
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      context.read<FarmVisitCubit>().loadFarmVisit();
    }
  }

  @override
  searchCooperative(String text) {}

  @override
  void updateSearchStatus(bool status) {
    setState(() {
      isSearching = status;
    });
  }

  @override
  void onClearSearch() {
    searchController.clear();
    setState(() {
      isSearching = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return view.build(context);
  }
}
