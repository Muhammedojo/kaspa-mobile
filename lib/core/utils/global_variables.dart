import 'package:flutter/material.dart';
import 'package:kaspa/core/api/api.dart';
import 'package:kaspa/core/utils/const.dart';

import '../data/model/login.dart';

class GlobalVariables {
  static const List<Locale> appLocales = [
    Locale('en', 'US'),
    Locale('fr', 'FR'),
    Locale('sw', 'TZ'),
  ];

  var genderList = ["Male", "Female"];

  var nokRelationshipList = [
    "Brother",
    "Sister",
    "Mother",
    "Father",
    "Uncle",
    "Aunty",
    "Son",
    "Daughter",
    "Husband",
    "Wife"
  ];

  static Set<String> selectedSyncItems = {};
  static Set<String> pulledSyncItems = {};

  Login? currentUser;

  static final rootNavigatorKey = GlobalKey<NavigatorState>();
  static final shellNavigatorHomeKey = GlobalKey<NavigatorState>(
    debugLabel: 'Home',
  );

  var syncItemList = <String>[
    livestockListEndpoint,
    wardListEndpoint,
    weatherListEndpoint,
    marketListEndpoint,
    marketPriceListEndpoint,
    cropListEndpoint,
    lgaListEndpoint,
    productListEndpoint,
    dashboardEndpoint,
    dashboardFarmerEndpoint,
    farmersListEndpoint,
    cooperativeListEndpoint,
    bankListEndpoint,
  ];

  var syncMap = <String, String>{
    livestockListEndpoint: KEY_LIVESTOCK,
    wardListEndpoint: KEY_WARD,
    weatherListEndpoint: KEY_WEATHER,
    marketListEndpoint: KEY_MARKET,
    marketPriceListEndpoint: KEY_MARKET_PRICE,
    cropListEndpoint: KEY_CROPS,
    lgaListEndpoint: KEY_LGA,
    productListEndpoint: KEY_PRODUCT,
    dashboardEndpoint: KEY_INSIGHT,
    dashboardFarmerEndpoint: KEY_DASHBOARD,
    farmersListEndpoint: KEY_FARMER,
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
