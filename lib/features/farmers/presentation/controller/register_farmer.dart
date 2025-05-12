import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:kaspa/core/utils/global_variables.dart';
import '../../../../core/data/model/farm_coordinate.dart';
import '../../../../core/data/model/farm_location.dart';
import '../../../../core/data/model/model.dart';
import '../../../../core/data/model/polygon.dart';
import '../../../../core/data/model/product.dart';
import '../../../../core/utils/date_utils.dart';
import '../../../../core/utils/function.dart';
import '../bloc/create_farmer/create_farmer_cubit.dart';
import '../contract/register_farmer.dart';
import '../view/register_farmer.dart';
import '../widget/farm_location_modal.dart';
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
  late double estimatedHectaresOfLand = 0.0;

  @override
  String? selectedGender;

  @override
  int currentStep = 0;

  @override
  late GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Set<Polygon> farmPolygonsBasedOnFarmLocations = HashSet<Polygon>();

  @override
  String? selectedNokRelationship;

  @override
  Lga? selectedLga;
  @override
  Ward? selectedWard;
  @override
  Bank? selectedBank;
  @override
  Product? selectedLivestock;

  @override
  List<FarmLocation> farmLocations = [];

  @override
  Product? selectedCrops;
  @override
  Crop? selectedCrop;

  @override
  late ImagePicker picker;

  @override
  late TextEditingController imageController;

  @override
  late FarmLocation currentFarmLocation;

  @override
  List<Coordinates> currentFarmLocationCoordinates = [];

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
      addressController.clear();
      ninController.clear();
      bvnController.clear();
    });
  }

  @override
  void removeCoordinatePoint(int position) {
    setState(() {
      farmLocations.removeAt(position);
    });
  }

  @override
  Widget build(BuildContext context) {
    return view.build(context);
  }

  @override
  void onSelectBank(Bank newValue) {
    setState(() {
      selectedBank = newValue;
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

  @override
  void onSelectLivestock(Product? newValue) {
    setState(() {
      selectedLivestock = newValue!;
    });
  }

  @override
  void onSelectCrops(Product? newValue) {
    setState(() {
      selectedCrops = newValue!;
    });
  }

  @override
  void onGetFarmLocationCoordinates(
    double latitude,
    double longitude,
    int coordinatePosition,
    StateSetter setStateModal,
  ) {
    setStateModal(() {
      currentFarmLocationCoordinates[coordinatePosition] = Coordinates(
        latitude: latitude,
        longitude: longitude,
      );
    });
  }

  @override
  void onDeleteFarmLocationCoordinates(
    int coordinatePosition,
    StateSetter setStateModal,
  ) {
    setStateModal(() {
      currentFarmLocationCoordinates.removeAt(coordinatePosition);
      // calculateLandSize();
    });
  }

  @override
  void onAddFarmLocationCoordinates(StateSetter setStateModal) async {
    // Position position = await LocationManager().getCurrentPosition();
    setStateModal(() {
      // currentFarmLocationCoordinates.add(FarmCoordinates(
      //     latitude: position.latitude, longitude: position.longitude)
      //     );
      currentFarmLocationCoordinates.reversed.toList();
      //calculateLandSize();
    });
  }

  @override
  void onSaveFarmLocation({int? selectedFarmLocationIndex}) {
    if (currentFarmLocationCoordinates.isEmpty) {
      Utils.showToastError(context, "farm_points_are_required", '', () {});
      return;
    }

    if (currentFarmLocationCoordinates.length < 4) {
      Utils.showToastError(
        context,
        "minimum_of_4_farm_points_are_required",
        '',
        () {},
      );
      return;
    }

    var location = FarmLocation();
    // location.id = farmLocations.length + 1;
    // location.farmSize = "$estimatedHectaresOfLand";
    // location.farmCoordinates!.clear();
    // location.farmCoordinates!.addAll(currentFarmLocationCoordinates);

    if (currentFarmLocationCoordinates.isNotEmpty) {
      if (location.hasDuplicateCoordinates()) {
        Utils.showToastError(
          context,
          "there_are_duplicate_points_captured_you_need_to_move_to_the_farm_points_to_recapture",
          '',
          () {},
        );
        return;
      }
    }
    Navigator.pop(context);

    if (selectedFarmLocationIndex != null) {
      farmLocations[selectedFarmLocationIndex] = location;
    } else {
      farmLocations.add(location);
    }
    currentFarmLocationCoordinates.clear();
    //_convertFarmLocationsToPolygons();
    //farmer.farms = farmLocations;
  }

    // _convertFarmLocationsToPolygons() {
    // farmPolygonsBasedOnFarmLocations.clear();
    // int counter = 0;
    // for (var farmLocation in farmLocations) {
    //   List<LatLng> farmPoints = [];

    //   for (var farmCoordinate in farmLocation.farmCoordinates!) {
    //     var point = LatLng(farmCoordinate.latitude!, farmCoordinate.longitude!);
    //     farmPoints.add(point);
    //   }
    //   final PolygonId polygonId =
    //       PolygonId('${farmLocation.farmSize}_hectares');
    //   farmPolygonsBasedOnFarmLocations.add(
    //     Polygon(
    //         polygonId: polygonId,
    //         points: farmPoints,
    //         strokeColor: Colors.orange,
    //         strokeWidth: 4,
    //         fillColor: Colors.green,
    //         visible: true,
    //         consumeTapEvents: true,
    //         onTap: () {
    //           _showPopupMenu(counter);
    //         }),
    //   );
    //   counter++;
    // }
  //   setState(() {});
  // }

  @override
  void onAddFarmFarmLocation({int? selectedFarmLocationIndex}) {
    if (selectedFarmLocationIndex != null) {
      currentFarmLocation = farmLocations[selectedFarmLocationIndex];
      // currentFarmLocationCoordinates = currentFarmLocation.!;
    } else {
      currentFarmLocation = FarmLocation();
    }
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) {
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
            return FarmLocationModal(
              onGetCoordinates: (latitude, longitude, position) {
                onGetFarmLocationCoordinates(
                  latitude,
                  longitude,
                  position,
                  setState,
                );
              },
              onDelete: (position) {
                onDeleteFarmLocationCoordinates(position, setState);
              },
              onAddPoint: () {
                onAddFarmLocationCoordinates(setState);
              },
              currentFarmLocationCoordinates: currentFarmLocationCoordinates,
              hectares: estimatedHectaresOfLand,
              onSavePoints: () {
                onSaveFarmLocation(
                  selectedFarmLocationIndex: selectedFarmLocationIndex,
                );
              },
            );
          },
        );
      },
    );
  }

  @override
  void onSelectCrop(Crop? newValue) {
    setState(() {
      selectedCrop = newValue!;
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
    final today = DateTime.now();
    final formattedToday = DateFormat('yyyy-MM-dd').format(today);
    Farmer farmer = Farmer();
    farmer.folioId = tempFolioId;

    farmer.address = addressController.text;
    farmer.age = ageController.text;
    farmer.bvn = bvnController.text;
    farmer.firstName = firstNameController.text;
    farmer.lastName = lastNameController.text;
    farmer.accountNumber = accountNumberController.text;
    farmer.accountName = accountNameController.text;
    farmer.bankId = selectedBank!.pk;
    farmer.nin = ninController.text;
    farmer.nokName = nokNameController.text;
    farmer.nokAddress = nokAddressController.text;
    farmer.nokPhoneNumber = nokPhoneNumberController.text;
    farmer.nokRelationship = selectedNokRelationship.toString();
    farmer.gender = selectedGender.toString();
    farmer.phoneNumber = phoneNumberController.text;
    farmer.wardId = selectedWard!.pk;
    farmer.registrationDate = formattedToday.toString();
    farmer.crop = [selectedCrops!.pk];
    farmer.livestock = [selectedLivestock!.pk];
    farmer.farmLand = [];
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
