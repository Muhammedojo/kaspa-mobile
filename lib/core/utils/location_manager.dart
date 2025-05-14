// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:geolocator/geolocator.dart';
// import 'package:kaspa/core/utils/function.dart';
// import '../data/model/farm_location.dart';
// import '../data/model/polygon.dart';

// class LocationManager {
//   static final LocationManager _instance = LocationManager._internal();

//   factory LocationManager() {
//     return _instance;
//   }

//   LocationManager._internal() {
//     location?.enableBackgroundMode(enable: true);
//     checkIfLocationIsEnabled();
//   }

//   Location? location = Location();
//   bool? _serviceEnabled;
//   PermissionStatus? _permissionGranted;

//   checkIfLocationIsEnabled() async {
//     try {
//       _serviceEnabled = await location?.serviceEnabled();
//       if (!_serviceEnabled!) {
//         _serviceEnabled = await location?.requestService();
//         if (!_serviceEnabled!) {
//           return;
//         }
//       }

//       _permissionGranted = await location?.hasPermission();
//       if (_permissionGranted == PermissionStatus.denied) {
//         _permissionGranted = await location?.requestPermission();
//         if (_permissionGranted != PermissionStatus.granted) {
//           return;
//         }
//       }
//     } catch (e) {
//       debugPrint('An error occurred while checking location: $e');
//     }
//   }

//   Future<LocationData?> getCurrentLocationPosition() async {
//     return await location?.getLocation();
//   }

//   Future<bool> checkLocationPermissionStatus(context) async {
//     try {
//       bool? serviceEnabled = await location?.serviceEnabled();
//       if (_serviceEnabled != null && !serviceEnabled!) {
//         Utils.showToastError(
//           context,
//           "Location services are disabled, kindly enable it",'',(){}
//         );
//         return false;
//       }

//       LocationPermission permission = await Geolocator.checkPermission();
//       if (permission == LocationPermission.denied) {
//         permission = await Geolocator.requestPermission();
//         if (permission == LocationPermission.denied) {
//           Utils.showToastError(
//             context,
//             "Location permissions are denied, kindly enable it",'',(){}
//           );
//           return false;
//         }
//       }
//       if (permission == LocationPermission.deniedForever) {
//        Utils.showToastError(
//             context,
//             "Location permissions are denied, kindly enable it",'',(){}
//           );
//         return false;
//       }

//       return true;
//     } on PlatformException catch (e) {
//       Utils.showToastError(context, "Error: ${e.message}",'', (){});

//       return false;
//     }
//   }

//   Future<bool?> enableBackgroundMode() async {
//     bool? _bgModeEnabled = await location?.isBackgroundModeEnabled();
//     if (_bgModeEnabled == true) {
//       return true;
//     } else {
//       try {
//         await location?.enableBackgroundMode();
//       } catch (e) {
//         debugPrint(e.toString());
//       }
//       try {
//         _bgModeEnabled = await location?.enableBackgroundMode();
//       } catch (e) {
//         debugPrint(e.toString());
//       }
//       // print(_bgModeEnabled); //True!
//       return _bgModeEnabled;
//     }
//   }

//   Future<Position> getCurrentPosition() async {
//     bool serviceEnabled;
//     LocationPermission permission;

//     serviceEnabled = await Geolocator.isLocationServiceEnabled();
//     if (!serviceEnabled) {
//       return Future.error('Location services are disabled.');
//     }

//     permission = await Geolocator.checkPermission();
//     // print('Permission status : $permission');

//     if (permission == LocationPermission.denied) {
//       permission = await Geolocator.requestPermission();
//       if (permission == LocationPermission.denied) {
//         return Future.error('Location permissions are denied');
//       }
//     }
//     if (permission == LocationPermission.deniedForever) {
//       return Future.error(
//           'Location permissions are permanently denied, we cannot request permissions.');
//     }
//     return await Geolocator.getCurrentPosition();
//   }

//   List<Polygon> locations = [
//     Coordinate(id: const Uuid().v1()),
//     Coordinate(id: const Uuid().v1()),
//     Coordinate(id: const Uuid().v1()),
//     Coordinate(id: const Uuid().v1()),
//   ];

//   // List<Coordinate> get locations => _locations;

//   addLocation() {
//     locations.add(Coordinate(id: const Uuid().v1()));
//     // print(locations.length);
//   }

//   removeLocation(String id) {
//     locations.removeWhere((element) => element.id == id);
//   }

//   editLocation(Coordinate coordinate) {
//     locations[locations.indexWhere((element) => element.id == coordinate.id)]
//         .latitude = coordinate.latitude;
//     locations[locations.indexWhere((element) => element.id == coordinate.id)]
//         .longitude = coordinate.longitude;
//   }

//   Future<List<String>?> getStateLgaFromCoordinates(
//       double latitude, double longitude) async {
//     List<Placemark> placemarks =
//         await placemarkFromCoordinates(latitude, longitude);
//     String? state = placemarks.first.administrativeArea;
//     String? lga = placemarks.first.subAdministrativeArea;
//     return [state ?? "", lga ?? ""];
//   }

//   Future checkIfCoordinateIsWithInFarmLocation(List<FarmLocation> farmLocations,
//       double latitude, double longitude) async {
//     var imageLocation = MapToolKit.LatLng(latitude, longitude);
//     for (var farmLocation in farmLocations) {
//       List<MapToolKit.LatLng> currentFarmLands = [];
//       for (var currentFarmLocation in farmLocation.farmCoordinates!) {
//         currentFarmLands.add(MapToolKit.LatLng(
//             currentFarmLocation.latitude!, currentFarmLocation.longitude!));
//       }

//       if (MapToolKit.PolygonUtil.containsLocation(
//           imageLocation, currentFarmLands, false)) {
//         return true;
//       }

//       if (MapToolKit.PolygonUtil.isLocationOnEdge(
//           imageLocation, currentFarmLands, false)) {
//         return true;
//       }

//       if (MapToolKit.PolygonUtil.isLocationOnPath(
//           imageLocation, currentFarmLands, false)) {
//         return true;
//       }
//     }
//     return false;
//   }
// }
