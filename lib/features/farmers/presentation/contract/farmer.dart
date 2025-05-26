import 'package:flutter/material.dart';

import '../../../../core/utils/contract.dart';

abstract class FarmerControllerContract {
  late TextEditingController searchController;
  late bool isSearching;
  late String searchTerm;
  void updateSearchStatus(bool status);
  void searchFarmer(String text);
  void onClearSearch();
}

abstract class FarmerViewContract extends BaseViewContract {}
