import 'package:flutter/material.dart';

import '../../../../core/data/model/market.dart';
import '../../../../core/data/model/product.dart';
import '../../../../core/utils/contract.dart';

abstract class CreateMarketPriceControllerContract {
  late GlobalKey<FormState> formKey;

  void onSelectCrop(Product? newValue);
  void onSelectMarket(Market? newValue);

  late TextEditingController priceController;
  late Product? selectedCrop;
  late Market? selectedMarket;

 void logPrice();
 void clearScreen();
  
}

abstract class CreateMarketPriceViewContract extends BaseViewContract {}
