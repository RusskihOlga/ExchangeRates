import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:exchange_rates/domain/repositories/currency_repository.dart';
import 'package:flutter/foundation.dart';

part 'chart_event.dart';

part 'chart_state.dart';

class ChartBloc extends Bloc<ChartEvent, ChartState> {
  final ICurrencyRepository repository;

  ChartBloc({
    required this.repository,
  }) : super(ChartInitial()) {
    on<LoadData>(_loadData);
    on<ChangeType>((event, emit) => emit(ShowType(event.type)));
  }

  void _loadData(LoadData event, Emitter<ChartState> emit) async {
    emit(Loading());

    try {
      var result = await repository.getArchives(event.type, event.code);
      emit(ShowChart(title: result.title, data: result.data));
    } catch (_) {
      emit(Error());
    }
  }
}
