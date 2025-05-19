import 'dart:collection';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get_it/get_it.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import '../../../../core/utils/global_variables.dart';
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
  late TextEditingController farmAddressController;
  @override
  late TextEditingController nokRelationshipController;
  @override
  late TextEditingController bankController;
  @override
  late TextEditingController ageController;

  @override
  TextEditingController? lat = TextEditingController();

  @override
  TextEditingController? long = TextEditingController();

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
  List<Product> selectedCropsList = [];


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
    farmAddressController = TextEditingController();
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
    farmAddressController.dispose();
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
      farmAddressController.clear();
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
  void onSelectBank(Bank? newValue) {
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

  setLocation() async {
    permission = await Geolocator.checkPermission();
  }

  LocationPermission? permission;

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
        if (currentFarmLocationCoordinates.isNotEmpty &&
            currentFarmLocationCoordinates.length < 4) {
          Utils.showToastError(
            context,
            "Minimum of 4 farm points are required if you start adding them.",
            '',
            () {
              Navigator.pop(context);
            },
          );
          return;
        }
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
       if (selectedLga?.pk != newValue?.pk) {
        selectedWard = null;
      }
      selectedLga = newValue;
    });
  }

  late bool _isFetchingLocation = false;

  @override
  bool get isFetchingLocation => _isFetchingLocation;

  @override
  void onSelectLivestock(Product? newValue) {
    setState(() {
      selectedLivestock = newValue;
    });
  }

  @override
  void onSelectCrops(Product? newValue) {
    setState(() {
      selectedCrops = newValue;
    });
  }

  @override
  void updateSelectedCrops(List<Product> crops) {
    setState(() {
      selectedCropsList = crops;
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
  void onDeleteFarmLocationCoordinates(int index) {
    if (currentFarmLocationCoordinates.isNotEmpty) {
      setState(() {
        currentFarmLocationCoordinates.removeLast();
      });
    }
  }

  @override
  void onAddFarmLocationCoordinates(StateSetter setStateModal) async {
    if (lat!.text.isNotEmpty && long!.text.isNotEmpty) {
      setStateModal(() {
        currentFarmLocationCoordinates.add(
          Coordinates(
            latitude: double.parse(lat!.text),
            longitude: double.parse(long!.text),
          ),
        );
        lat!.clear();
        long!.clear();
      });
    } else {
      Utils.showToastError(
        context,
        '',
        'Kindly get your current point ',
        () {},
      );
    }
  }

  @override
  void onAddFarmLocation(BuildContext context) async {
    if (_isFetchingLocation) return;

    setState(() {
      _isFetchingLocation = true;
    });

    LocationPermission permission = await Geolocator.checkPermission();

    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
    }

    try {
      if (permission == LocationPermission.whileInUse ||
          permission == LocationPermission.always) {
        try {
          Position position = await Geolocator.getCurrentPosition(
            locationSettings: LocationSettings(
              accuracy: LocationAccuracy.high,
              timeLimit: const Duration(seconds: 15),
            ),
          );

          final newCoordinate = Coordinates(
            latitude: position.latitude,
            longitude: position.longitude,
          );
          if (Utils.isDuplicateCoordinate(
            currentFarmLocationCoordinates,
            newCoordinate,
          )) {
            if (mounted) {
              Utils.showToastError(
                this.context,
                'Multiple Coordinate Detected',
                'close',
                () {},
              );
            }
            return;
          }

          if (mounted) {
            setState(() {
              lat!.text = position.latitude.toString();
              long!.text = position.longitude.toString();
              currentFarmLocationCoordinates.add(
                Coordinates(
                  latitude: position.latitude,
                  longitude: position.longitude,
                ),
              );
            });
          }
        } catch (e) {
          debugPrint("Error fetching location: ${e.toString()}");
          if (mounted) {
            Utils.showToastError(
              this.context,
              "Error fetching location: ${e.toString()}",
              '',
              () {},
            );
          }
        }
      } else {
        if (mounted) {
          Utils.showToastError(
            this.context,
            "Location permission is required to add farm points.",
            '',
            () {},
          );
        }
        debugPrint("Location permission not granted: $permission");
      }
    } finally {
      if (mounted) {
        setState(() {
          _isFetchingLocation = false;
        });
      }
    }
  }

  @override
  void onSelectCrop(Crop? newValue) {
    setState(() {
      selectedCrop = newValue;
    });
  }

  Widget showFarmerDetailsModal(context, Function onProceed) {
    final today = DateTime.now();
    final formattedToday = DateFormat('yyyy-MM-dd').format(today);

    return FarmerConfirmation(
      fName: firstNameController.text,
      lName: lastNameController.text,
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
    // farmer.farmLand = [];

    List<Map<String, dynamic>> farmsPayload = [];
    if (currentFarmLocationCoordinates.isNotEmpty) {
      // Ensure there are enough points for a polygon (as per your existing validation)
      // if (currentFarmLocationCoordinates.length < 4) {
      //   Utils.showToastError(
      //     context, // Assuming context is available here
      //     "Minimum of 4 farm points are required to save farm details.",
      //     '',
      //     () {},
      //   );
      // Potentially return or handle this error appropriately
      // For now, we'll proceed but the polygon might be invalid for the backend

      // }

      List<List<double>> polygonRing =
          currentFarmLocationCoordinates
              .map((coord) => [coord.longitude!, coord.latitude!])
              .toList();

      if (polygonRing.isNotEmpty &&
          (polygonRing.first.first != polygonRing.last.first ||
              polygonRing.first.last != polygonRing.last.last)) {
        polygonRing.add(List.from(polygonRing.first));
      }

      Map<String, dynamic> farmData = {
        "address": farmAddressController.text,
        "ward_id": selectedWard?.pk,
        "size_in_ha": estimatedHectaresOfLand,
        "ownership_type": "Owned",
        "longitude": currentFarmLocationCoordinates.first.longitude,
        "latitude": currentFarmLocationCoordinates.first.latitude,
        "polygon": {
          "coordinates": [polygonRing],
        },
      };
      farmsPayload.add(farmData);
    }

    farmer.farms = farmsPayload;

    GetIt.I.get<CreateFarmerCubit>().createFarmer(farmer);
  }

  @override
  void onSelectNokRelationship(String? newValue) {
    setState(() {
      selectedNokRelationship = newValue;
    });
  }

  @override
  void onSelectWard(Ward? newValue) {
    setState(() {
      selectedWard = newValue;
    });
  }
}
