import 'package:flutter/material.dart';

import '../contract/farmer.dart';
import '../view/farmer.dart';

class FarmerScreen extends StatefulWidget {
  const FarmerScreen({super.key});

  @override
  State<FarmerScreen> createState() => _FarmerScreenState();
}

class _FarmerScreenState extends State<FarmerScreen>
    implements FarmerControllerContract {
  late final FarmerViewContract view;

  @override
  late TextEditingController searchController = TextEditingController();

  @override
  late bool isSearching = false;

  @override
  void initState() {
    isSearching = false;
    super.initState();
    view = FarmerView(controller: this);
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  searchFarmer(String text) {
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
