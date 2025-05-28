part of 'market_price_cubit.dart';

sealed class MarketPriceState extends Equatable {
  const MarketPriceState();

  @override
  List<Object> get props => [];
}

class MarketPriceLoading extends MarketPriceState {}

class MarketPriceLoaded extends MarketPriceState {
  final List<MarketData> marketPriceList;

  const MarketPriceLoaded(this.marketPriceList);

  @override
  List<Object> get props => [marketPriceList];

  @override
  String toString() => 'MarketPriceLoaded { MarketPrice: $marketPriceList }';
}

class MarketPriceNotLoaded extends MarketPriceState {}

class CreateMarketPriceSuccess extends MarketPriceState {
  final MarketData marketPrice;
  const CreateMarketPriceSuccess(this.marketPrice);

  @override
  List<Object> get props => [marketPrice];
}

class MarketPriceFailure extends MarketPriceState {
  final String error;

  const MarketPriceFailure({required this.error});

  @override
  List<Object> get props => [error];

  @override
  String toString() => 'MarketPriceFailure { error: $error }';
}
