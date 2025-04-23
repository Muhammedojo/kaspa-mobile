part of 'bank_cubit.dart';


sealed class BankState extends Equatable {
  const BankState();

  @override
  List<Object> get props => [];
}

class BankLoading extends BankState {}

class BankLoaded extends BankState {
  final List<Bank> bankList;

  const BankLoaded(this.bankList);

  @override
  List<Object> get props => [bankList];

  @override
  String toString() => 'BankLoaded { Bank: $bankList }';
}

class BankNotLoaded extends BankState {}

class BankFailure extends BankState {
  final String error;

  const BankFailure(this.error);

  @override
  List<Object> get props => [error];

  @override
  String toString() => 'BankFailure { error: $error }';
}
