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

  var categoryList = ["Security", "Pest Attack", "Weather", "Other"];

   var ownershipTypeList = ["Owned", "Leased"];


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

  List<String> farmerInformation = [
    'Personal Information',
    'Next of Kin Information',
    'Financial Information',
    'Farm Information',
    'Farm Information',
    'Profile Picture',
  ];

  static Set<String> selectedSyncItems = {};
  static Set<String> pulledSyncItems = {};

  Login? currentUser;

  var syncItemList = <String>[
    "",
    livestockListEndpoint,
    wardListEndpoint,
    marketListEndpoint,
    marketPriceListEndpoint,
    notificationListEndpoint,
    cropListEndpoint,
    bankListEndpoint,
    lgaListEndpoint,
    lgaWeatherListEndpoint,
    productListEndpoint,
    incidentReportListEndpoint,
    dashboardEndpoint,
    dashboardFarmerEndpoint,
    farmersListEndpoint,
    plotListEndpoint,
    farmVisitListEndpoint,
    farmCropActivityListEndpoint,
    cropCalendarListEndpoint,
    cooperativeListEndpoint,
    cropCalendarListEndpoint,
    feoListEndpoint,
  ];

  var syncMap = {
    "": "",
    livestockListEndpoint: KEY_LIVESTOCK,
    wardListEndpoint: KEY_WARD,
    marketListEndpoint: KEY_MARKET,
    marketPriceListEndpoint: KEY_MARKET_PRICE,
    notificationListEndpoint: KEY_NOTIFICATION,
    cropListEndpoint: KEY_CROPS,
    bankListEndpoint: KEY_BANK,
    lgaListEndpoint: KEY_LGA,
    lgaWeatherListEndpoint: KEY_LGA_WEATHER,
    productListEndpoint: KEY_PRODUCT,
    incidentReportListEndpoint: KEY_INCIDENT,
    dashboardEndpoint: KEY_INSIGHT,
    dashboardFarmerEndpoint: KEY_DASHBOARD,
    farmersListEndpoint: KEY_FARMER,
    plotListEndpoint: KEY_PLOT,
    farmCropActivityListEndpoint: KEY_FARM_CROP_ACTIVITY,
    farmVisitListEndpoint: KEY_FARM_VISIT,
    cropCalendarListEndpoint: KEY_CROP_CALENDAR,
    cooperativeListEndpoint: KEY_COOPERATIVE,
    feoListEndpoint: KEY_FEO,
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
