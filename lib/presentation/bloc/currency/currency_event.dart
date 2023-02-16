part of 'currency_bloc.dart';

class CurrencyEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class GetCurrencies extends CurrencyEvent {}

class SetFavorite extends CurrencyEvent {
  final String code;
  final bool status;

  SetFavorite({
    required this.code,
    required this.status,
  });

  @override
  List<Object?> get props => [code, status];
}
