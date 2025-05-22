import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker_plus/flutter_datetime_picker_plus.dart';
import 'package:get_it/get_it.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:kaspa/core/data/model/lga.dart';
import 'package:kaspa/core/data/model/ward.dart';
import '../../../../core/data/model/cooperative.dart';
import '../../../../core/utils/date_utils.dart';
import '../../../home/presentation/bloc/bloc.dart';
import '../contract/register_cooperative.dart';
import '../view/register_cooperative.dart';

class RegisterCooperativeScreen extends StatefulWidget {
  final Cooperative? cooperative;
  const RegisterCooperativeScreen({super.key, this.cooperative});

  @override
  State<RegisterCooperativeScreen> createState() =>
      _RegisterCooperativeScreenState();
}

class _RegisterCooperativeScreenState extends State<RegisterCooperativeScreen>
    implements RegisterCooperativeControllerContract {
  late final RegisterCooperativeViewContract view;

  @override
  void initState() {
    super.initState();
    hasSubmitted = false;
    formKey = GlobalKey<FormState>();
    nameController = TextEditingController();
    certificateNumberController = TextEditingController();
    doiController = TextEditingController();
    selectedLga = null;
    selectedWard = null;
    imageController = TextEditingController();
    picker = ImagePicker();
    cooperative = widget.cooperative;
    view = RegisterCooperativeView(controller: this);
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
  Cooperative? cooperative = Cooperative();

  @override
  List<File> imageFileList = [];

  @override
  late TextEditingController certificateNumberController;

  @override
  late TextEditingController doiController;

  @override
  late TextEditingController imageController;

  @override
  late GlobalKey<FormState> formKey;

  @override
  late bool hasSubmitted;

  @override
  late TextEditingController nameController;

  @override
  late ImagePicker picker;

  @override
  Lga? selectedLga;

  @override
  Ward? selectedWard;

  @override
  void back() {}

  @override
  Future<void> getImage(ImageSource source) async {
    try {
      final pickedFile = await picker.pickImage(source: source);

      if (pickedFile != null && pickedFile.path.isNotEmpty) {
        try {
          setState(() {
            imageFileList.add(File(pickedFile.path));
            imageController = pickedFile.path as TextEditingController;
          });
        } catch (e) {
          // Handle face detection errors gracefully
        }
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
  Future<void> selectDate(BuildContext context) async {
    selectDateOfBirth(context);
  }

  final dateFormat = DateFormat("yyyy-MM-dd", Platform.localeName);

  void selectDateOfBirth(context) {
    DatePicker.showDatePicker(
      context,
      showTitleActions: true,
      minTime: DateTime(1900, 1, 1),
      maxTime: DateTime.now().subtract(const Duration(days: 5840)),

      onChanged: (date) {
        String dateString = dateFormat.format(date);
        doiController.text = dateString;
      },
      onConfirm: (date) {
        String dateString = dateFormat.format(date);
        doiController.text = dateString;
      },
      currentTime:
          doiController.text.trim().isNotEmpty
              ? DateTime.parse(doiController.text.trim())
              : DateTime.now(),
      locale: LocaleType.en,
    );
  }

  @override
  void clearScreen() {
    setState(() {
      nameController.clear();
      certificateNumberController.clear();
      doiController.clear();
      selectedLga = null;
      selectedWard = null;
      hasSubmitted = false;
    });
  }

  @override
  void onSelectLga(Lga? newValue) {
    setState(() {
      selectedLga = newValue!;
    });
  }

  @override
  void onSelectWard(Ward? newValue) {
    setState(() {
      selectedWard = newValue!;
    });
  }

    String generateTempFolioId() {
    return "CID-${selectedWard?.pk}-${DateAndTimeUtil.getCurrentTimeStamp()}";
  }

  @override
  void saveCooperative() async {
      var code = generateTempFolioId();
    if (formKey.currentState!.validate()) {
      if (imageFileList.isNotEmpty) {
        Cooperative cooperative = Cooperative();
        cooperative.code = code;
        cooperative.name = nameController.text;
        cooperative.certificateNumber = certificateNumberController.text;
        cooperative.doi = doiController.text;
        cooperative.lgaId = selectedLga?.pk;
        cooperative.wardId = selectedWard?.pk;
        cooperative.file = imageController.text;

        GetIt.I.get<CooperativeCubit>().createCooperative(cooperative);
      }
    }
  }
}
