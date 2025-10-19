import 'package:flutter/material.dart';
import '../../../../core/data/model/crop_calendar.dart';
import '../contract/crop_activity.dart';
import '../view/crop_activity.dart';


class CropActivityScreen extends StatefulWidget {
  final CropCalendar crop;
  const CropActivityScreen({super.key,required this.crop});

  @override
  State<CropActivityScreen> createState() => _CropActivityScreenState();
}

class _CropActivityScreenState extends State<CropActivityScreen>
    implements CropActivityControllerContract {
  late final CropActivityViewContract view;

   @override
  int selectedTabIndex = 0;

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
  void tabClick(int index) {
    setState(() {
      selectedTabIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return view.build(context);
  }

  @override
  CropCalendar crop = CropCalendar();
}
