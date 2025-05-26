import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/data/model/farm_visit.dart';
import '../../../../core/data/model/farmer.dart';
import '../../../../core/data/model/market.dart';
import '../../../../core/data/model/plot.dart';
import '../../../../core/data/model/product.dart';
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
    priceController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    priceController.dispose();
  }

  @override
  Product? selectedCrop;

  @override
  Farmer? selectedFarmer;

    @override
  Plot? selectedPlot;

  @override
  Market? selectedMarket;

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
  late TextEditingController priceController;

  @override
  void onSelectMarket(Market? newValue) {
    setState(() {
      selectedMarket = newValue!;
    });
  }

  @override
  void logVisit() async {
    if (formKey.currentState!.validate()) {
      FarmVisit visit = FarmVisit();
      visit.farmerId = selectedFarmer?.pk;

      context.read<FarmVisitCubit>().createFarmVisit(visit);
    }
  }

  @override
  void clearScreen() {
    setState(() {
      priceController.clear();
      selectedCrop = null;
      selectedMarket = null;
    });
  }
}
