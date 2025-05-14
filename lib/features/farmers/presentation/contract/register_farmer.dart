import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../../../../core/data/model/farm_coordinate.dart';
import '../../../../core/data/model/farm_location.dart';
import '../../../../core/data/model/model.dart';
import '../../../../core/data/model/polygon.dart';
import '../../../../core/data/model/product.dart';
import '../../../../core/utils/contract.dart';

abstract class RegisterFarmerControllerContract {
  late GlobalKey<FormState> formKey1;
  late GlobalKey<FormState> formKey2;
  late GlobalKey<FormState> formKey3;
  late GlobalKey<FormState> formKey4;
  late GlobalKey<FormState> formKey5;

  void onSelectGender(String? newValue);
  void onSelectLga(Lga newValue);
  void onSelectLivestock(Product livestock);
  void onSelectCrops(Product crops);
  void onSelectCrop(Crop crop);
  void onSelectWard(Ward newValue);
  void onSelectNokRelationship(String? newValue);
  void onSelectBank(Bank newValue);
  void removeCoordinatePoint(int position);
  void onAddFarmLocation(BuildContext context);
  bool get isFetchingLocation;
  void onGetFarmLocationCoordinates(
    double latitude,
    double longitude,
    int coordinatePosition,
    StateSetter setStateModal,
  );
  void onAddFarmLocationCoordinates(StateSetter setStateModal);
  void onDeleteFarmLocationCoordinates(int index);
  Set<Polygon> farmPolygonsBasedOnFarmLocations = HashSet<Polygon>();

  late TextEditingController firstNameController;
  late TextEditingController lastNameController;
  late TextEditingController phoneNumberController;
  late TextEditingController ninController;
  late TextEditingController bvnController;
  late TextEditingController addressController;
  late TextEditingController cooperativeController;
  late TextEditingController accountNumberController;
  late TextEditingController accountNameController;
  late TextEditingController nokNameController;
  late TextEditingController nokPhoneNumberController;
  late TextEditingController nokAddressController;
  late TextEditingController farmAddressController;
  late TextEditingController nokRelationshipController;
  late TextEditingController bankController;
  late TextEditingController ageController;
  late TextEditingController imageController;
  TextEditingController? lat, long;

  late bool hasSubmitted;
  late double estimatedHectaresOfLand;
  late String tempFolioId;
  late String? selectedGender;
  late String? selectedNokRelationship;
  late Lga? selectedLga;
  late Ward? selectedWard;
  late Bank? selectedBank;
  late Product? selectedLivestock;
  late Product? selectedCrops;
  late Crop? selectedCrop;

  late List<FarmLocation> farmLocations = [];
  late FarmLocation currentFarmLocation;
  late ImagePicker picker;
  late List<Coordinates> currentFarmLocationCoordinates = [];

  late int currentStep;
  late GlobalKey<FormState> formKey;

  void clearScreen();
  void onStepTapped(int index);
  void back();
  void saveFarmer();
  void next(BuildContext context);
}

abstract class RegisterFarmerViewContract extends BaseViewContract {}
