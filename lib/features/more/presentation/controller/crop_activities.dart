import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kaspa/core/utils/extensions.dart';
import '../../../../core/data/model/crop_activities.dart';
import '../../../../core/data/model/insight.dart';
import '../../../../core/theme/colors.dart';
import '../../../home/presentation/bloc/farm_crop_activity/farm_crop_activity_cubit.dart';
import '../contract/crop_activities.dart';
import '../view/crop_activities.dart';
import '../widget/activity_preview.dart';
import '../widget/advisory_loading.dart';

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
  previewLogModal(CropActivities data) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (context) {
        return ActivityPreviewWidget(data: data);
      },
    );

      
  }

  @override
  Widget build(BuildContext context) {
    return view.build(context);
  }
}
