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
    "Wife",
  ];

  static Set<String> selectedSyncItems = {};
  static Set<String> pulledSyncItems = {};

  Login? currentUser;

  var syncItemList = <String>[
    livestockListEndpoint,
    wardListEndpoint,
   // weatherListEndpoint,
    marketListEndpoint,
    marketPriceListEndpoint,
    cropListEndpoint,
    bankListEndpoint,
    lgaListEndpoint,
    lgaWeatherListEndpoint,
    productListEndpoint,
    incidentReportListEndpoint,
    dashboardEndpoint,
    dashboardFarmerEndpoint,
    farmersListEndpoint,
    cooperativeListEndpoint,
    cropCalendarListEndpoint,
  ];

  var syncMap = {
    livestockListEndpoint: KEY_LIVESTOCK,
    wardListEndpoint: KEY_WARD,
    //weatherListEndpoint: KEY_WEATHER,
    marketListEndpoint: KEY_MARKET,
    marketPriceListEndpoint: KEY_MARKET_PRICE,
    cropListEndpoint: KEY_CROPS,
    bankListEndpoint: KEY_BANK,
    lgaListEndpoint: KEY_LGA,
    lgaWeatherListEndpoint: KEY_LGA_WEATHER,
    productListEndpoint: KEY_PRODUCT,
    incidentReportListEndpoint: KEY_INCIDENT,
    dashboardEndpoint: KEY_INSIGHT,
    dashboardFarmerEndpoint: KEY_DASHBOARD,
    farmersListEndpoint: KEY_FARMER,
    cooperativeListEndpoint: KEY_COOPERATIVE,
    cropCalendarListEndpoint: KEY_CROP_CALENDAR,
  };

  static final rootNavigatorKey = GlobalKey<NavigatorState>();
  static final shellNavigatorHomeKey = GlobalKey<NavigatorState>(
    debugLabel: 'Home',
  );

  static final shellNavigatorFarmerKey = GlobalKey<NavigatorState>(
    debugLabel: 'Farmer',
  );
  static final shellNavigatorCooperativeKey = GlobalKey<NavigatorState>(
    debugLabel: 'Cooperative',
  );
  static final shellNavigatorCalendarKey = GlobalKey<NavigatorState>(
    debugLabel: 'Calendar',
  );
}
