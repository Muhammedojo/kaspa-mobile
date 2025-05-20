import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../core/data/model/lga.dart';
import '../../../../core/data/model/ward.dart';
import '../../../../core/utils/contract.dart';

abstract class ReportIncidentControllerContract { 
  late GlobalKey<FormState> formKey;

  void onSelectWard(Ward? newValue);
  void onSelectLga(Lga? newValue);

  late TextEditingController titleController;
  late TextEditingController descriptionController;
  late TextEditingController imageController;

  late Ward? selectedWard;
  late Lga? selectedLga;


  final picker = ImagePicker();

  late List<File> imageFileList = [];

  Future<void> getImage(ImageSource source);

  void reportIncident();
  void removeImage(int index);
  void clearScreen();
}

abstract class ReportIncidentViewContract extends BaseViewContract {}
