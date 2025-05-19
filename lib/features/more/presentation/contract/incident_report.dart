import 'package:flutter/material.dart';

import '../../../../core/utils/contract.dart';

abstract class IncidentReportControllerContract {
      late TextEditingController searchController;
  late bool isSearching;
  void updateSearchStatus(bool status);
  void searchCooperative(String text);
  void onClearSearch();
}

abstract class IncidentReportViewContract extends BaseViewContract {}
