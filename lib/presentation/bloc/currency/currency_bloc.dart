import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:exchange_rates/domain/entities/currency_data.dart';
import 'package:exchange_rates/domain/repositories/currency_repository.dart';
import 'package:flutter/material.dart';

part 'currency_event.dart';

part 'currency_state.dart';

class CurrencyBloc extends Bloc<CurrencyEvent, CurrencyState> {
  final ICurrencyRepository repository;

  CurrencyBloc({
    required this.repository,
  }) : super(CurrencyInitial()) {
    on<GetCurrencies>(_loadCurrencies);
    on<SetFavorite>(
      (event, emit) => repository.changeFavorite(
        event.code,
        event.status,
      ),
    );
  }

  void _loadCurrencies(GetCurrencies event, Emitter<CurrencyState> emit) {
    var data = repository.getCurrencies();
    emit(ShowCurrencies(data));
  }
}
