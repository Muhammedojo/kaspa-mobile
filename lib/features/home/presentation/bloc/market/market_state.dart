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

class MarketNotLoaded extends MarketState {}

class MarketFailure extends MarketState {
  final String error;

  const MarketFailure(this.error);

  @override
  List<Object> get props => [error];

  @override
  String toString() => 'MarketFailure { error: $error }';
}
