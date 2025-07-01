import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kaspa/core/utils/extensions.dart';
import 'package:latlong2/latlong.dart';

import '../../../../core/data/model/farmer.dart';
import '../../../../core/resources/vectors.dart';
import '../../../../core/theme/colors.dart';

class FarmDetailsPage extends StatefulWidget {
  final Farmer farmer;

  const FarmDetailsPage({super.key, required this.farmer});

  @override
  State<FarmDetailsPage> createState() => _FarmDetailsPageState();
}

class _FarmDetailsPageState extends State<FarmDetailsPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  MapController mapController = MapController();
  late List<LatLng> polygonPoints;


  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);

      final polygon = widget.farmer.farmerFarms?[widget.farmer.farmerFarms!.length - 1].polygon;
  if (polygon != null) {
    polygon.loadCoordinatesFromJson();
  }

  polygonPoints = _getPolygonPoints();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  // List<LatLng> _getPolygonPoints() {
  //   try {
  //     final coordinates = widget.farmer.farmerFarms?[0].polygon?.coordinates;

  //     if (coordinates == null || coordinates.isEmpty) {
  //       return [];
  //     }

  //     final polygonCoords = coordinates[0];

  //     if (polygonCoords.isEmpty) {
  //       return [];
  //     }

  //     List<LatLng> points = [];
  //     for (var coord in polygonCoords) {
  //       if (coord.length >= 2) {
  //         double lat = coord[1].toDouble();
  //         double lng = coord[0].toDouble();

  //         if (lat >= -90 && lat <= 90 && lng >= -180 && lng <= 180) {
  //           points.add(LatLng(lat, lng));
  //         }
  //       }
  //     }

  //     return points;
  //   } catch (e) {
  //     return [];
  //   }
  // }

  List<LatLng> _getPolygonPoints() {
  try {
    final coordinates = widget.farmer.farmerFarms?[0].polygon?.coordinates;

    if (coordinates == null || coordinates.isEmpty) return [];

    final polygonCoords = coordinates[0];
    if (polygonCoords.isEmpty) return [];

    return polygonCoords
        .where((coord) => coord.length >= 2)
        .map((coord) => LatLng(coord[1], coord[0]))
        .where((point) =>
            point.latitude >= -90 &&
            point.latitude <= 90 &&
            point.longitude >= -180 &&
            point.longitude <= 180)
        .toList();
  } catch (e) {
    debugPrint('Error in _getPolygonPoints: $e');
    return [];
  }
}

  @override
  Widget build(BuildContext context) {
    debugPrint('Latitude ${widget.farmer.farmerFarms![0].latitude}');
    debugPrint('Latitude ${widget.farmer.farmerFarms![0].longitude}');
    final farmData = widget.farmer;
    final polygonPoints = _getPolygonPoints();

    final farm =
        widget.farmer.farmerFarms?.isNotEmpty == true
            ? farmData.farmerFarms![0]
            : null;

    double centerLat = 9.0765;
    double centerLng = 7.3986;
    try {
      if (farm?.latitude != null && farm!.latitude!.isNotEmpty) {
        centerLat = double.parse(farm.latitude!);
      }
      if (farm?.longitude != null && farm!.longitude!.isNotEmpty) {
        centerLng = double.parse(farm.longitude!);
      }
    } catch (e) {
      debugPrint('Error parsing coordinates: $e');
    }

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.black87,
            size: 20,
          ),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          '${widget.farmer.firstName} ${widget.farmer.lastName}/Farm Location',
          style: TextStyle(
            color: Colors.black87,
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          // Map Section
          Container(
            height: 300.h,
            margin: REdgeInsets.all(16),
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(12)),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: FlutterMap(
                mapController: mapController,
                options: MapOptions(
                  initialCenter: LatLng(centerLat, centerLng),
                  initialZoom: 13.0,
                ),
                children: [
                  TileLayer(
                    urlTemplate:
                        'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                    userAgentPackageName: 'com.kaspa.kaspa',
                  ),
                  if (polygonPoints.isNotEmpty)
                    PolygonLayer(
                      polygons: [
                        Polygon(
                          points: polygonPoints,
                          color: Colors.green.withAlpha((0.3 * 255).toInt()),
                          borderColor: Colors.green,
                          borderStrokeWidth: 1,
                        ),
                      ],
                    ),
                  MarkerLayer(
                    markers: [
                      Marker(
                        point: LatLng(centerLat, centerLng),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.green,
                            shape: BoxShape.circle,
                            border: Border.all(color: Colors.white, width: 3),
                          ),
                          width: 20,
                          height: 20,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),

          Padding(
            padding: REdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              children: [
                SvgPicture.asset(AppIcon.map),
                12.horizontalSpace,
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    '${farm?.address}'.toText(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                    4.verticalSpace,
                    '${farm?.sizeInHa} Hectares'.toText(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ],
                ),
              ],
            ),
          ),

          10.verticalSpace,

          Container(
            margin: REdgeInsets.symmetric(horizontal: 16),
            decoration: BoxDecoration(
              color: Colors.grey[100],
              borderRadius: BorderRadius.circular(8),
            ),
            child: TabBar(
              controller: _tabController,
              indicator: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(6.r),
              ),
              indicatorSize: TabBarIndicatorSize.tab,
              indicatorPadding: REdgeInsets.all(4),
              labelColor: AppColors.primaryGreen,
              unselectedLabelColor: Colors.grey[600],
              labelStyle: TextStyle(
                fontSize: 12.sp,
                fontFamily: 'Nunito',
                fontWeight: FontWeight.w700,
                color: AppColors.primaryGreen,
              ),
              unselectedLabelStyle: TextStyle(
                fontSize: 12.sp,
                fontFamily: 'Nunito',
                fontWeight: FontWeight.w700,
              ),
              tabs: const [
                Tab(text: 'Farm Details'),
                Tab(text: 'Coordinates'),
                Tab(text: 'Soil Profile'),
              ],
            ),
          ),

          // Tab Content
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                SingleChildScrollView(
                  padding: REdgeInsets.all(16),
                  child: Column(
                    children: [
                      _buildDetailRow(
                        'Farm Size',
                        '${farm?.sizeInHa} Hectares',
                      ),
                      _buildDetailRow('Annual Yield', '1,200,000 Tons'),
                      _buildDetailRow('LGA', widget.farmer.lga?.name ?? 'N/A'),
                      _buildDetailRow(
                        'Ward',
                        widget.farmer.ward?.name ?? 'N/A',
                      ),
                      _buildDetailRow(
                        'Address',
                        farm?.address ?? 'N/A',
                      ),
                    ],
                  ),
                ),

                SingleChildScrollView(
                  padding: REdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                        if (polygonPoints.isEmpty)
                        const Center(
                          child:
                              Text('No coordinates available for this farm.'),
                        )
                      else
                        ...polygonPoints.asMap().entries.map((entry) {
                          int index = entry.key;
                          LatLng point = entry.value;
                          return Container(
                            margin: REdgeInsets.only(bottom: 12),
                            padding: REdgeInsets.all(16),
                            decoration: BoxDecoration(
                              color: Colors.grey[50],
                              borderRadius: BorderRadius.circular(8.r),
                              border: Border.all(color: Colors.grey[200]!),
                            ),
                            child: Row(
                              children: [
                                Container(
                                  width: 30.w,
                                  height: 30.w,
                                  decoration: BoxDecoration(
                                    color: Colors.green,
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  child: Center(
                                    child: 'POINT ${index + 1}'.toText(
                                      fontSize: 12,
                                      translate: false,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                            
                            12.horizontalSpace,
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      'Lat: ${point.latitude.toStringAsFixed(6)}'
                                          .toText(
                                        translate: false,
                                        fontWeight: FontWeight.w600,
                                      ),
                                      'Lng: ${point.longitude.toStringAsFixed(6)}'
                                          .toText(
                                        translate: false,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ],
                                  ),
                                ),
                            ],
                            ),
                          );
                        }),
                   
                   
                    ],
                  ),
                ),

                SingleChildScrollView(
                  padding: REdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildSoilProperty('pH Level', '6.8', 'Optimal'),
                      _buildSoilProperty('Nitrogen', '2.1%', 'Good'),
                      _buildSoilProperty('Phosphorus', '45 ppm', 'Adequate'),
                      _buildSoilProperty('Potassium', '180 ppm', 'High'),
                      _buildSoilProperty('Organic Matter', '3.2%', 'Good'),
                      _buildSoilProperty('Soil Type', 'Loamy', 'Suitable'),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDetailRow(String label, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        label.toText(
          translate: false,
          color: AppColors.accentText,
          fontWeight: FontWeight.w500,
          fontSize: 12,
        ),

        value.toText(
          translate: false,
          fontWeight: FontWeight.w600,
          fontSize: 12,
        ),
      ],
    );
  }

  Widget _buildSoilProperty(String property, String value, String status) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        property.toText(
          translate: false,
          fontWeight: FontWeight.w500,
          fontSize: 12,
          color: AppColors.accentText,
        ),

        value.toText(
          translate: false,
          fontWeight: FontWeight.w600,
          fontSize: 12,
        ),
      ],
    );
  }
}
