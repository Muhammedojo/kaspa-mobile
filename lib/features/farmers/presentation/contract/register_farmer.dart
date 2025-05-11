import 'package:flutter/material.dart';
import '../../../../core/data/model/bank.dart';
import '../../../../core/data/model/lga.dart';
import '../../../../core/data/model/ward.dart';
import '../../../../core/utils/contract.dart';

abstract class RegisterFarmerControllerContract {
  late GlobalKey<FormState> formKey1;
  late GlobalKey<FormState> formKey2;
  late GlobalKey<FormState> formKey3;
  late GlobalKey<FormState> formKey4;
  late GlobalKey<FormState> formKey5;

  void onSelectGender(String? newValue);
  void onSelectLga(Lga? newValue);
  void onSelectWard(Ward? newValue);
  void onSelectNokRelationship(String? newValue);
  void onSelectBank(Bank? newValue);

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
  late TextEditingController nokRelationshipController;
  late TextEditingController bankController;
  late TextEditingController ageController;

  late bool hasSubmitted;
  late String tempFolioId;
  late String? selectedGender;
  late String? selectedNokRelationship;
  late Lga? selectedLga;
  late Ward? selectedWard;
  late Bank? selectedBank;

  late int currentStep;
  late GlobalKey<FormState> formKey;

  void clearScreen();
  void onStepTapped(int index);
  void back();
  void saveFarmer();
  void next(BuildContext context);
}

abstract class RegisterFarmerViewContract extends BaseViewContract {}
