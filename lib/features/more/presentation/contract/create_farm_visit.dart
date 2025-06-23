import 'package:flutter/material.dart';
import '../../../../core/data/model/farmer.dart';
import '../../../../core/data/model/plot.dart';
import '../../../../core/data/model/product.dart';
import '../../../../core/utils/contract.dart';

abstract class CreateFarmVisitControllerContract {
  late GlobalKey<FormState> formKey;

  void onSelectCrop(Product? newValue);
  void onSelectFarmer(Farmer? newValue);
  late Farmer? selectedFarmer;
  void onSelectPlot(Plot? newValue);
  late TextEditingController aolController;
  late TextEditingController totalAOLController;
  late Product? selectedCrop;
  late Plot? selectedPlot;

  void logVisit();
  void clearScreen();
}

abstract class CreateFarmVisitViewContract extends BaseViewContract {}
