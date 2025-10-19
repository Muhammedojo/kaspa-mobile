import 'package:flutter/material.dart';
import '../../../../core/data/model/crop.dart';
import '../../../../core/data/model/lga.dart';
import '../../../../core/data/model/market.dart';
import '../../../../core/utils/contract.dart';

abstract class CreateMarketPriceControllerContract {
  late GlobalKey<FormState> formKey;

  void onSelectCrop(Crop? newValue);
  void onSelectLga(Lga? newValue);
  void onSelectMarket(Market? newValue);

  late TextEditingController volumeController;
  late TextEditingController priceController;
  late Crop? selectedCrop;
  late Market? selectedMarket;
  late Lga? selectedLga;

  void logPrice();
  void clearScreen();
}

abstract class CreateMarketPriceViewContract extends BaseViewContract {}
