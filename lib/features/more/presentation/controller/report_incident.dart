import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import '../../../../core/data/model/incident_report.dart';
import '../../../../core/data/model/lga.dart';
import '../../../../core/data/model/ward.dart';
import '../../../home/presentation/bloc/incident_report/incident_report_cubit.dart';
import '../contract/report_incident.dart';
import '../view/report_incident.dart';

class ReportIncidentScreen extends StatefulWidget {
  static const route = '/';
  const ReportIncidentScreen({super.key});

  @override
  State<ReportIncidentScreen> createState() => _ReportIncidentScreenState();
}

class _ReportIncidentScreenState extends State<ReportIncidentScreen>
    implements ReportIncidentControllerContract {
  late final ReportIncidentViewContract view;

  @override
  void initState() {
    super.initState();

    formKey = GlobalKey<FormState>();
    titleController = TextEditingController();
    descriptionController = TextEditingController();
    imageController = TextEditingController();
    selectedLga = null;
    selectedWard = null;
    view = ReportIncidentView(controller: this);
  }

  @override
  void dispose() {
    super.dispose();
    titleController.dispose();
    descriptionController.dispose();
  }

  @override
  Ward? selectedWard;

  @override
  Lga? selectedLga;

  @override
  String? selectedCategory;

  @override
  List<File> imageFileList = [];

  @override
  final picker = ImagePicker();

  @override
  void onSelectWard(Ward? newValue) {
    setState(() {
      selectedWard = newValue!;
    });
  }

  @override
  void onSelectLga(Lga? newValue) {
    setState(() {
      selectedLga = newValue!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return view.build(context);
  }

  @override
  late GlobalKey<FormState> formKey;

  @override
  late TextEditingController imageController;

  @override
  late TextEditingController titleController;
  @override
  late TextEditingController descriptionController;

  @override
  void reportIncident() async {
    final today = DateTime.now();
    final formattedToday = DateFormat('yyyy-MM-dd').format(today);
    if (formKey.currentState!.validate()) {
      if (selectedLga != null && selectedWard != null) {
        IncidentReport report = IncidentReport();
        // report.image = imageFileList;
        report.description = descriptionController.text;
        report.title = titleController.text;
        report.category = selectedCategory.toString();
        report.wardId = selectedWard?.pk;
        report.date = formattedToday.toString();

        GetIt.I.get<IncidentCubit>().logIncidentReport(report);
      }
    }
  }

  @override
  Future<void> getImage(ImageSource source) async {
    try {
      final pickedFile = await picker.pickImage(source: source);

      if (pickedFile != null && pickedFile.path.isNotEmpty) {
        setState(() {
          imageFileList.add(File(pickedFile.path));
        });
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  @override
  void removeImage(int index) {
    imageFileList.removeAt(index);
    setState(() {});
  }

  @override
  void onSelectCategory(String? newValue) {
    setState(() {
      selectedCategory = newValue!;
    });
  }

  @override
  void clearScreen() {
    setState(() {
      titleController.clear();
      descriptionController.clear();
      selectedLga = null;
      selectedWard = null;
    });
  }
}
