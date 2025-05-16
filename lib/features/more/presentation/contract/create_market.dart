import 'package:flutter/material.dart';

import '../../../../core/data/model/lga.dart';
import '../../../../core/data/model/ward.dart';
import '../../../../core/utils/contract.dart';

abstract class CreateMarketControllerContract {
  late GlobalKey<FormState> formKey;

  void onSelectWard(Ward? newValue);
  void onSelectLga(Lga? newValue);

  late TextEditingController nameController;
  late TextEditingController addressController;
  late TextEditingController sizeController;
  late TextEditingController marketDaysController;
  late TextEditingController marketTypeController;

  late Ward? selectedWard;
  late Lga? selectedLga;

  void createMarket();
  void clearScreen();
}

abstract class CreateMarketViewContract extends BaseViewContract {}
