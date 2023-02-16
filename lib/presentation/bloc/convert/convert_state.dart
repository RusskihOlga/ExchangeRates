part of 'convert_bloc.dart';

class ConvertState extends Equatable {
  @override
  List<Object?> get props => [];
}

class ConvertInitial extends ConvertState {}
class ErrorState extends ConvertState {}

class ShowCurrency extends ConvertState {
  final RateData rate;

  ShowCurrency(this.rate);

  @override
  List<Object?> get props => [rate];
}

class ShowResult extends ConvertState {
  final double result;

  ShowResult(this.result);

  @override
  List<Object?> get props => [result];
}

class ShowCurrencies extends ConvertState {
  final List<CurrencyData> currencies;

  ShowCurrencies(this.currencies);

  @override
  List<Object?> get props => [currencies];
}