import 'package:flutter/material.dart';
import '../../../../core/data/model/market_data.dart';
import '../contract/market_insight.dart';
import '../view/market_insight.dart';
import '../widget/market_price_preview_widget.dart';


class MarketInsightScreen extends StatefulWidget {
  const MarketInsightScreen({super.key});

  @override
  State<MarketInsightScreen> createState() => _MarketInsightScreenState();
}

class _MarketInsightScreenState extends State<MarketInsightScreen>
    implements MarketInsightControllerContract {
  late final MarketInsightViewContract view;

  @override
  late bool isSearching = false;
  @override
  late TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    isSearching = false;
    super.initState();
    view = MarketInsightView(controller: this);
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
    previewLogModal(MarketData data) {
    showModalBottomSheet(
        context:context,
        backgroundColor: Colors.transparent,
        builder: (context) {
          return MarketPricePreviewWidget(
            data: data,
          );
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

