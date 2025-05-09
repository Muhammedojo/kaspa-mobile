import 'package:flutter/material.dart';

import '../../../../core/utils/contract.dart';

abstract class CooperativeControllerContract {
      late TextEditingController searchController;
  late bool isSearching;
  void updateSearchStatus(bool status);
  void searchCooperative(String text);
  void onClearSearch();
}

abstract class CooperativeViewContract extends BaseViewContract {}
