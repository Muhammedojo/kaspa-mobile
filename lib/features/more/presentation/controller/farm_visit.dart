import 'package:flutter/material.dart';
import '../contract/farm_visit.dart';
import '../view/farm_visit.dart';


class FarmVisitScreen extends StatefulWidget {
  const FarmVisitScreen({super.key});

  @override
  State<FarmVisitScreen> createState() => _FarmVisitScreenState();
}

class _FarmVisitScreenState extends State<FarmVisitScreen>
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
  }

  @override
  void dispose() {
    super.dispose();
  }

    @override
  searchCooperative(String text) {
    // if(text.isNotEmpty) {
    //   GetIt.I.get<SearchFarmerCubit>().searchFarmers(text);
    // }
  }

   @override
  void updateSearchStatus(bool status){
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

