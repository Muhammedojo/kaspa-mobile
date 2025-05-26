import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import '../../../home/presentation/bloc/cooperative/cooperative_cubit.dart';
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
  late String searchTerm = "";

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
    searchController.dispose();
    super.dispose();
  }

  @override
  searchCooperative(String text) {
    searchTerm = text;
    if (mounted) {
      GetIt.I.get<CooperativeCubit>().loadCooperativesFromDb(
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
