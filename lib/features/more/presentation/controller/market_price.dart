import 'package:flutter/material.dart';
import '../contract/market_price.dart';
import '../view/market_price.dart';


class MarketPriceScreen extends StatefulWidget {
  const MarketPriceScreen({super.key});

  @override
  State<MarketPriceScreen> createState() => _MarketPriceScreenState();
}

class _MarketPriceScreenState extends State<MarketPriceScreen>
    implements MarketPriceControllerContract {
  late final MarketPriceViewContract view;

  @override
  late bool isSearching = false;
  @override
  late TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    isSearching = false;
    super.initState();
    view = MarketPriceView(controller: this);
  }

  @override
  void dispose() {
    super.dispose();
  }

    @override
  searchCooperative(String text) {
    // if(text.isNotEmpty) {
    //   GetIt.I.get<SearchFarmerCubit>().searchFarmers(text);
    // }
  }

   @override
  void updateSearchStatus(bool status){
    setState(() {
      isSearching = status;
    });
  }

  @override
  void onClearSearch() {
    searchController.clear();
    setState(() {
      isSearching = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return view.build(context);
  }
}

