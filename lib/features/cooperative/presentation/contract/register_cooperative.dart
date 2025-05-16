import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../core/data/model/cooperative.dart';
import '../../../../core/data/model/lga.dart';
import '../../../../core/data/model/ward.dart';
import '../../../../core/utils/contract.dart';

abstract class RegisterCooperativeControllerContract {
  late Cooperative? cooperative;

  late GlobalKey<FormState> formKey;
  void onSelectLga(Lga newValue);
  void onSelectWard(Ward newValue);

  late bool hasSubmitted;
  late Lga? selectedLga;
  late Ward? selectedWard;
  late ImagePicker picker;
  late TextEditingController nameController;
  late TextEditingController doiController;
  late TextEditingController certificateNumberController;

   void clearScreen();
   void saveCooperative();
   void back();


}

abstract class RegisterCooperativeViewContract extends BaseViewContract {}
