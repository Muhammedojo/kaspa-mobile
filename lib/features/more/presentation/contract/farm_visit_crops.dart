import 'package:flutter/material.dart';

import '../../../../core/data/model/farm_visit.dart';
import '../../../../core/data/model/product.dart';
import '../../../../core/utils/contract.dart';

abstract class FarmVisitCropsControllerContract {
  late FarmVisit visit;
  late GlobalKey<FormState> formKey;
  late TextEditingController aolController;
  void onSelectCrop(Product? newValue);
  late Product? selectedCrop;

  void addCrop();
}

abstract class FarmVisitCropsViewContract extends BaseViewContract {}
