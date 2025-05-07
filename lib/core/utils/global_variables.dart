import 'package:flutter/material.dart';
import 'package:kaspa/core/api/api.dart';
import 'package:kaspa/core/utils/const.dart';

class GlobalVariables {
  static const List<Locale> appLocales = [
    Locale('en', 'US'),
    Locale('fr', 'FR'),
    Locale('sw', 'TZ'),
  ];

  static Set<String> selectedSyncItems = {};
  static Set<String> pulledSyncItems = {};

  static final rootNavigatorKey = GlobalKey<NavigatorState>();
  static final shellNavigatorHomeKey = GlobalKey<NavigatorState>(
    debugLabel: 'Home',
  );

  var syncItemList = <String>[
    farmersListEndpoint,
   // lgaListEndpoint,
    wardListEndpoint,
    cropListEndpoint,
    livestockListEndpoint,
    cooperativeListEndpoint,
    bankListEndpoint,
  ];

  var syncMap = {
    farmersListEndpoint: KEY_FARMERS,
   // lgaListEndpoint: KEY_LGA,
    wardListEndpoint: KEY_WARD,
    cropListEndpoint: KEY_CROPS,
    livestockListEndpoint: KEY_LIVESTOCK,
    cooperativeListEndpoint: KEY_COOPERATIVE,
    bankListEndpoint: KEY_BANK,
  };

  static final shellNavigatorFarmerKey = GlobalKey<NavigatorState>(
    debugLabel: 'Farmer',
  );
  static final shellNavigatorCooperativeKey = GlobalKey<NavigatorState>(
    debugLabel: 'Cooperative',
  );
  static final shellNavigatorInsightKey = GlobalKey<NavigatorState>(
    debugLabel: 'Insight',
  );
}
