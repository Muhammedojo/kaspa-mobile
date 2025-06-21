import 'package:flutter/material.dart';
import '../../../../core/data/model/incident_report.dart';
import '../contract/incident_report.dart';
import '../view/incident_report.dart';
import '../widget/incident_report_preview_widget.dart';

class IncidentReportScreen extends StatefulWidget {
  const IncidentReportScreen({super.key});

  @override
  State<IncidentReportScreen> createState() => _IncidentReportScreenState();
}

class _IncidentReportScreenState extends State<IncidentReportScreen>
    implements IncidentReportControllerContract {
  late final IncidentReportViewContract view;

  @override
  late bool isSearching = false;
  @override
  late TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    isSearching = false;
    super.initState();
    view = IncidentReportView(controller: this);
  }

  @override
  void dispose() {
    super.dispose();
  }

    @override
  searchCooperative(String text) {
    // if(text.isNotEmpty) {
    //   GetIt.I.get<SearchFarmerCubit>().searchFarmers(text);
    // }
  }

   @override
  void updateSearchStatus(bool status){
    setState(() {
      isSearching = status;
    });
  }

  @override
    previewLogModal(IncidentReport data) {
    showModalBottomSheet(
        context:context,
        backgroundColor: Colors.transparent,
        builder: (context) {
          return IncidentReportPreviewWidget(
            data: data,
          );
        });
  }

  @override
  void onClearSearch() {
    searchController.clear();
    setState(() {
      isSearching = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return view.build(context);
  }
}
