import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import '../../../../core/data/model/farm_visit.dart';
import '../../../../core/data/model/farmer.dart';
import '../../../../core/data/model/plot.dart';
import '../../../../core/data/model/product.dart';
import '../../../../core/utils/function.dart';
import '../../../home/presentation/bloc/farm_visit/farm_visit_cubit.dart';
import '../contract/create_farm_visit.dart';
import '../view/create_farm_visit.dart';

class CreateFarmVisitScreen extends StatefulWidget {
  static const route = '/';
  const CreateFarmVisitScreen({super.key});

  @override
  State<CreateFarmVisitScreen> createState() => _CreateFarmVisitScreenState();
}

class _CreateFarmVisitScreenState extends State<CreateFarmVisitScreen>
    implements CreateFarmVisitControllerContract {
  late final CreateFarmVisitViewContract view;

  @override
  void initState() {
    super.initState();
    view = CreateFarmVisitView(controller: this);
    formKey = GlobalKey<FormState>();
    aolController = TextEditingController();
    totalAOLController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    aolController.dispose();
    totalAOLController.dispose();
  }

  @override
  Product? selectedCrop;

  @override
  Farmer? selectedFarmer;

  @override
  Plot? selectedPlot;

  @override
  void onSelectCrop(Product? newValue) {
    setState(() {
      selectedCrop = newValue!;
    });
  }

  @override
  void onSelectFarmer(Farmer? newValue) {
    setState(() {
      selectedFarmer = newValue;
      selectedPlot = null;
    });
  }

  @override
  void onSelectPlot(Plot? newValue) {
    setState(() {
      selectedPlot = newValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    return view.build(context);
  }

  @override
  late GlobalKey<FormState> formKey;

  @override
  late TextEditingController aolController;

  @override
  late TextEditingController totalAOLController;

  @override
  void logVisit() async {
    if (formKey.currentState!.validate()) {
     if (selectedFarmer == null) {
        Utils.showToastError(context, 'Please select a farmer', '', () {});
        return;
      }
      if (selectedPlot == null) {
        Utils.showToastError(
            context, 'Please select a plot for the farmer', '', () {});
        return;
      }
      if (selectedCrop == null) {
        Utils.showToastError(context, 'Please select a crop', '', () {});
        return;
      }
      FarmVisit visit = FarmVisit();
      visit.farmId = selectedPlot?.pk;
      visit.cropId = selectedCrop?.pk;
      visit.noOfHectares = double.parse(totalAOLController.text).round();

      GetIt.I.get<FarmVisitCubit>().createFarmVisit(visit);
    }
  }

  @override
  void clearScreen() {
    setState(() {
      aolController.clear();
      totalAOLController.clear();
      selectedCrop = null;
      selectedPlot = null;
      selectedFarmer = null;
    });
  }
}
