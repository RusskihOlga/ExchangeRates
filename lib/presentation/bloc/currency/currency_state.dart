part of 'currency_bloc.dart';

class CurrencyState extends Equatable {
  @override
  List<Object?> get props => [];
}

class CurrencyInitial extends CurrencyState {}

class ShowCurrencies extends CurrencyState {
  final List<CurrencyData> currencies;

  ShowCurrencies(this.currencies);

  @override
  List<Object?> get props => [currencies];
}