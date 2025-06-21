import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/data/model/insight.dart';
import '../../../home/presentation/bloc/farm_crop_activity/farm_crop_activity_cubit.dart';
import '../contract/crop_activities.dart';
import '../view/crop_activities.dart';

class CropActivitiesScreen extends StatefulWidget {
  final FarmCrop farmCrop;
  const CropActivitiesScreen({super.key, required this.farmCrop});

  @override
  State<CropActivitiesScreen> createState() => _CropActivitiesScreenState();
}

class _CropActivitiesScreenState extends State<CropActivitiesScreen>
    implements CropActivitiesControllerContract {
  late final CropActivitiesViewContract view;

  @override
  late FarmCrop farmCrop;

  @override
  void initState() {
    super.initState();
    farmCrop = widget.farmCrop;
       if (farmCrop.id != null) {
      context.read<FarmCropActivityCubit>().getFarmCropActivities(farmCrop.id!);
    }
    view = CropActivitiesView(controller: this);
  }

  @override
  Widget build(BuildContext context) {
    return view.build(context);
  }
}