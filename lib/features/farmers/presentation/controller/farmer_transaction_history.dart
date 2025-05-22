import 'package:flutter/material.dart';
import '../../../../core/data/model/farmer.dart';
import '../contract/farmer_transaction_history.dart';
import '../view/farmer_transaction_history.dart';


class FarmerTransactionHistoryScreen extends StatefulWidget {
  final Farmer farmer;
  const FarmerTransactionHistoryScreen({super.key,required this.farmer});

  @override
  State<FarmerTransactionHistoryScreen> createState() => _FarmerTransactionHistoryScreenState();
}

class _FarmerTransactionHistoryScreenState extends State<FarmerTransactionHistoryScreen>
    implements FarmerTransactionHistoryControllerContract {
  late final FarmerTransactionHistoryViewContract view;

  @override
  void initState() {
    super.initState();
    farmer = widget.farmer;
    view = FarmerTransactionHistoryView(controller: this);
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
  Farmer farmer = Farmer();
}
