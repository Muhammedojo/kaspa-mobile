import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:kaspa/core/utils/global_variables.dart';

import '../../../../core/data/model/bank.dart';
import '../../../../core/data/model/farmer.dart';
import '../../../../core/data/model/lga.dart';
import '../../../../core/data/model/ward.dart';
import '../../../../core/utils/date_utils.dart';
import '../bloc/create_farmer/create_farmer_cubit.dart';
import '../contract/register_farmer.dart';
import '../view/register_farmer.dart';
import '../widget/farmer_details_preview.dart';

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
  int currentStep = 0;

  @override
  late GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  String? selectedNokRelationship;

  @override
  Lga? selectedLga;
  @override
  Ward? selectedWard;
  @override
  Bank? selectedBank;

  @override
  late ImagePicker picker;

  @override
  late TextEditingController imageController;

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
  onStepTapped(int index) {
    if (formKey.currentState != null && formKey.currentState!.validate()) {
      setState(() {
        currentStep = index;
      });
    }
  }

  @override
  back() {
    if (currentStep > 0) {
      setState(() {
        currentStep--;
      });
    }
  }

  @override
  void next(BuildContext context) {
    final lastStep = currentStep == 4;

    if (lastStep) {
      if (currentStep == 4 && formKey5.currentState!.validate()) {
        showModalBottomSheet(
          context: context,
          isScrollControlled: true,
          builder: (context) {
            return ConstrainedBox(
              constraints: const BoxConstraints(maxHeight: 700),
              child: showFarmerDetailsModal(context, () {
                Navigator.of(context).pop();
                saveFarmer();
              }),
            );
          },
        );
      }
    } else {
      if (currentStep == 0 && formKey1.currentState!.validate()) {
        setState(() {
          currentStep += 1;
        });
      } else if (currentStep == 1 && formKey2.currentState!.validate()) {
        setState(() {
          currentStep += 1;
        });
      } else if (currentStep == 2 && formKey3.currentState!.validate()) {
        setState(() {
          currentStep += 1;
        });
      } else if (currentStep == 3 && formKey4.currentState!.validate()) {
        setState(() {
          currentStep += 1;
        });
      } else if (currentStep == 4 && formKey5.currentState!.validate()) {
        setState(() {
          currentStep += 1;
        });
      }
    }
  }

  @override
  void onSelectLga(Lga? newValue) {
    setState(() {
      selectedLga = newValue!;
    });
  }

  Widget showFarmerDetailsModal(context, Function onProceed) {
    final today = DateTime.now();
    final formattedToday = DateFormat('yyyy-MM-dd').format(today);

    return FarmerConfirmation(
      name: firstNameController.text,
      age: ageController.text,
      proceed: () {
        saveFarmer();
      },
      gender: '$selectedGender',
      phone: phoneNumberController.text,
      address: addressController.text,
      nin: ninController.text,
      lga: selectedLga?.name ?? '',
      ward: selectedWard?.name ?? '',
      registrationDate: formattedToday,
      registrationOfficer: GlobalVariables().currentUser?.fullname ?? 'N/A',
    );
  }

  @override
  Future<void> saveFarmer() async {
    Farmer farmer = Farmer();

    farmer.address = addressController.text;
    farmer.age = ageController.text;
    farmer.bvn = bvnController.text;
    //farmer.cooperative = selectedCooperative;
    farmer.firstName = firstNameController.text;
    farmer.lastName = lastNameController.text;
    farmer.bankDetails?.accountNumber = accountNumberController.text;
    farmer.bankDetails?.accountName = accountNameController.text;
    farmer.bankDetails?.bank?.pk = selectedBank!.pk;
    farmer.nin = ninController.text;
    farmer.nokDetails?.name = nokNameController.text;
    farmer.nokDetails?.address = nokAddressController.text;
    farmer.nokDetails?.phoneNumber = nokPhoneNumberController.text;
    farmer.nokDetails?.relationship = selectedNokRelationship.toString();
    farmer.lga?.pk = selectedLga!.pk;
    farmer.gender = selectedGender.toString();
    farmer.phoneNumber = phoneNumberController.text;
    farmer.ward?.pk = selectedWard!.pk;
    GetIt.I.get<CreateFarmerCubit>().createFarmer(farmer);
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
