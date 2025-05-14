import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kaspa/core/data/model/market.dart';
import '../../../../core/data/model/model.dart';
import '../../../../core/data/model/product.dart';
import '../../../home/presentation/bloc/market/cubit.dart';
import '../contract/create_market_price.dart';
import '../view/create_market_price.dart';

class CreateMarketPriceScreen extends StatefulWidget {
  static const route = '/';
  const CreateMarketPriceScreen({super.key});

  @override
  State<CreateMarketPriceScreen> createState() =>
      _CreateMarketPriceScreenState();
}

class _CreateMarketPriceScreenState extends State<CreateMarketPriceScreen>
    implements CreateMarketPriceControllerContract {
  late final CreateMarketPriceViewContract view;

  @override
  void initState() {
    super.initState();
    view = CreateMarketPriceView(controller: this);
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
        Market marketPrice = Market();
        marketPrice.price =
            double.tryParse(priceController.text) ?? 0.0; 
        marketPrice.productId = selectedCrop!.pk;
        marketPrice.marketId = selectedMarket!.pk;

        context.read<MarketCubit>().addMarketPrice(marketPrice);
        priceController.clear();
      }
    }
  }
}
