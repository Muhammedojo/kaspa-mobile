import 'package:flutter/material.dart';
import '../../../../core/data/model/incident_report.dart';
import '../../../../core/utils/contract.dart';

abstract class IncidentReportControllerContract {
      late TextEditingController searchController;
  late bool isSearching;
  void updateSearchStatus(bool status);
  void searchCooperative(String text);
  void onClearSearch();
  void previewLogModal(IncidentReport data);
}

abstract class IncidentReportViewContract extends BaseViewContract {}
