import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import '../../../../core/data/model/lga.dart';
import '../../../../core/data/model/market.dart';
import '../../../../core/data/model/market_data.dart';
import '../../../../core/data/model/product.dart';
import '../../../home/presentation/bloc/market_price/cubit.dart';
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
    volumeController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    priceController.dispose();
  }

  @override
  Lga? selectedLga;

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
  late TextEditingController priceController;

  @override
  late TextEditingController volumeController;

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
        marketPrice.price = priceController.text;
        marketPrice.productId = selectedCrop!.pk;
        marketPrice.marketId = selectedMarket!.pk;
        marketPrice.volume = volumeController.text;
        marketPrice.lgaId = selectedLga!.pk;

        GetIt.I.get<MarketPriceCubit>().addMarketPrice(marketPrice);
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
