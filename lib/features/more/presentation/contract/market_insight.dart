import 'package:flutter/material.dart';
import '../../../../core/data/model/market_data.dart';
import '../../../../core/utils/contract.dart';

abstract class MarketInsightControllerContract {
  late TextEditingController searchController;
  late bool isSearching;
  void updateSearchStatus(bool status);
  void searchCooperative(String text);
  void onClearSearch();
  void previewLogModal(MarketData data);
}

abstract class MarketInsightViewContract extends BaseViewContract {}
