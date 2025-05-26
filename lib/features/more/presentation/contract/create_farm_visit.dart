import 'package:flutter/material.dart';

import '../../../../core/data/model/farmer.dart';
import '../../../../core/data/model/market.dart';
import '../../../../core/data/model/plot.dart';
import '../../../../core/data/model/product.dart';
import '../../../../core/utils/contract.dart';

abstract class CreateFarmVisitControllerContract {
  late GlobalKey<FormState> formKey;

  void onSelectCrop(Product? newValue);
  void onSelectMarket(Market? newValue);
  void onSelectFarmer(Farmer? newValue);
  void onSelectPlot(Plot? newValue);
  late TextEditingController priceController;
  late Product? selectedCrop;
  late Market? selectedMarket;
  late Farmer? selectedFarmer;
    late Plot? selectedPlot;

  void logVisit();
  void clearScreen();
}

abstract class CreateFarmVisitViewContract extends BaseViewContract {}
