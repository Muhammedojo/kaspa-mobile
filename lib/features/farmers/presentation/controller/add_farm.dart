import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get_it/get_it.dart';
import 'package:kaspa/core/data/model/farm.dart';
import '../../../../core/data/model/farm_coordinate.dart';
import '../../../../core/data/model/farmer.dart';
import '../../../../core/data/model/lga.dart';
import '../../../../core/data/model/ward.dart';
import '../../../../core/utils/function.dart';
import '../../../home/presentation/bloc/farm/farm_cubit.dart';
import '../contract/add_farm.dart';
import '../view/add_farm.dart';

class AddFarmScreen extends StatefulWidget {
  final Farmer farmer;
  const AddFarmScreen({super.key, required this.farmer});

  @override
  State<AddFarmScreen> createState() => _AddFarmScreenState();
}

class _AddFarmScreenState extends State<AddFarmScreen>
    implements AddFarmControllerContract {
  late final AddFarmViewContract view;

  @override
  late TextEditingController farmAddressController;

  @override
  TextEditingController? lat = TextEditingController();

  @override
  TextEditingController? long = TextEditingController();

  @override
  List<Coordinates> currentFarmLocationCoordinates = [];

  @override
  late GlobalKey<FormState> formKey;

  @override
  Lga? selectedLga;
  @override
  Ward? selectedWard;

  @override
  void initState() {
    super.initState();
    farmer = widget.farmer;
    view = AddFarmView(controller: this);
    formKey = GlobalKey<FormState>();
    farmAddressController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return view.build(context);
  }

  late bool _isFetchingLocation = false;

  @override
  void onSelectLga(Lga? newValue) {
    setState(() {
      if (selectedLga?.pk != newValue?.pk) {
        selectedWard = null;
      }
      selectedLga = newValue;
    });
  }

  @override
  void onSelectWard(Ward? newValue) {
    setState(() {
      selectedWard = newValue;
    });
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
  void addNewFarm() async {
    if (!formKey.currentState!.validate()) {
      return;
    }

    if (selectedWard == null) {
      Utils.showToastError(context, 'Please select a ward.', '', () {});
      return;
    }

    if (currentFarmLocationCoordinates.length < 4) {
      Utils.showToastError(
        context,
        "A minimum of 4 points are required to create a farm polygon.",
        '',
        () {},
      );
      return;
    }

    Farm farm = Farm();
    farm.address = farmAddressController.text.trim();
    farm.wardId = selectedWard!.pk;
    farm.sizeInHa = "0";
    farm.ownershipType = "Leased";

    final firstCoordinate = currentFarmLocationCoordinates.first;
    farm.longitude = firstCoordinate.longitude.toString();
    farm.latitude = firstCoordinate.latitude.toString();

    List<List<double>> polygonRing =
        currentFarmLocationCoordinates
            .map((coord) => [coord.longitude!, coord.latitude!])
            .toList();

    if (polygonRing.first.first != polygonRing.last.first ||
        polygonRing.first.last != polygonRing.last.last) {
      polygonRing.add(List.from(polygonRing.first));
    }

    Map<String, dynamic> polygonData = {
      "coordinates": [polygonRing],
    };
    farm.polygon = jsonEncode(polygonData);

    GetIt.I.get<FarmCubit>().createFarm(farm, folioId: farmer.folioId);
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
  bool get isFetchingLocation => _isFetchingLocation;

  @override
  Farmer farmer = Farmer();
}
