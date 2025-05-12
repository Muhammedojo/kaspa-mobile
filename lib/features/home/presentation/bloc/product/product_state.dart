part of 'product_cubit.dart';

sealed class ProductState extends Equatable {
  const ProductState();

  @override
  List<Object> get props => [];
}

class ProductLoading extends ProductState {}

class ProductLoaded extends ProductState {
  final List<Product> productList;

  const ProductLoaded(this.productList);

  @override
  List<Object> get props => [productList];

  @override
  String toString() => 'ProductLoaded { Product: $productList }';
}

class ProductNotLoaded extends ProductState {}

class ProductFailure extends ProductState {
  final String error;

  const ProductFailure(this.error);

  @override
  List<Object> get props => [error];

  @override
  String toString() => 'ProductFailure { error: $error }';
}
