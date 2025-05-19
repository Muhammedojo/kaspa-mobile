import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/data/model/market.dart';
import '../../../../core/data/model/market_data.dart';
import '../../../../core/data/model/product.dart';
import '../../../home/presentation/bloc/market_price/cubit.dart';
import '../contract/create_farm_visit.dart';
import '../view/create_farm_visit.dart';

class CreateFarmVisitScreen extends StatefulWidget {
  static const route = '/';
  const CreateFarmVisitScreen({super.key});

  @override
  State<CreateFarmVisitScreen> createState() =>
      _CreateFarmVisitScreenState();
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
  Market? selectedMarket;

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
  late TextEditingController priceController;

  @override
  void onSelectMarket(Market? newValue) {
    setState(() {
      selectedMarket = newValue!;
    });
  }

  @override
  void logPrice() async {
    if (formKey.currentState!.validate()) {
      if (selectedCrop != null && selectedMarket != null) {
        MarketData marketPrice = MarketData();
        marketPrice.price =
            double.tryParse(priceController.text) ?? 0.0; 
        marketPrice.productId = selectedCrop!.pk;
        marketPrice.marketId = selectedMarket!.pk;

        context.read<MarketPriceCubit>().addMarketPrice(marketPrice);
        priceController.clear();
      }
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
