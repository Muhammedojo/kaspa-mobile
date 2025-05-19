import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kaspa/core/data/model/lga.dart';
import '../../../../core/data/model/market.dart';
import '../../../../core/data/model/ward.dart';
import '../../../home/presentation/bloc/market/cubit.dart';
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
    nameController = TextEditingController();
    addressController = TextEditingController();
    sizeController = TextEditingController();
    marketDaysController = TextEditingController();
    marketTypeController = TextEditingController();

    view = ReportIncidentView(controller: this);
  }

  @override
  void dispose() {
    super.dispose();
    nameController.dispose();
    addressController.dispose();
    sizeController.dispose();
    marketDaysController.dispose();
    marketTypeController.dispose();
  }

  @override
  Ward? selectedWard;

  @override
  Lga? selectedLga;

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
  late TextEditingController nameController;
  @override
  late TextEditingController addressController;
  @override
  late TextEditingController sizeController;
  @override
  late TextEditingController marketDaysController;
  @override
  late TextEditingController marketTypeController;

  @override
  void reportIncident() async{
    if (formKey.currentState!.validate()) {
      if (selectedLga != null && selectedWard != null) {
        Market market = Market();
        market.name = nameController.text;
        market.address = addressController.text;
        market.size = 'Large';
        //sizeController.text;
        market.marketDays = 'Tuesdays';
        //marketDaysController.text;
       // market.marketType = 'Test';
        //marketTypeController.text;
        market.lgaId = selectedLga!.pk;
        market.wardId = selectedWard!.pk;

        context.read<MarketCubit>().createMarket(market);
      }
    }
  }

  @override
  void clearScreen() {
    setState(() {
      nameController.clear();
      addressController.clear();
      sizeController.clear();
      marketDaysController.clear();
      marketTypeController.clear();
      selectedLga = null;
      selectedWard = null;
    });

  }
  
}
