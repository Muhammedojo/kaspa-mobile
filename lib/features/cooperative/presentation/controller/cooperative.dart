import 'package:flutter/material.dart';

import '../contract/cooperative.dart';
import '../view/cooperative.dart';


class CooperativeScreen extends StatefulWidget {
  const CooperativeScreen({super.key});

  @override
  State<CooperativeScreen> createState() => _CooperativeScreenState();
}

class _CooperativeScreenState extends State<CooperativeScreen>
    implements CooperativeControllerContract {
  late final CooperativeViewContract view;

  @override
  late bool isSearching = false;
  @override
  late TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    isSearching = false;
    super.initState();
    view = CooperativeView(controller: this);
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
