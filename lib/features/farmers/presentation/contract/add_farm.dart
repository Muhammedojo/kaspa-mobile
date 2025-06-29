import 'package:flutter/material.dart';

import '../../../../core/data/model/farm_coordinate.dart';
import '../../../../core/data/model/farmer.dart';
import '../../../../core/utils/contract.dart';

abstract class AddFarmControllerContract {
  late Farmer farmer;
  late TextEditingController farmAddressController;
  void onDeleteFarmLocationCoordinates(int index);
  late List<Coordinates> currentFarmLocationCoordinates = [];
  TextEditingController? lat, long;
  bool get isFetchingLocation;
  void onAddFarmLocation(BuildContext context);
  void addNewFarm();
}

abstract class AddFarmViewContract extends BaseViewContract {}
