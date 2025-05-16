part of 'market_cubit.dart';



sealed class MarketState extends Equatable {
  const MarketState();

  @override
  List<Object> get props => [];
}

class MarketLoading extends MarketState {}

class MarketLoaded extends MarketState {
  final List<Market> marketList;

  const MarketLoaded(this.marketList);

  @override
  List<Object> get props => [marketList];

  @override
  String toString() => 'MarketLoaded { Market: $marketList }';
}

class LogMarketPriceSuccess extends MarketState {
  final MarketData marketData;
  const LogMarketPriceSuccess(this.marketData);

  @override
  List<Object> get props => [marketData];
}

class CreateMarketSuccess extends MarketState {
  final Market market;
  const CreateMarketSuccess(this.market);

  @override
  List<Object> get props => [market];
}

class MarketNotLoaded extends MarketState {
}

class MarketFailure extends MarketState {
  final Failure error;

  const MarketFailure(this.error);

  @override
  List<Object> get props => [error];

  @override
  String toString() => 'MarketFailure { error: $error }';
}
