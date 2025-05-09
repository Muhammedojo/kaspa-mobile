import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../../../../core/data/model/bank.dart';
import '../../../../core/data/model/lga.dart';
import '../../../../core/data/model/ward.dart';
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
  late GlobalKey<FormState> formKey1;
  @override
  late GlobalKey<FormState> formKey2;
  @override
  late GlobalKey<FormState> formKey3;
  @override
  late GlobalKey<FormState> formKey4;
  @override
  late GlobalKey<FormState> formKey5;

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
  late TextEditingController ninController;
   @override
  late TextEditingController addressController;
  @override
  late TextEditingController bvnController;
  @override
  late TextEditingController nokPhoneNumberController;
  @override
  late TextEditingController nokAddressController;
  @override
  late TextEditingController nokRelationshipController;
  @override
  late TextEditingController bankController;
   @override
  late TextEditingController ageController;

  @override
  late bool hasSubmitted = false;
  @override
  late String tempFolioId;

  @override
  String? selectedGender;

  @override
  String? selectedNokRelationship;

  @override
  Lga? selectedLga;
  @override
  Ward? selectedWard;
  @override
  Bank? selectedBank;

  @override
  void initState() {
    hasSubmitted = false;
    tempFolioId = generateTempFolioId();
    super.initState();
    view = RegisterFarmerView(controller: this);
    formKey1 = GlobalKey<FormState>();
    formKey2 = GlobalKey<FormState>();
    formKey3 = GlobalKey<FormState>();
    formKey4 = GlobalKey<FormState>();
    formKey5 = GlobalKey<FormState>();
    firstNameController = TextEditingController();
    lastNameController = TextEditingController();
    phoneNumberController = TextEditingController();
    ninController = TextEditingController();
    bvnController = TextEditingController();
    cooperativeController = TextEditingController();
    accountNumberController = TextEditingController();
    accountNameController = TextEditingController();
    nokNameController = TextEditingController();
    ageController = TextEditingController();
    addressController = TextEditingController();
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
    addressController.dispose();
    ninController.dispose();
    ageController.dispose();
    bvnController.dispose();
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
      ageController.clear();
      nokRelationshipController.clear();
      bankController.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return view.build(context);
  }

  @override
  void onSelectBank(Bank? newValue) {
    setState(() {
      selectedBank = newValue!;
    });
  }

  @override
  void onSelectGender(String? newValue) {
    setState(() {
      selectedGender = newValue!;
    });
  }

  @override
  void onSelectLga(Lga? newValue) {
    setState(() {
      selectedLga = newValue!;
    });
  }

  @override
  void onSelectNokRelationship(String? newValue) {
    setState(() {
      selectedNokRelationship = newValue!;
    });
  }

  @override
  void onSelectWard(Ward? newValue) {
    setState(() {
      selectedWard = newValue!;
    });
  }
}
