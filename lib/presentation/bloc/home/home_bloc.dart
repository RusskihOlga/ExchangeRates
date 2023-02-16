import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:exchange_rates/domain/entities/rate_data.dart';
import 'package:exchange_rates/domain/repositories/currency_repository.dart';
import 'package:flutter/material.dart';

part 'home_event.dart';

part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final ICurrencyRepository repository;

  HomeBloc({required this.repository}) : super(HomeInitial()) {
    on<LoadRates>(_loadRates);
  }

  void _loadRates(LoadRates event, Emitter<HomeState> emit) async {
    emit(Loading());

    var data = await repository.getRates();
    emit(ShowRates(data));
  }
}
