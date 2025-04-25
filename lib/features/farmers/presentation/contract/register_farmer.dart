import 'package:flutter/material.dart';
import '../../../../core/utils/contract.dart';

abstract class RegisterFarmerControllerContract {
  late GlobalKey<FormState> formKey;

  late TextEditingController firstNameController;

  late TextEditingController lastNameController;

  late TextEditingController phoneNumberController;

  late TextEditingController cooperativeController;

  late TextEditingController accountNumberController;

  late TextEditingController accountNameController;

  late TextEditingController nokNameController;

  late TextEditingController nokPhoneNumberController;

  late TextEditingController nokAddressController;

  late TextEditingController nokRelationshipController;

  late TextEditingController bankController;

  late bool hasSubmitted;

  late String tempFolioId;

  void clearScreen();
}

abstract class RegisterFarmerViewContract extends BaseViewContract {}
