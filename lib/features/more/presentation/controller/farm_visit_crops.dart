import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import '../../../../core/data/model/farm_visit.dart';
import '../../../../core/data/model/product.dart';
import '../../../../core/utils/function.dart';
import '../../../home/presentation/bloc/farm_visit/farm_visit_cubit.dart';
import '../contract/farm_visit_crops.dart';
import '../view/farm_visit_crops.dart';

class FarmVisitCropsScreen extends StatefulWidget {
  final FarmVisit visit;
  const FarmVisitCropsScreen({super.key, required this.visit});

  @override
  State<FarmVisitCropsScreen> createState() => _FarmVisitCropsScreenState();
}

class _FarmVisitCropsScreenState extends State<FarmVisitCropsScreen>
    implements FarmVisitCropsControllerContract {
  late final FarmVisitCropsViewContract view;

  @override
  void initState() {
    super.initState();
    visit = widget.visit;
    view = FarmVisitCropsView(controller: this);
    formKey = GlobalKey<FormState>();
    aolController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    aolController.dispose();
  }

  @override
  Product? selectedCrop;

  @override
  FarmVisit visit = FarmVisit();

  @override
  void onSelectCrop(Product? newValue) {
    setState(() {
      selectedCrop = newValue!;
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
  void addCrop() async {
    if (formKey.currentState!.validate()) {
      if (selectedCrop == null) {
        Utils.showToastError(context, 'Please select a crop', '', () {});
        return;
      }

      FarmVisit visit = FarmVisit();
      //visit.farmId = selectedPlot?.pk;
      visit.cropId = selectedCrop?.pk;
      visit.noOfHectares = double.parse(aolController.text).round();

      GetIt.I.get<FarmVisitCubit>().createFarmVisit(visit);
    }
  }
}
