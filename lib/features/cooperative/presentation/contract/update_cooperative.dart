import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../../../../core/data/model/cooperative.dart';
import '../../../../core/data/model/lga.dart';
import '../../../../core/data/model/ward.dart';
import '../../../../core/utils/contract.dart';

abstract class UpdateCooperativeControllerContract {
  late Cooperative? cooperative;

  late GlobalKey<FormState> formKey;
  void onSelectLga(Lga? newValue);
  void onSelectWard(Ward? newValue);

  late bool hasSubmitted;
  late Lga? selectedLga;
  late Ward? selectedWard;
  late TextEditingController nameController;
  late TextEditingController doiController;
  late TextEditingController certificateNumberController;
  late TextEditingController imageController;

  final picker = ImagePicker();
  void removeImage(int index);
  late List<File> imageFileList = [];

  Future<void> getImage(ImageSource source);

  void clearScreen();
  Future<void> selectDate(BuildContext context);
  void updateCooperative();
  void back();
}

abstract class UpdateCooperativeViewContract extends BaseViewContract {}
