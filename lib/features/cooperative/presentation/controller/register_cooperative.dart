import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:kaspa/core/data/model/lga.dart';
import 'package:kaspa/core/data/model/ward.dart';
import '../../../../core/data/model/cooperative.dart';
import '../contract/register_cooperative.dart';
import '../view/register_cooperative.dart';


class RegisterCooperativeScreen extends StatefulWidget {
  final Cooperative? cooperative;
  const RegisterCooperativeScreen({super.key, this.cooperative});

  @override
  State<RegisterCooperativeScreen> createState() => _RegisterCooperativeScreenState();
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
  late TextEditingController certificateNumberController;

  @override
  late TextEditingController doiController;

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
  void back() {
 
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

  @override
  void saveCooperative() async{
   
  }
}
