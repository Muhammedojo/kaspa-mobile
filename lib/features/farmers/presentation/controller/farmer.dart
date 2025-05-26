import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:kaspa/features/farmers/presentation/bloc/get_farmer/get_farmer_cubit.dart';
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
  late String searchTerm = "";

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
    searchTerm = text;
    if (mounted) {
      GetIt.I.get<GetFarmersCubit>().loadFarmersFromDb(
        searchTerm: text.toLowerCase(),
        isSearching: true,
      );
    }
  }

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
