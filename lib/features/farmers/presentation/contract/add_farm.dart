import 'package:flutter/material.dart';
import '../../../../core/data/model/farm_coordinate.dart';
import '../../../../core/data/model/farmer.dart';
import '../../../../core/data/model/lga.dart';
import '../../../../core/data/model/ward.dart';
import '../../../../core/utils/contract.dart';

abstract class AddFarmControllerContract {
  late Farmer farmer;
  late TextEditingController farmAddressController;
  void onDeleteFarmLocationCoordinates(int index);
  late List<Coordinates> currentFarmLocationCoordinates = [];
  TextEditingController? lat, long;
  bool get isFetchingLocation;
  void onAddFarmLocation(BuildContext context);
  void addNewFarm(String? folioId);
  late Lga? selectedLga;
  late Ward? selectedWard;
  late GlobalKey<FormState> formKey;
  void onSelectWard(Ward? newValue);
  void onSelectLga(Lga? newValue);

  late String? selectedOwnershipType;
  void onSelectOwnershipType(String? newValue);

  late double estimatedHectaresOfLand;
}

abstract class AddFarmViewContract extends BaseViewContract {}
