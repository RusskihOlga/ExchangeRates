part of 'convert_bloc.dart';

class ConvertEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class GetCurrency extends ConvertEvent {
  final String? code;

  GetCurrency({this.code});

  @override
  List<Object?> get props => [code];
}

class Convert extends ConvertEvent {
  final String code;
  final String value;

  Convert({
    required this.code,
    required this.value,
  });

  @override
  List<Object?> get props => [code, value];
}

class GetCurrencies extends ConvertEvent {}
