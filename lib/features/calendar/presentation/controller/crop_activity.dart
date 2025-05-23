import 'package:flutter/material.dart';
import '../../../../core/data/model/crop.dart';
import '../contract/crop_activity.dart';
import '../view/crop_activity.dart';


class CropActivityScreen extends StatefulWidget {
  final Crop crop;
  const CropActivityScreen({super.key,required this.crop});

  @override
  State<CropActivityScreen> createState() => _CropActivityScreenState();
}

class _CropActivityScreenState extends State<CropActivityScreen>
    implements CropActivityControllerContract {
  late final CropActivityViewContract view;

  @override
  void initState() {
    super.initState();
    crop = widget.crop;
    view = CropActivityView(controller: this);
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return view.build(context);
  }

  @override
  Crop crop = Crop();
}
