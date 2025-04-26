import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../../../../core/utils/date_utils.dart';
import '../contract/register_farmer.dart';
import '../view/register_farmer.dart';

class RegisterFarmerScreen extends StatefulWidget {
  const RegisterFarmerScreen({super.key});

  @override
  State<RegisterFarmerScreen> createState() => _RegisterFarmerScreenState();
}

class _RegisterFarmerScreenState extends State<RegisterFarmerScreen>
    implements RegisterFarmerControllerContract {
  late final RegisterFarmerViewContract view;

  @override
  late GlobalKey<FormState> formKey;

  @override
  late TextEditingController firstNameController;

  @override
  late TextEditingController lastNameController;

  @override
  late TextEditingController phoneNumberController;

  @override
  late TextEditingController cooperativeController;

  @override
  late TextEditingController accountNumberController;

  @override
  late TextEditingController accountNameController;

  @override
  late TextEditingController nokNameController;

  @override
  late TextEditingController nokPhoneNumberController;

  @override
  late TextEditingController nokAddressController;

  @override
  late TextEditingController nokRelationshipController;

  @override
  late TextEditingController bankController;

  @override
  late bool hasSubmitted = false;

  @override
  late String tempFolioId;

  @override
  void initState() {
    hasSubmitted = false;
    tempFolioId = generateTempFolioId();
    super.initState();
    view = RegisterFarmerView(controller: this);
    formKey = GlobalKey<FormState>();
    firstNameController = TextEditingController();
    lastNameController = TextEditingController();
    phoneNumberController = TextEditingController();
    cooperativeController = TextEditingController();
    accountNumberController = TextEditingController();
    accountNameController = TextEditingController();
    nokNameController = TextEditingController();
    nokPhoneNumberController = TextEditingController();
    nokAddressController = TextEditingController();
    nokRelationshipController = TextEditingController();
    bankController = TextEditingController();
  }

  @override
  void dispose() {
    firstNameController.dispose();
    lastNameController.dispose();
    phoneNumberController.dispose();
    cooperativeController.dispose();
    accountNumberController.dispose();
    accountNameController.dispose();
    nokNameController.dispose();
    nokPhoneNumberController.dispose();
    nokAddressController.dispose();
    nokRelationshipController.dispose();
    bankController.dispose();
    super.dispose();
  }

  String generateTempFolioId() {
    int userId = GetIt.I.get<int>(instanceName: "userId");
    return "$userId-${DateAndTimeUtil.getCurrentTimeStamp()}";
  }

  @override
  void clearScreen() {
    setState(() {
    firstNameController.clear();
    lastNameController.clear();
    phoneNumberController.clear();
    cooperativeController.clear();
    accountNumberController.clear();
    accountNameController.clear();
    nokNameController.clear();
    nokPhoneNumberController.clear();
    nokAddressController.clear();
    nokRelationshipController.clear();
    bankController.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return view.build(context);
  }
}
